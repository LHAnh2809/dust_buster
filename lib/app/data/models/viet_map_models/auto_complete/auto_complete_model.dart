// To parse this JSON data, do
//
//     final autoCompleteModel = autoCompleteModelFromJson(jsonString);

import 'dart:convert';

import 'package:dust_buster/app/data/models/viet_map_models/auto_complete/boundary.dart';

List<AutoCompleteModel> autoCompleteModelFromJson(String str) => List<AutoCompleteModel>.from(json.decode(str).map((x) => AutoCompleteModel.fromJson(x)));

String autoCompleteModelToJson(List<AutoCompleteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AutoCompleteModel {
    final String refId;
    final int distance;
    final String address;
    final String name;
    final String display;
    final List<Boundary> boundaries;
    final List<String> categories;

    AutoCompleteModel({
        required this.refId,
        required this.distance,
        required this.address,
        required this.name,
        required this.display,
        required this.boundaries,
        required this.categories,
    });

    factory AutoCompleteModel.fromJson(Map<String, dynamic> json) => AutoCompleteModel(
        refId: json["ref_id"],
        distance: json["distance"],
        address: json["address"],
        name: json["name"],
        display: json["display"],
        boundaries: List<Boundary>.from(json["boundaries"].map((x) => Boundary.fromJson(x))),
        categories: List<String>.from(json["categories"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "ref_id": refId,
        "distance": distance,
        "address": address,
        "name": name,
        "display": display,
        "boundaries": List<dynamic>.from(boundaries.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x)),
    };
}
