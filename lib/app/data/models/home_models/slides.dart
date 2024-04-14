class Slides {
  String? id;
  String? imageUrl;
  String? newsUrl;

  Slides({this.id, this.imageUrl, this.newsUrl});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    newsUrl = json['newsUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['newsUrl'] = this.newsUrl;
    return data;
  }
}
