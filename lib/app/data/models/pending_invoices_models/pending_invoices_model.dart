import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';

class PendingInvoicesModel {
  String? status;
  List<PendingInvoices>? pendingInvoices;

  PendingInvoicesModel({this.pendingInvoices});

  PendingInvoicesModel.fromJson(Map<String, dynamic> json) {
    if (json['pending_invoices'] != null) {
      pendingInvoices = <PendingInvoices>[];
      json['pending_invoices'].forEach((v) {
        pendingInvoices!.add(new PendingInvoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pendingInvoices != null) {
      data['pending_invoices'] =
          this.pendingInvoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
