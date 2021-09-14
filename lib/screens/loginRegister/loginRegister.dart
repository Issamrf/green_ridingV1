import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_riding/screens/login/login.dart';
import 'package:green_riding/screens/register/register.dart';

class LoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              // giving the elements height
              // double.infinity make it big as my parent allows
              // while MediaQuery make it big as per the screen
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child:
                  // even space distribution
                  Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/Logo1.png"))),
                    ),
                  ),
                  SizedBox(height: 100),
                  // login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    //navigation
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    //  shape of login Button
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff90bc5a)),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Einloggen",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  //  signup button
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    color: Color(0xff90bc5a),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Registrieren",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
