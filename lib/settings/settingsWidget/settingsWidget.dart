import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SettingsWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(icon, color: Colors.white),
      );
}
