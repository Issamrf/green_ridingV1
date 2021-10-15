import 'package:flutter/material.dart';

class CreateDrive extends StatefulWidget {
  @override
  _CreateDriveState createState() => _CreateDriveState();
}

FocusNode myFocusNode1 = new FocusNode();
FocusNode myFocusNode2 = new FocusNode();
FocusNode myFocusNode3 = new FocusNode();
FocusNode myFocusNode4 = new FocusNode();

class _CreateDriveState extends State<CreateDrive> {
  //TexrEditingController searchText = new TexrEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          automaticallyImplyLeading: false,
          //leading: Icon(Icons.arrow_back_ios, color: Colors.black),

          title: Text(
            'Fahrt Planen',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff6A6A6A)),
          )),
      body: Column(
        children: [
          SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 120,
              child: TextFormField(
                focusNode: myFocusNode1,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.timer,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "zeit",
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
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 200,
              child: TextFormField(
                focusNode: myFocusNode2,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff90bc5a),
                  ),
                  labelText: "Abfahrt",
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
            ),
          ]),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: TextFormField(
                  focusNode: myFocusNode3,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.timer,
                      color: Color(0xff90bc5a),
                    ),
                    labelText: "zeit",
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
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 200,
                child: TextFormField(
                  focusNode: myFocusNode4,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff90bc5a),
                    ),
                    labelText: "Ankunft",
                    labelStyle: TextStyle(
                        color: myFocusNode4.hasFocus
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
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: MaterialButton(
              child: Text(
                "Erstellen",
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
    );
    //
  }
}
