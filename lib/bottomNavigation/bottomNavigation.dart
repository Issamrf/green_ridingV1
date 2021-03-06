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
  String text = '';

  final List<Widget> screenOptions = [
    Profile(),
    SearchDrive(),
    CreateDrive(),
    ChatOV(),
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
              icon: Icon(CupertinoIcons.person),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search_circle),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
          currentIndex: pressedIndex,
          onTap: onPress,
        ));
  }
}
