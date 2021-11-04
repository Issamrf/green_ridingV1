import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_riding/searchDrive/ridesModel.dart';

import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<RidesModel>? ridesPost;
  TextEditingController pickUp = TextEditingController();
  TextEditingController dropOff = TextEditingController();
  var DBRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  DateTime currentPhoneDate = DateTime.now();
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    // String placeAdress = Provider.of<AppData>(context).pickUpLocation.placeName;
    // pickUp.text = placeAdress;

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
      body: Column(
        children: [
          Container(
              height: 270.0,
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
                      MaterialButton(
                        minWidth: 120,
                        height: 60,
                        onPressed: () async {
                          setState(() {
                            ridesPost =
                                createRides("Sam", pickUp.text, dropOff.text);
                          });
                        },
                        color: Color(0xff90bc5a),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Suchen",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  //void findPlace(String placeName) {
  // String mapKey = "AIzaSyC6nZUnGGN8HZlZX-jNgivAEsTs6JQJ_xw";

  //if (placeName.length > 1) {
  // String autofill =
  //   "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&language=en&key=$mapKey";
  // }
  //}
  var p = "hegenischstr. 10, 69124, Heidelberg";
  var g = "hardtstraße, 96, 69124, Heidelberg";

  var now = DateTime.now().toString();

  void addplace() {
    Map ridesDataMap = {
      "name": "Mattias",
      "pickUp": pickUp.text,
      "dropOff": dropOff.text,
      "time": now,
    };
    var ridesId = "87476EF";
    //var user;
    DBRef.child("Rides").child(ridesId).set(ridesDataMap);
  }

  Future<RidesModel> createRides(String name, String start, String end) async {
    final response = await http.post(
      Uri.parse('https://poc-api-vcoxoy66iq-uw.a.run.app/rides'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": "Mattias",
        "start": pickUp.text,
        "end": dropOff.text,
      }),
    );

    if (response.statusCode == 200) {
      print("Data Submitted");
      return RidesModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create a ride.');
    }
  }
}
