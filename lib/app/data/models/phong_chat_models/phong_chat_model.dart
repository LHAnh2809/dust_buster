class PhongChat {
  String? idTVC;
  String? idU;
  String? image;
  String? nameU;
  String? phonenumber;
  int? oneStar;
  int? twoStar;
  int? threeStar;
  int? fourStar;
  int? fiveStar;
  String? idPC;
  int? daDoc;
  String? tinNhanCuoiCung;
  String? tGNT;
  String? tGTP;

  PhongChat(
      {this.idTVC,
      this.idU,
      this.image,
      this.nameU,
      this.phonenumber,
      this.oneStar,
      this.twoStar,
      this.threeStar,
      this.fourStar,
      this.fiveStar,
      this.idPC,
      this.daDoc,
      this.tinNhanCuoiCung,
      this.tGNT,
      this.tGTP});

  PhongChat.fromJson(Map<String, dynamic> json) {
    idTVC = json['idTVC'];
    idU = json['idU'];
    image = json['image'];
    nameU = json['nameU'];
    phonenumber = json['phonenumber'];
    oneStar = json['one_star'];
    twoStar = json['two_star'];
    threeStar = json['three_star'];
    fourStar = json['four_star'];
    fiveStar = json['five_star'];
    idPC = json['idPC'];
    daDoc = json['da_doc'];
    tinNhanCuoiCung = json['tin_nhan_cuoi_cung'];
    tGNT = json['TGNT'];
    tGTP = json['TGTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTVC'] = this.idTVC;
    data['idU'] = this.idU;
    data['image'] = this.image;
    data['nameU'] = this.nameU;
    data['phonenumber'] = this.phonenumber;
    data['one_star'] = this.oneStar;
    data['two_star'] = this.twoStar;
    data['three_star'] = this.threeStar;
    data['four_star'] = this.fourStar;
    data['five_star'] = this.fiveStar;
    data['idPC'] = this.idPC;
    data['da_doc'] = this.daDoc;
    data['tin_nhan_cuoi_cung'] = this.tinNhanCuoiCung;
    data['TGNT'] = this.tGNT;
    data['TGTP'] = this.tGTP;
    return data;
  }
}
