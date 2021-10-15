import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_riding/bottomNavigation/bottomNavigation.dart';
import 'package:green_riding/main.dart';
import 'package:green_riding/screens/loginRegister/loginRegister.dart';

///This Class Contains the UI and the conditions of signin Up
///Author: Issam Rafiq
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController email = TextEditingController();
  String startTime = "";
  String startPlace = "";
  String arriveTime = "";
  String endPlace = "";

  bool isCheck = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
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
                height: 70,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      buildName(),
                      SizedBox(
                        height: 10,
                      ),
                      buildNickname(),
                      SizedBox(
                        height: 10,
                      ),
                      buildTel(),
                      SizedBox(
                        height: 10,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      buildPasswordConfirm(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Material(
                        child: Checkbox(
                          value: isCheck,
                          onChanged: (value) {},
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Ich akzeptiere die Nutzungsbedingungen',
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xff90bc5a)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: buildSubmit()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmit() => MaterialButton(
        minWidth: 120,
        height: 60,
        onPressed: () async {
          if (!email.text.contains("@")) {
            Fluttertoast.showToast(msg: "Email Adresse ist nicht Korrekt");
          } else if (password.text.length < 7) {
            Fluttertoast.showToast(msg: "Passwort muss mindestens ");
          } else if (password.text != rePassword.text) {
            Fluttertoast.showToast(msg: "Passwörter stimmen nicht überein");
          }
          registerUser(context);
        },
        color: Color(0xff90bc5a),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "Registrieren",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );

  Widget buildName() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,

        controller: name,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_outline, color: Color(0xff90bc5a)),
          hintText: "Vorname",
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

  Widget buildNickname() => TextFormField(
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,

        controller: surname,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            color: Color(0xff90bc5a),
          ),
          hintText: "Nachname",
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

  Widget buildTel() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,

        controller: phone,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone, color: Color(0xff90bc5a)),
          hintText: "Telefonnummer",
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

  Widget buildEmail() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,

        controller: email,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.alternate_email, color: Color(0xff90bc5a)),
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
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,

        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: Color(0xff90bc5a)),
          hintText: "Passwort",
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

  Widget buildPasswordConfirm() => TextFormField(
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,

        controller: rePassword,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_open, color: Color(0xff90bc5a)),
          hintText: "Passwort wiederholen",
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

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void registerUser(BuildContext context) async {
    final User? user = (await firebaseAuth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .catchError((e) {
      Fluttertoast.showToast(msg: "Error" + e.toString());
    }))
        .user;

    if (user != null) {
      Map userDataMap = {
        "name": name.text.trim(),
        "surname": surname.text.trim(),
        "email": email.text.trim(),
        "phone": phone.text.trim(),
        "startTime": startTime,
        "startPlace": startPlace,
        "arriveTime": arriveTime,
        "endPlace": endPlace,
      };

      userRef.child(user.uid).set(userDataMap);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    } else {
      Fluttertoast.showToast(
          msg: "Konto wurde nicht erstellt, bitte versuchen Sie es später");
    }
  }
}
