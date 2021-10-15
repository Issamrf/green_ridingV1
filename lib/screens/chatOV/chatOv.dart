import 'package:flutter/material.dart';

class ChatOV extends StatefulWidget {
  @override
  _ChatOvState createState() => _ChatOvState();
}

class _ChatOvState extends State<ChatOV> {
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
            'Chats',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0xff6A6A6A)),
          )),
    );
    //
  }
}
