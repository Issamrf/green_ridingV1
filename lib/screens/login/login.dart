import 'package:flutter/material.dart';
import 'package:green_riding/bottomNavigation/bottomNavigation.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();

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
            Navigator.pop(context);
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu()));
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
        keyboardType: TextInputType.emailAddress,
        controller: tecEmail,
        validator: (value) {},

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
        keyboardType: TextInputType.text,
        controller: tecPass,
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
}
