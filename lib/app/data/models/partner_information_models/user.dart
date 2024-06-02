class User {
  String? idE;
  String? nameU;
  String? imageU;
  int? star;
  String? content;
  String? date;
  String? image;

  User(
      {this.idE,
      this.nameU,
      this.imageU,
      this.star,
      this.content,
      this.date,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    idE = json['idE'];
    nameU = json['nameU'];
    imageU = json['imageU'];
    star = json['star'];
    content = json['content'];
    date = json['date'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idE'] = this.idE;
    data['nameU'] = this.nameU;
    data['imageU'] = this.imageU;
    data['star'] = this.star;
    data['content'] = this.content;
    data['date'] = this.date;
    data['image'] = this.image;
    return data;
  }
}
