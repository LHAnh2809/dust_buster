// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

import 'package:dust_buster/app/data/models/location_models/location.dart';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  final List<Location> location;

  LocationModel({
    required this.location,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        location: List<Location>.from(
            json["location"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "location": List<dynamic>.from(location.map((x) => x.toJson())),
      };
}
