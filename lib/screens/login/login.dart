import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_riding/bottomNavigation/bottomNavigation.dart';
import 'package:green_riding/main.dart';
import 'package:green_riding/screens/loginRegister/loginRegister.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkCurrentPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginRegister()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 70),
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Logo1.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildEmail(),
                          SizedBox(
                            height: 20,
                          ),
                          buildPassword(),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 3, left: 3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: buildLogin(),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Passwort Vergessen ?",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff90bc5a),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogin() {
    return MaterialButton(
      child: Text(
        "Login",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      minWidth: 120,
      height: 60,
      onPressed: () {
        if (!email.text.contains("@")) {
          Fluttertoast.showToast(msg: "Email Adresse ist nicht Korrekt");
        } else if (email.text.isEmpty) {
          Fluttertoast.showToast(msg: "Geben Sie Ihr Email ein");
        } else if (password.text.isEmpty) {
          Fluttertoast.showToast(msg: "Geben Ihre Passwort ein ");
        } else {
          userLogin(context);
        }
      },
      color: Color(0xff90bc5a),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.alternate_email,
            color: Color(0xff90bc5a),
          ),
          hintText: "Email",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
      );

  Widget buildPassword() => TextFormField(
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: password,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xff90bc5a),
          ),
          hintText: "Passwort",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xff90bc5a),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color(0xff90bc5a),
            ),
          ),
        ),
      );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void userLogin(BuildContext context) async {
    final User? user = (await firebaseAuth
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .catchError((e) {
      Fluttertoast.showToast(msg: "Error" + e.toString());
    }))
        .user;
    if (user != null) {
      // ignore: unnecessary_statements
      userRef.child(user.uid).once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
          Fluttertoast.showToast(msg: "Loggin Erfolgreich!!");
        } else {
          firebaseAuth.signOut();
          Fluttertoast.showToast(msg: "Passwort oder Email Stimmt nicht ");
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Versuchen Sie es mit richtigen Daten");
    }
  }
}
