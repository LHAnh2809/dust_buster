// To parse this JSON data, do
//
//     final reverseModel = reverseModelFromJson(jsonString);

import 'dart:convert';

import 'package:dust_buster/app/data/models/viet_map_models/auto_complete/boundary.dart';

List<ReverseModel> reverseModelFromJson(String str) => List<ReverseModel>.from(
    json.decode(str).map((x) => ReverseModel.fromJson(x)));

String reverseModelToJson(List<ReverseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReverseModel {
  final double lat;
  final double lng;
  final String refId;
  final double distance;
  final String address;
  final String name;
  final String display;
  final List<Boundary> boundaries;
  final List<dynamic> categories;

  ReverseModel({
    required this.lat,
    required this.lng,
    required this.refId,
    required this.distance,
    required this.address,
    required this.name,
    required this.display,
    required this.boundaries,
    required this.categories,
  });

  factory ReverseModel.fromJson(Map<String, dynamic> json) => ReverseModel(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        refId: json["ref_id"],
        distance: json["distance"]?.toDouble(),
        address: json["address"],
        name: json["name"],
        display: json["display"],
        boundaries: List<Boundary>.from(
            json["boundaries"].map((x) => Boundary.fromJson(x))),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
        "ref_id": refId,
        "distance": distance,
        "address": address,
        "name": name,
        "display": display,
        "boundaries": List<dynamic>.from(boundaries.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}
