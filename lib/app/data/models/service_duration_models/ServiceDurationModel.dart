import 'package:dust_buster/app/data/models/service_duration_models/service_duration.dart';

class ServiceDurationModel {
  List<ServiceDuration>? serviceDuration;

  ServiceDurationModel({this.serviceDuration});

  ServiceDurationModel.fromJson(Map<String, dynamic> json) {
    if (json['service_duration'] != null) {
      serviceDuration = <ServiceDuration>[];
      json['service_duration'].forEach((v) {
        serviceDuration!.add(new ServiceDuration.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceDuration != null) {
      data['service_duration'] =
          this.serviceDuration!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
