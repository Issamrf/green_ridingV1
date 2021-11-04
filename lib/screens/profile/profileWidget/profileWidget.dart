import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imageDirection;
  final VoidCallback onPressed;
  final bool ifEdit;

  const ProfileWidget({
    key,
    required this.imageDirection,
    required this.onPressed,
    this.ifEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                buildImage(),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: buildEditIcon(Color(0xff90bc5a)),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                "Sina Muster",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff6A6A6A),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImage() {
    final image = AssetImage("assets/ProfilePic.png");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 110,
          height: 110,
          child: InkWell(splashColor: Color(0xff90bc5a), onTap: onPressed),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 6,
          child: Icon(
            ifEdit ? Icons.add_a_photo : Icons.emoji_emotions,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
