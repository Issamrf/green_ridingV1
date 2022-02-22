import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/devider.dart';
import 'DirectionsModel.dart';
import 'directionRepo.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class ShowPath extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowPathState();
}

class ShowPathState extends State<ShowPath> {
  Completer<GoogleMapController> _controller = Completer();

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
    Uint8List markerIcon = await getBytesFromAsset('assets/dot.png', 40);
    sourceIcon = BitmapDescriptor.fromBytes(markerIcon);
  }

  // this set will hold my markers
  Set<Marker> _markers = {};
  // this will hold the generated polylines
  Set<Polyline> _polylines = {};
  // this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
  // this is the key object - the PolylinePoints
  // which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o";
  // for my custom icons

  @override
  void initState() {
    super.initState();

    getlocations();
  }

  var directions;
  bool isloading = false;
  List<LatLng> latlngSegment1 = [];
  List<LatLng> latlngSegment2 = [];
  getlocations() async {
    setState(() {
      isloading = true;
    });
    await DirectionsRepository().getDirections().then((value) async => {
          directions = value,
          print("my directionss are $directions"),
          for (int i = 0; i < value['segments'].length; i++)
            {
              latlngSegment1.add(LatLng(value['segments'][i]['start_lat'],
                  value['segments'][i]['start_lng'])),
              latlngSegment2.add(LatLng(value['segments'][i]['end_lat'],
                  value['segments'][i]['end_lng'])),
              await setPolylines(
                  value['segments'][i]['start_lat'],
                  value['segments'][i]['start_lng'],
                  value['segments'][i]['end_lat'],
                  value['segments'][i]['end_lng']),
              setState(() {
                _markers.add(Marker(
                  // This marker id can be anything that uniquely identifies each marker.
                  markerId: MarkerId(latlngSegment1[i].toString()),
                  //_lastMapPosition is any coordinate which should be your default
                  //position when map opens up
                  position: latlngSegment1[i], icon: sourceIcon,

                  infoWindow: InfoWindow(
                    title: '${value['segments'][i]['start']}',
                    snippet: 'Location',
                  ),
                ));
                i == (value['segments'].length - 1)
                    ? _markers.add(Marker(
                        // This marker id can be anything that uniquely identifies each marker.
                        markerId: MarkerId(latlngSegment2[i].toString()),
                        //_lastMapPosition is any coordinate which should be your default
                        //position when map opens up
                        position: latlngSegment2[i],

                        infoWindow: InfoWindow(
                          title: '${value['segments'][i]['end']}',
                          snippet: 'Location',
                        ),
                      ))
                    : _markers.add(Marker(
                        // This marker id can be anything that uniquely identifies each marker.
                        markerId: MarkerId(latlngSegment2[i].toString()),
                        //_lastMapPosition is any coordinate which should be your default
                        //position when map opens up
                        position: latlngSegment2[i], icon: sourceIcon,

                        infoWindow: InfoWindow(
                          title: '${value['segments'][i]['end']}',
                          snippet: 'Location',
                        ),
                      ));
              })
            }
        });

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.setSourceAndDestinationMarkerIcons(context);
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: LatLng(49.374137, 8.673885));
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SlidingUpPanel(
              panel: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Trip Schedule',
                    style: TextStyle(
                        color: Color(0xff90bc5a),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: directions['segments'].length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${directions['segments'][i]['start_time'].toString().split("T")[1].toString().split(".")[0]} " +
                                " ${directions['segments'][i]['start']}",
                            style: TextStyle(
                              //color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                directions['segments'][i]['vehicletype'] ==
                                        "bus"
                                    ? Icons.directions_bus_filled_outlined
                                    : Icons.directions_car_filled_outlined,
                                color: Color(0xff90bc5a),
                              ),
                              Text(
                                "${directions['segments'][i]['vehicleid'].toString()}",
                                style: TextStyle(
                                  //color: Colors.green,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "${directions['segments'][i]['end_time'].toString().split("T")[1].toString().split(".")[0]} " +
                                  " ${directions['segments'][i]['end']}",
                              style: TextStyle(
                                //color: Colors.green,
                                fontSize: 15,
                              )),
                          SizedBox(
                            height: 7,
                          ),
                          DividerWidget(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              body: GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: true,
                  tiltGesturesEnabled: false,
                  markers: _markers,
                  polylines: _polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  onMapCreated: onMapCreated)),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    // controller.setMapStyle(Utils.mapStyles);
    _controller.complete(controller);
  }

  PolylineResult result = PolylineResult();
  setPolylines(startlat, startlng, endlat, endlng) async {
    result.points = [];
    result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPIKey,
      PointLatLng(
        startlat,
        startlng,
      ),
      PointLatLng(endlat, endlng),
    );
    if (result.points.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId(startlat.toString()),
          color: Color(0xff90bc5a),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }
}
