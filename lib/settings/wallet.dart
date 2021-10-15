import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:green_riding/settings/settingsWidget/settingsWidget.dart';

class Wallet extends StatelessWidget {
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
            'Wallet',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xff6A6A6A)),
          )),
      body: ListView(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                      child: Text(
                    'Green Coins',
                    style: TextStyle(
                      fontSize: 40,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6A6A6A),
                    ),
                  )),
                  Center(
                      child: Text(
                    '20',
                    style: TextStyle(
                      fontSize: 40,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff90bc5a),
                    ),
                  )),
                  SizedBox(height: 200),
                  Column(
                    children: [
                      SettingsGroup(
                        title: '',
                        children: <Widget>[
                          SizedBox(height: 10),
                          SimpleSettingsTile(
                              title: 'Einzahlen',
                              subtitle: '',
                              leading: SettingsWidget(
                                  icon: Icons.arrow_circle_up,
                                  color: Color(0xff90bc5a)),
                              onTap: () {}),
                          SimpleSettingsTile(
                              title: 'Auszahlen',
                              subtitle: '',
                              leading: SettingsWidget(
                                  icon: Icons.arrow_circle_down,
                                  color: Color(0xff90bc5a)),
                              onTap: () {}),
                          SimpleSettingsTile(
                              title: 'Spenden',
                              subtitle: 'Umwelt Organisation nach Wahl',
                              leading: SettingsWidget(
                                  icon: Icons.emoji_emotions,
                                  color: Color(0xff90bc5a)),
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
