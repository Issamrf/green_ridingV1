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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.logout,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Chats',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black),
          )),
    );
    //
  }
}
