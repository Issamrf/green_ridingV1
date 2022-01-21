import 'package:flutter/material.dart';
import 'package:green_riding/models/placePredictions.dart';

class PredictionTile extends StatelessWidget {
  final PlacePredictions placePredictions;
  PredictionTile({required this.placePredictions});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {},
      child: Container(
          child: Column(
        children: [
          SizedBox(width: 10.0),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placePredictions.main_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      placePredictions.secondary_text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
        ],
      )),
    );
  }
}
