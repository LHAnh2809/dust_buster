import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';

import 'Periodic.dart';


class PeriodicModel {
  String? status;
  List<Periodic>? periodic;

  PeriodicModel({this.periodic});

  PeriodicModel.fromJson(Map<String, dynamic> json) {
    if (json['pending_invoices'] != null) {
      periodic = <Periodic>[];
      json['pending_invoices'].forEach((v) {
        periodic!.add(new Periodic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.periodic != null) {
      data['pending_invoices'] = this.periodic!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
