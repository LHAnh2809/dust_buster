class User {
  String? idE;
  String? nameU;
  String? imageU;
  String? content;
  String? date;

  User({this.idE, this.nameU, this.imageU, this.content, this.date});

  User.fromJson(Map<String, dynamic> json) {
    idE = json['idE'];
    nameU = json['nameU'];
    imageU = json['imageU'];
    content = json['content'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idE'] = this.idE;
    data['nameU'] = this.nameU;
    data['imageU'] = this.imageU;
    data['content'] = this.content;
    data['date'] = this.date;
    return data;
  }
}
