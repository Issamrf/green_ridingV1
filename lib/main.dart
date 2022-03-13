import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_riding/screens/login/login.dart';
import 'package:green_riding/screens/profile/profile.dart';
import 'package:green_riding/screens/splashScreen/splashScreen.dart';
import 'package:green_riding/searchDrive/chooseRide.dart';

import 'package:green_riding/searchDrive/searchDrive.dart';
import 'package:green_riding/searchDrive/searchScreen.dart';
import 'package:green_riding/searchDrive/showPath.dart';
import 'package:provider/provider.dart';

import 'createDrive/createDrive.dart';
import 'dataHandler/appData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
