
class User {
  String? id;
  String? password;
  String? phoneNumber;
  String? email;
  String? name;
  String? image;
  int? money;
  int? gPoints;
  int? sex;
  String? datebirth;
  int? ban;
  String? yourReferralCode;
  String? referralCode;

  User(
      {this.id,
      this.password,
      this.phoneNumber,
      this.email,
      this.name,
      this.image,
      this.money,
      this.gPoints,
      this.sex,
      this.datebirth,
      this.ban,
      this.yourReferralCode,
      this.referralCode});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    name = json['name'];
    image = json['image'];
    money = json['money'];
    gPoints = json['g_points'];
    sex = json['sex'];
    datebirth = json['datebirth'];
    ban = json['ban'];
    yourReferralCode = json['yourReferralCode'];
    referralCode = json['referralCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['name'] = this.name;
    data['image'] = this.image;
    data['money'] = this.money;
    data['g_points'] = this.gPoints;
    data['sex'] = this.sex;
    data['datebirth'] = this.datebirth;
    data['ban'] = this.ban;
    data['yourReferralCode'] = this.yourReferralCode;
    data['referralCode'] = this.referralCode;
    return data;
  }
}
