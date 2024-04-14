class Promotion {
  String? id;
  String? nameP;
  String? codeP;
  String? startDP;
  String? endDP;
  String? contentP;
  int? labelP;
  int? discountP;
  int? pointP;

  Promotion(
      {this.id,
      this.nameP,
      this.codeP,
      this.startDP,
      this.endDP,
      this.contentP,
      this.labelP,
      this.discountP,
      this.pointP});

  Promotion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameP = json['nameP'];
    codeP = json['codeP'];
    startDP = json['startDP'];
    endDP = json['endDP'];
    contentP = json['contentP'];
    labelP = json['labelP'];
    discountP = json['discountP'];
    pointP = json['pointP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameP'] = this.nameP;
    data['codeP'] = this.codeP;
    data['startDP'] = this.startDP;
    data['endDP'] = this.endDP;
    data['contentP'] = this.contentP;
    data['labelP'] = this.labelP;
    data['discountP'] = this.discountP;
    data['pointP'] = this.pointP;
    return data;
  }
}
