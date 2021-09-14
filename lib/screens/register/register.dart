import 'package:flutter/material.dart';
import 'package:green_riding/bottomNavigation/bottomNavigation.dart';

///This Class Contains the UI and the conditions of signin Up
///Author: Issam Rafiq
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String formName = "";
  String formPlz = "";
  String formBirthday = "";
  String formKids = "";
  String formEmail = "";
  String formCity = "";
  String formPassword = "";
  String formPasswordConfirm = "";
  bool agree = false;
  bool validate = false;

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
            Navigator.pop(context);
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
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
        validator: (value) {},
        onChanged: (value) => setState(
          () => formName = value,
        ),
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
        keyboardType: TextInputType.number,
        validator: (value) {},
        onChanged: (value) => setState(
          () => formPlz = value,
        ),
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
        validator: (value) {},
        onChanged: (value) => setState(
          () => formKids = value,
        ),
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

  /* Widget buildCity() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        validator: (value) {},
        onChanged: (value) => setState(
          () => formCity = value,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_city),
          hintText: "Stadt",
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      );*/

  Widget buildEmail() => TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {},
        onChanged: (value) => setState(
          () => formEmail = value,
        ),
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
        validator: (value) {},
        onChanged: (value) => setState(
          () => formPassword = value,
        ),
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
        validator: (value) {},
        onChanged: (value) => setState(
          () => formPasswordConfirm = value,
        ),
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
}
