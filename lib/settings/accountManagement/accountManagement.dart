import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:green_riding/settings/accountManagement/visiblity.dart';
import 'package:green_riding/settings/settingsWidget/settingsWidget.dart';
import 'package:green_riding/settings/wallet.dart';

import 'editProfil.dart';

class AccountManagement extends StatefulWidget {
  @override
  _AccountManagementState createState() => _AccountManagementState();
}

class _AccountManagementState extends State<AccountManagement> {
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
            'Konto Verwaltung',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xff6A6A6A)),
          )),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SizedBox(height: 15),
          SettingsGroup(
            title: '',
            children: <Widget>[
              SizedBox(height: 10),
              SimpleSettingsTile(
                  title: 'Persönliche Daten bearbeiten',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.edit, color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  }),
              SimpleSettingsTile(
                  title: 'Sichtbare Daten',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.remove_red_eye_sharp,
                      color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Visiblity()));
                  }),
              SimpleSettingsTile(
                  title: 'Konto Löschen',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.delete, color: Color(0xff90bc5a)),
                  onTap: () {}),
            ],
          )
        ],
      )),
    );
  }
}
