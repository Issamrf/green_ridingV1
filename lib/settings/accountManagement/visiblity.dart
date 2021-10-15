import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Visiblity extends StatefulWidget {
  @override
  _Visiblity createState() => _Visiblity();
}

class _Visiblity extends State<Visiblity> {
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
              Icons.arrow_back_ios_new,
              size: 30,
              color: Color(0xff6A6A6A),
            ),
          ),
          title: Text(
            'Sichtbare Daten',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff6A6A6A)),
          )),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 300,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Telefonnummer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            LiteRollingSwitch(
                              value: true,
                              textOn: 'an',
                              textOff: 'aus',
                              colorOn: Colors.greenAccent[700],
                              colorOff: Colors.grey,
                              iconOn: Icons.done,
                              iconOff: Icons.remove_circle_outline,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                //Use it to manage the different states
                                print('Current State of SWITCH IS: $state');
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Nachname         ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            LiteRollingSwitch(
                              value: true,
                              textOn: 'an',
                              textOff: 'aus',
                              colorOn: Colors.greenAccent[700],
                              colorOff: Colors.grey,
                              iconOn: Icons.done,
                              iconOff: Icons.remove_circle_outline,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                //Use it to manage the different states
                                print('Current State of SWITCH IS: $state');
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Green Coins     ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff6A6A6A),
                              ),
                            ),
                            LiteRollingSwitch(
                              value: true,
                              textOn: 'an',
                              textOff: 'aus',
                              colorOn: Colors.greenAccent[700],
                              colorOff: Colors.grey,
                              iconOn: Icons.done,
                              iconOff: Icons.remove_circle_outline,
                              textSize: 16.0,
                              onChanged: (bool state) {
                                //Use it to manage the different states
                                print('Current State of SWITCH IS: $state');
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
