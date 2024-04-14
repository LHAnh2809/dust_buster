import 'package:dust_buster/app/data/models/customer_promotions_models/customer_promotions.dart';

class CustomerPromotionsModel {
  List<CustomerPromotions>? customerPromotions;
  String? status;

  CustomerPromotionsModel({this.customerPromotions, this.status});

  CustomerPromotionsModel.fromJson(Map<String, dynamic> json) {
    if (json['customer_promotions'] != null) {
      customerPromotions = <CustomerPromotions>[];
      json['customer_promotions'].forEach((v) {
        customerPromotions!.add(new CustomerPromotions.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerPromotions != null) {
      data['customer_promotions'] =
          this.customerPromotions!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
