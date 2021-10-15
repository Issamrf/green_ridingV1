import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUp = TextEditingController();
  TextEditingController dropOff = TextEditingController();
  var DBRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    // String placeAdress = Provider.of<AppData>(context).pickUpLocation.placeName;
    // pickUp.text = placeAdress;

    return Scaffold(
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
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back)),
                          Center(
                            child: Text(
                              "Ihr Ziel",
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
                          addplace();
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
  void addplace() {
    //var user;
    DBRef.child("Rides").set({
      "name": "Issam",
      "pickUp": pickUp.text,
      "dropOff": dropOff.text,
    });
  }
}
