import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_riding/models/placePredictions.dart';
import 'package:green_riding/searchDrive/predictionTile.dart';
import 'package:green_riding/searchDrive/ridesModel.dart';
import 'package:green_riding/searchDrive/showPath.dart';
import 'package:green_riding/services/requests.dart';

import 'package:http/http.dart' as http;

import 'chooseRide.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<RidesModel>? ridesPost;
  TextEditingController pickUp = TextEditingController();
  TextEditingController dropOff = TextEditingController();
  TextEditingController timeField = TextEditingController();
  var name = '';
  var uid = FirebaseAuth.instance.currentUser?.uid;
  List<PlacePredictions> placePredictionList = [];
  getGoogleAddresslat(address) async {
    const _host = 'https://maps.google.com/maps/api/geocode/json';
    const apiKey = "AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o";
    var encoded = Uri.encodeComponent(address);
    final uri = Uri.parse('$_host?key=$apiKey&address=$encoded');

    http.Response response = await http.get(uri);
    final responseJson = json.decode(response.body);
    var lat = responseJson['results'][0]['geometry']['location']['lat'];
    var lng = responseJson['results'][0]['geometry']['location']['lng'];
    //print(responseJson['results'][0]['geometry']['location']['lat']);

    return lat.toString() + "," + lng.toString();
  }

  @override
  Widget build(BuildContext context) {
    // String placeAdress = Provider.of<AppData>(context).pickUpLocation.placeName;
    // pickUp.text = placeAdress;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () async {
                var drop = await getGoogleAddresslat(dropOff.text);
                var endLat = drop.toString().split(",")[0];
                print("the end lat is is ${endLat}");
                var endLng = drop.toString().split(",")[1];
                print("the endLng is is ${endLng}");
                var picku = await getGoogleAddresslat(pickUp.text);
                print("the pickup location is ${picku}");
                var startLat = picku.toString().split(",")[0];
                print("the startLat location is ${startLat}");
                var startLng = picku.toString().split(",")[1];
                print("the startLng location is ${startLng}");
                setState(() {
                  ridesPost = createRides(
                      name,
                      pickUp.text,
                      dropOff.text,
                      timeField.text,
                      double.parse(startLat),
                      double.parse(startLng),
                      double.parse(endLat),
                      double.parse(endLng));
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChooseRide()));
              },
              color: Color(0xff90bc5a),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 250.0,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color(0xff90bc5a),
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 07)),
              ]),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, top: 20.0, bottom: 20.0, right: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 5.0),
                      Stack(
                        children: [
                          Center(
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand-Bold"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val) {
                          findPlace(val);
                        },
                        controller: pickUp,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Color(0xff90bc5a),
                          ),
                          hintText: "Start",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff90bc5a)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color(0xff90bc5a),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      TextFormField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (val) {
                          findPlace(val);
                        },
                        controller: dropOff,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Color(0xff90bc5a),
                          ),
                          hintText: "Ziel",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff90bc5a)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color(0xff90bc5a),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          focusNode: myFocusNode3,
                          controller: timeField,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.timer,
                              color: Color(0xff90bc5a),
                            ),
                            hintText: "Zeit",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xff90bc5a)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xff90bc5a),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          (placePredictionList.length > 0)
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListView.separated(
                    padding: EdgeInsets.all(0.0),
                    itemBuilder: (context, index) {
                      return PredictionTile(
                        placePredictions: placePredictionList[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      thickness: 1.5,
                      color: Color(0xff90bc5a),
                    ),
                    itemCount: placePredictionList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future<RidesModel> createRides(
    name,
    start,
    end,
    time,
    startLat,
    startLng,
    endLat,
    endLng,
  ) async {
    final response = await http.post(
      Uri.parse('https://poc-api-vcoxoy66iq-uw.a.run.app/rides'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(<dynamic, dynamic>{
        "name": "",
        "start": pickUp.text,
        "end": dropOff.text,
        "time": timeField.text,
        "start_lat": startLat,
        "start_lng": startLng,
        "end_lat": endLat,
        "end_lng": endLng,
      }),
    );

    if (response.statusCode == 200) {
      print("Data Submitted");
      return RidesModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create.');
    }
  }

  void findPlace(String placeName) async {
    String mapKey = "AIzaSyBzaRTK2dTkKxQuK0a_OUn-lo611r_C-6o";
    if (placeName.length > 1) {
      String url =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890&components=country:de";

      var res = await Requests.getRequest(url);
      if (res == "failed") {
        return;
      } else if (res["status"] == "OK") {
        var predictions = res["predictions"];
        var placesList = (predictions as List)
            .map((e) => PlacePredictions.fromJson(e))
            .toList();
        setState(() {
          placePredictionList = placesList;
        });
      }
    }
  }
}
