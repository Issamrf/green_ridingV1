import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_riding/dataHandler/appData.dart';
import 'package:green_riding/searchDrive/searchScreen.dart';
import 'package:green_riding/searchDrive/segmentsModel.dart';
import 'package:green_riding/services/assistantMethods.dart';
import 'package:green_riding/widgets/devider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../services/requests.dart';

class ShowPath extends StatefulWidget {
  @override
  _ShowPathState createState() => _ShowPathState();
}

List<Marker> allMarkers = [];
final Set<Polyline> polyline = {};
//GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(apikey:"AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o");
FocusNode myFocusNode1 = new FocusNode();
FocusNode myFocusNode2 = new FocusNode();
FocusNode myFocusNode3 = new FocusNode();
FocusNode myFocusNode4 = new FocusNode();

class _ShowPathState extends State<ShowPath> {
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomMapPadding = 0.0;

  Future fetchSgments() async {
    http.Response response = await http.get(
        Uri.parse('https://poc-api-vcoxoy66iq-uw.a.run.app//segments/latest'));
    var jasonData = jsonDecode(response.body);
    List<SegmentsModel> segments = [];
    for (var s in jasonData) {
      SegmentsModel segment = SegmentsModel(
        vehicletype: s['vehicletype'],
        start_lat: s['start_lat'].toString(),
        start_lng: s['start_lng'].toString(),
        end_lat: s['end_lat'].toString(),
        end_lng: s['end_lng'].toString(),
      );
      segments.add(segment);
      print(segments[0].end_lat);

      return segments;
    }
  }

  Future reverseGeocoding(var lat, var lng) async {
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o";
    http.Response response = await http.get(Uri.parse(url));
    var jasonData = jsonDecode(response.body);

    var placeAdress = jasonData["results"][0]["formatted_address"];
    print(placeAdress);
    return placeAdress;
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlingPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlingPosition, zoom: 7);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String adress =
        await AssistantMethods.searchCoordinateAddress(position, context);
    print("this is your Adress:: " + adress);
  }

  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(49.398750, 8.672434),
    zoom: 14.4746,
  );
  var values;
  List mydata = [];
  List<Marker> allMarker = [];
  getgeocode() async {
    for (int i = 0; i < values.length; i++) {
      await reverseGeocoding(
        double.parse(values[i].start_lat),
        double.parse(values[i].start_lng),
      ).then((value) => [mydata.add(value)]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(49.408902, 8.704699),
        infoWindow: InfoWindow(title: 'place')));
    allMarkers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(49.410233, 8.692445),
        infoWindow: InfoWindow(title: 'place')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                fetchSgments();
              },
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Color(0xff6A6A6A),
              ),
            ),
          ],
          //leading: Icon(Icons.arrow_back_ios, color: Colors.black),

          title: Text(
            '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff6A6A6A)),
          )),
      body: Stack(
        children: [
          GoogleMap(
              padding: EdgeInsets.only(bottom: bottomMapPadding),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: kGooglePlex,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              markers: Set.from(allMarkers),
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                setState(() {
                  bottomMapPadding = 300.0;
                });
                //locatePosition();
              }),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                  child: Card(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.car_repair,
                            size: 35,
                          ),
                          Text(
                            "Altstadt Transfer Center",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.car_repair,
                            size: 35,
                          ),
                          Text(
                            "Bismarkplatz Transfer Center",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
