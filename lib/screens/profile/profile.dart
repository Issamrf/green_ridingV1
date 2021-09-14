import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {},
          icon: Icon(
            Icons.logout,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(30),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              onPressed: () {},
              imageDirection: '',
            ),
            const SizedBox(height: 60),
            AgeKids(),
            const SizedBox(height: 60),
            Container(
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Color(0xff90bc5a)),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      """Ich studiere BWL in Frankfurt und 
muss Jeden tag dahin fahren. 
Ich Freue mich auf eure anfragen""",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6A6A6A),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class AgeKids extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Coins',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff6A6A6A),
              ),
            ),
            Center(
              child: Text(
                "13",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff90bc5a),
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Rides',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff6A6A6A),
              ),
            ),
            Center(
              child: Text(
                "20",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff90bc5a),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Bewertung',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff6A6A6A),
              ),
            ),
            Center(
              child: Text(
                "4,5",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xff90bc5a),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
                  child: buildEditIcon(Color(0xff3b93c3)),
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
                "Anna Muster",
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
          child: InkWell(splashColor: Color(0xff3b93c3), onTap: onPressed),
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
            ifEdit ? Icons.add_a_photo : Icons.edit,
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
