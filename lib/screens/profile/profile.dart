import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_riding/screens/profile/profileWidget/profileWidget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  late final bool ifSmoke = false;
  late final bool ifAnimal = false;
  late final bool ifvaccinated = true;
  bool isloading = false;
  var userdata = [];

  late final dref =
      FirebaseDatabase.instance.reference().child("users/" + currentUser());

  void initState() {
    super.initState();

    showdata();
  }

  currentUser() {
    final User? user = auth.currentUser;
    final uid = user!.uid.toString();
    return uid;
  }

  showdata() {
    setState(() {
      isloading = true;
    });
    dref.once().then((snapshot) {
      snapshot.value["email"] = userdata;
      print(snapshot.value["email"]);
    });
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color(0xff6A6A6A),
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showdata();
            },
            icon: Icon(
              Icons.notification_important,
              size: 30,
              color: Color(0xff6A6A6A),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(30),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              onPressed: () {
                showdata();
              },
              imageDirection: '',
            ),
            const SizedBox(height: 40),
            AgeKids(),
            const SizedBox(height: 40),
            Container(
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Color(0xff90bc5a)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      """${dref.once().then((snapshot) {
                        snapshot.value["email"];
                      })}""",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6A6A6A),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  ifSmoke
                      ? Icons.smoking_rooms_rounded
                      : Icons.smoke_free_outlined,
                  color: Color(0xff90bc5a),
                  size: 23,
                ),
                Text(
                  ifSmoke ? "Rauchen Erlaubt" : " Rauchen nicht erlaubt",
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 23,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
              SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  ifAnimal ? Icons.check_circle : Icons.not_interested_outlined,
                  color: Color(0xff90bc5a),
                  size: 21,
                ),
                Text(
                  ifSmoke ? "Tiere Erlaubt" : " Tiere nicht Erlaubt",
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 21,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
              SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  ifAnimal
                      ? Icons.emoji_emotions
                      : Icons.emoji_emotions_outlined,
                  color: Color(0xff90bc5a),
                  size: 21,
                ),
                Text(
                  ifvaccinated ? "  Geimpft" : "Nicht Geimpft ",
                  style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 21,
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ]),
            ]),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Tägliche Strecke",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff6A6A6A),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            IntrinsicHeight(
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.circle_outlined,
                    color: Color(0xff90bc5a),
                    size: 23,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "7:20",
                    style: TextStyle(
                      color: Color(0xff90bc5a),
                      fontSize: 23,
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Friedberg",
                    style: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontSize: 23,
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: 80,
                    width: 1.0,
                    color: const Color(0xff6A6A6A),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.circle,
                    color: Color(0xff90bc5a),
                    size: 23,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "8:00",
                    style: TextStyle(
                      color: Color(0xff90bc5a),
                      fontSize: 23,
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Frankfurt",
                    style: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontSize: 23,
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
                SizedBox(height: 5),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeKids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Green Coins',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff6A6A6A),
                ),
              ),
              Center(
                child: Text(
                  "13",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff90bc5a),
                  ),
                ),
              )
            ],
          ),
          VerticalDivider(
            thickness: 2.0,
          ),
          Column(
            children: <Widget>[
              Text(
                'Rides',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff6A6A6A),
                ),
              ),
              Center(
                child: Text(
                  "20",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff90bc5a),
                  ),
                ),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 2.0,
          ),
          Column(
            children: <Widget>[
              Text(
                'Bewertung',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff6A6A6A),
                ),
              ),
              Center(
                child: Text(
                  "4,5",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff90bc5a),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
