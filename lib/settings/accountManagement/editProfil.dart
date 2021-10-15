import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_riding/screens/profile/profileWidget/profileWidget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  List userProfilesList = [];
  var userID;
  var group;
  var group2;
  var group3;

  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();
  FocusNode myFocusNode8 = new FocusNode();
  TextEditingController formAbout = TextEditingController();
  TextEditingController formBirthday = TextEditingController();
  TextEditingController formCity = TextEditingController();
  //TextEditingController formEmail = TextEditingController();
  TextEditingController formName = TextEditingController();
  TextEditingController formKids = TextEditingController();
  TextEditingController formAbTime = TextEditingController();
  TextEditingController formAb = TextEditingController();
  TextEditingController formAnTime = TextEditingController();
  TextEditingController formAn = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Daten Bearbeiten",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xff6A6A6A),
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(30),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                ifEdit: true,
                onPressed: () async {},
                imageDirection: '',
              ),
              const SizedBox(height: 24),
              TextFormField(
                focusNode: myFocusNode1,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "Vorname",
                  labelStyle: TextStyle(
                      color: myFocusNode1.hasFocus
                          ? Color(0xff90bc5a)
                          : Color(0xff90bc5a)),
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
              const SizedBox(height: 24),
              TextFormField(
                focusNode: myFocusNode2,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "Nachname",
                  labelStyle: TextStyle(
                      color: myFocusNode2.hasFocus
                          ? Color(0xff90bc5a)
                          : Color(0xff90bc5a)),
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
              const SizedBox(height: 24),
              TextFormField(
                focusNode: myFocusNode3,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "Telefonnumer",
                  labelStyle: TextStyle(
                      color: myFocusNode3.hasFocus
                          ? Color(0xff90bc5a)
                          : Color(0xff90bc5a)),
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
              const SizedBox(height: 24),
              TextFormField(
                maxLines: 8,
                focusNode: myFocusNode4,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "Über mich",
                  labelStyle: TextStyle(
                      color: myFocusNode3.hasFocus
                          ? Color(0xff90bc5a)
                          : Color(0xff90bc5a)),
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
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rauchen Erlaubt ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff6A6A6A),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Ja",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 1,
                              groupValue: group,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Nein",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 2,
                              groupValue: group,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tiere Erlaubt       ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff6A6A6A),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Ja",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 3,
                              groupValue: group2,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group2 = T;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Nein",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 4,
                              groupValue: group2,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group2 = T;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Geimpft                ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff6A6A6A),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Ja",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 5,
                              groupValue: group3,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group3 = T;
                                });
                              })
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Nein",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff6A6A6A),
                            ),
                          ),
                          Radio(
                              value: 6,
                              groupValue: group3,
                              onChanged: (T) {
                                print(T);
                                setState(() {
                                  group3 = T;
                                });
                              })
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tägliche Strecke",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff6A6A6A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        focusNode: myFocusNode5,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.timer,
                            color: Color(0xff90bc5a),
                          ),
                          labelText: "zeit",
                          labelStyle: TextStyle(
                              color: myFocusNode5.hasFocus
                                  ? Color(0xff90bc5a)
                                  : Color(0xff90bc5a)),
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
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        focusNode: myFocusNode6,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Color(0xff90bc5a),
                          ),
                          labelText: "Abfahrt",
                          labelStyle: TextStyle(
                              color: myFocusNode6.hasFocus
                                  ? Color(0xff90bc5a)
                                  : Color(0xff90bc5a)),
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
                    ),
                  ]),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          focusNode: myFocusNode7,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.timer,
                              color: Color(0xff90bc5a),
                            ),
                            labelText: "zeit",
                            labelStyle: TextStyle(
                                color: myFocusNode7.hasFocus
                                    ? Color(0xff90bc5a)
                                    : Color(0xff90bc5a)),
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
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          focusNode: myFocusNode8,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff90bc5a),
                            ),
                            labelText: "Ankunft",
                            labelStyle: TextStyle(
                                color: myFocusNode8.hasFocus
                                    ? Color(0xff90bc5a)
                                    : Color(0xff90bc5a)),
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
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: MaterialButton(
                  child: Text(
                    "Speichern",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  minWidth: 120,
                  height: 60,
                  onPressed: () {},
                  color: Color(0xff90bc5a),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
