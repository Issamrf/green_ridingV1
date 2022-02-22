import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_riding/dataHandler/appData.dart';
import 'package:green_riding/searchDrive/searchScreen.dart';
import 'package:green_riding/searchDrive/showPath.dart';
import 'package:green_riding/services/assistantMethods.dart';
import 'package:green_riding/widgets/devider.dart';
import 'package:provider/provider.dart';

class ChooseRide extends StatefulWidget {
  @override
  _ChooseRideState createState() => _ChooseRideState();
}

final image = AssetImage("assets/car3.png");
FocusNode myFocusNode1 = new FocusNode();
FocusNode myFocusNode2 = new FocusNode();
FocusNode myFocusNode3 = new FocusNode();
FocusNode myFocusNode4 = new FocusNode();

class _ChooseRideState extends State<ChooseRide> {
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomMapPadding = 0.0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlingPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlingPosition, zoom: 14);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          automaticallyImplyLeading: false,
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
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: Column(
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color(0xff6A6A6A)),
                    ),
                    SizedBox(height: 20.0),
                    ListTile(
                        leading: SizedBox(
                            height: 100.0,
                            width: 100.0, // fixed width and height
                            child: Image(
                              image: image,
                            )),
                        title: const Text("Smart Transit"),
                        subtitle: const Text('Bequem und günstig fahren.'),
                        trailing: Text(
                          "3,50 €",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color(0xff90bc5a)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowPath()));
                        }),
                    SizedBox(height: 10.0),
                    DividerWidget(),
                    SizedBox(height: 10.0),
                    ListTile(
                        leading: SizedBox(
                            height: 100.0,
                            width: 100.0, // fixed width and height
                            child: Image(
                              image: image,
                            )),
                        title: const Text("Direkte Fahrt"),
                        subtitle: const Text('Fahrer Benachrichtigen'),
                        trailing: Text(
                          "7,20 €",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color(0xff90bc5a)),
                        ),
                        onTap: () => print("ListTile")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
