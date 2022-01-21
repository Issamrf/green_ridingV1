import 'dart:convert';

SegmentsModel ridesModelFromJson(String str) =>
    SegmentsModel.fromJson(json.decode(str));

String ridesModelToJson(SegmentsModel data) => json.encode(data.toJson());

class SegmentsModel {
  SegmentsModel({
    required this.vehicletype,
    required this.start_lat,
    required this.start_lng,
    required this.end_lat,
    required this.end_lng,
  });

  var vehicletype = "";
  var start_lat = "";
  var start_lng = "";
  var end_lat = "";
  var end_lng = "";

  factory SegmentsModel.fromJson(Map<String, dynamic> json) => SegmentsModel(
        vehicletype: json["vehicletype"],
        start_lat: json["start_lat"],
        start_lng: json["start_lng"],
        end_lat: json["end_lat"],
        end_lng: json["end_lng"],
      );

  Map<String, dynamic> toJson() => {
        "vehicletype": vehicletype,
        "start_lat": start_lat,
        "start_lng": start_lng,
        "end_lat": end_lat,
        "end_lng": end_lng,
      };
}
