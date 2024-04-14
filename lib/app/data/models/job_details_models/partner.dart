class Partner {
  String? idP;
  String? imageP;
  String? nameP;
  int? oneStar;
  int? twoStar;
  int? threeStar;
  int? fourStar;
  int? fiveStar;

  Partner(
      {this.idP,
      this.imageP,
      this.nameP,
      this.oneStar,
      this.twoStar,
      this.threeStar,
      this.fourStar,
      this.fiveStar});

  Partner.fromJson(Map<String, dynamic> json) {
    idP = json['idP'];
    imageP = json['imageP'];
    nameP = json['nameP'];
    oneStar = json['oneStar'];
    twoStar = json['twoStar'];
    threeStar = json['threeStar'];
    fourStar = json['fourStar'];
    fiveStar = json['fiveStar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idP'] = this.idP;
    data['imageP'] = this.imageP;
    data['nameP'] = this.nameP;
    data['oneStar'] = this.oneStar;
    data['twoStar'] = this.twoStar;
    data['threeStar'] = this.threeStar;
    data['fourStar'] = this.fourStar;
    data['fiveStar'] = this.fiveStar;
    return data;
  }
}
