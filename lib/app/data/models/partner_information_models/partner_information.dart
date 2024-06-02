import 'user.dart';

class PartnerInformation {
  String? idP;
  String? nameP;
  String? imageP;
  int? oneStar;
  int? twoStar;
  int? threeStar;
  int? fourStar;
  int? fiveStar;
  List<User>? user;

  PartnerInformation(
      {this.idP,
      this.nameP,
      this.imageP,
      this.oneStar,
      this.twoStar,
      this.threeStar,
      this.fourStar,
      this.fiveStar,
      this.user});

  PartnerInformation.fromJson(Map<String, dynamic> json) {
    idP = json['idP'];
    nameP = json['nameP'];
    imageP = json['imageP'];
    oneStar = json['oneStar'];
    twoStar = json['twoStar'];
    threeStar = json['threeStar'];
    fourStar = json['fourStar'];
    fiveStar = json['fiveStar'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idP'] = this.idP;
    data['nameP'] = this.nameP;
    data['imageP'] = this.imageP;
    data['oneStar'] = this.oneStar;
    data['twoStar'] = this.twoStar;
    data['threeStar'] = this.threeStar;
    data['fourStar'] = this.fourStar;
    data['fiveStar'] = this.fiveStar;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

