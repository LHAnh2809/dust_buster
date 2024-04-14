import 'package:dust_buster/app/data/models/user_models/user.dart';

class UserModel {
  List<User>? user;
  String? status;

  UserModel({this.user, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
