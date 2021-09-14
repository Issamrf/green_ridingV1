import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_riding/createDrive/createDrive.dart';
import 'package:green_riding/screens/chatOV/chatOv.dart';

import 'package:green_riding/screens/profile/profile.dart';
import 'package:green_riding/searchDrive/searchDrive.dart';
import 'package:green_riding/settings/settings.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int pressedIndex = 0;

  final List<Widget> screenOptions = [
    Profile(),
    ChatOV(),
    CreateDrive(),
    SearchDrive(),
    Settings(),
  ];

  void onPress(int index) {
    setState(() {
      pressedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: screenOptions[pressedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff90bc5a),
          iconSize: 30,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff6A6A6A),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.location_fill),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              title: Text(''),
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                title: Text(''),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              title: Text(''),
            ),
          ],
          currentIndex: pressedIndex,
          onTap: onPress,
        ));
  }
}
