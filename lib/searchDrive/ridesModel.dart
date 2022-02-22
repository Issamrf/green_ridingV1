import 'dart:convert';

RidesModel ridesModelFromJson(String str) =>
    RidesModel.fromJson(json.decode(str));

String ridesModelToJson(RidesModel data) => json.encode(data.toJson());

class RidesModel {
  RidesModel({
    required this.name,
    required this.start,
    required this.end,
    required this.start_lat,
    required this.start_lng,
    required this.end_lat,
    required this.end_lng,
  });

  String name = "";
  String start = "";
  String end = "";
  double start_lat;
  double start_lng;
  double end_lat;
  double end_lng;

  factory RidesModel.fromJson(Map<String, dynamic> json) => RidesModel(
        name: json["name"],
        start: json["start"],
        end: json["end"],
        start_lat: json["start_lat"],
        start_lng: json["start_lng"],
        end_lat: json["end_lat"],
        end_lng: json["end_lng"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "start": start,
        "end": end,
        "start_lat": start_lat,
        "start_lng": start_lng,
        "end_lat": end_lat,
        "end_lng": end_lng,
      };
}
