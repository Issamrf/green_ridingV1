import 'dart:convert';

RidesModel ridesModelFromJson(String str) =>
    RidesModel.fromJson(json.decode(str));

String ridesModelToJson(RidesModel data) => json.encode(data.toJson());

class RidesModel {
  RidesModel({
    required this.name,
    required this.start,
    required this.end,
   
  });

  String name = "";
  String start = "";
  String end = "";
  

  factory RidesModel.fromJson(Map<String, dynamic> json) => RidesModel(
        name: json["name"],
        start: json["start"],
        end: json["end"],
      
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "start": start,
        "end": end,
        
      };
}
