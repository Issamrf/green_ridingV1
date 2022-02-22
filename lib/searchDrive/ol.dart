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

class ShowPath extends StatefulWidget {
  @override
  _ShowPathState createState() => _ShowPathState();
}

//GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(apikey:"AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o");
FocusNode myFocusNode1 = new FocusNode();
FocusNode myFocusNode2 = new FocusNode();
FocusNode myFocusNode3 = new FocusNode();
FocusNode myFocusNode4 = new FocusNode();
Directions? info;

class _ShowPathState extends State<ShowPath> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  late GoogleMapController controller;

  List<LatLng> latlngSegment1 = [];
  List<LatLng> latlngSegment2 = [];
  // this set will hold my markers

  // this will hold the generated polylines
  Set<Polyline> _polylines = {};
  // this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
  // this is the key object - the PolylinePoints
  // which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o";
  // for my custom icons

  LatLng _lastMapPosition = LatLng(49.374137, 8.673885);

  @override
  void initState() {
    super.initState();
    getlocations();
  }

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

  var directions;
  bool isloading = false;
  getlocations() async {
    setState(() {
      isloading = true;
    });
    await DirectionsRepository().getDirections().then((value) => {
          directions = value,
          print("my directionss are $directions"),
          for (int i = 0; i < value['segments'].length; i++)
            {
              latlngSegment1.add(LatLng(value['segments'][i]['start_lat'],
                  value['segments'][i]['start_lng'])),
              latlngSegment2.add(LatLng(value['segments'][i]['end_lat'],
                  value['segments'][i]['end_lng'])),
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

  getdirections() async {}

  @override
  Widget build(BuildContext context) {
    this.setSourceAndDestinationMarkerIcons(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          automaticallyImplyLeading: false,
          //leading: Icon(Icons.arrow_back_ios, color: Colors.black),

          title: Text(
            '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff6A6A6A)),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
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
                        itemBuilder: (context, i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "RIDE ${i + 1}",
                                    style: TextStyle(
                                        //color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff6A6A6A)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      Text(
                                        "${directions['segments'][i]['vehicletype']} " +
                                            " ${directions['segments'][i]['vehicleid'].toString()}",
                                        style: TextStyle(
                                          //color: Colors.green,
                                          fontSize: 15,
                                        ),
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
                              ],
                            ))
                  ],
                ),
                body: GoogleMap(
                  //that needs a list<Polyline>
                  polylines: _polyline,
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _lastMapPosition,
                    zoom: 12.0,
                  ),
                  mapType: MapType.normal,
                ),
              ));
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 5,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 5,
        color: Colors.blue,
      ));
    });
  }
}
