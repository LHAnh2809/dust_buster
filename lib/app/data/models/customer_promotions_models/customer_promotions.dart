class CustomerPromotions {
  String? id;
  String? code;
  String? name;
  String? startDay;
  String? endDay;
  int? label;
  int? discount;
  int? point;

  CustomerPromotions(
      {this.id,
      this.code,
      this.name,
      this.startDay,
      this.endDay,
      this.label,
      this.discount,
      this.point});

  CustomerPromotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    startDay = json['start_day'];
    endDay = json['end_day'];
    label = json['label'];
    discount = json['discount'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['start_day'] = this.startDay;
    data['end_day'] = this.endDay;
    data['label'] = this.label;
    data['discount'] = this.discount;
    data['point'] = this.point;
    return data;
  }
}
