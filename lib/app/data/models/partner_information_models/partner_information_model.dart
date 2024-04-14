import 'partner_information.dart';
import 'user.dart';

class PartnerInformationModel {
  List<PartnerInformation>? partnerInformation;
  String? status;

  PartnerInformationModel({this.partnerInformation, this.status});

  PartnerInformationModel.fromJson(Map<String, dynamic> json) {
    if (json['partner_information'] != null) {
      partnerInformation = <PartnerInformation>[];
      json['partner_information'].forEach((v) {
        partnerInformation!.add(new PartnerInformation.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnerInformation != null) {
      data['partner_information'] =
          this.partnerInformation!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
