import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:green_riding/screens/login/login.dart';
import 'package:green_riding/settings/fahrten.dart';
import 'package:green_riding/settings/settingsWidget/settingsWidget.dart';
import 'package:green_riding/settings/wallet.dart';

import 'accountManagement/accountManagement.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //TexrEditingController searchText = new TexrEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Settings',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0xff6A6A6A)),
          )),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SizedBox(height: 30),
          SettingsGroup(
            title: '',
            children: <Widget>[
              SizedBox(height: 10),
              SimpleSettingsTile(
                  title: 'Konto Verwaltung',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.account_box, color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountManagement()));
                  }),
              SimpleSettingsTile(
                  title: 'Wallet',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.wallet_membership, color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wallet()));
                  }),
              SimpleSettingsTile(
                  title: 'Bewertungen',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.star, color: Color(0xff90bc5a)),
                  onTap: () {}),
              SimpleSettingsTile(
                  title: 'Meine Fahrten',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.bus_alert_outlined, color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Drives()));
                  }),
              SimpleSettingsTile(
                  title: 'Mitteilungen',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.chat_bubble, color: Color(0xff90bc5a)),
                  onTap: () {}),
              SimpleSettingsTile(
                  title: 'Ausloggen',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.logout, color: Color(0xff90bc5a)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
              SizedBox(height: 30),
              SimpleSettingsTile(
                  title: 'Impressum',
                  subtitle: '',
                  leading: SettingsWidget(icon: Icons.info, color: Colors.grey),
                  onTap: () {}),
              SimpleSettingsTile(
                  title: 'Feedback Geben',
                  subtitle: '',
                  leading: SettingsWidget(
                      icon: Icons.chat_bubble, color: Colors.grey),
                  onTap: () {}),
            ],
          )
        ],
      )),
    );
  }
}
