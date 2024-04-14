
class Blog {
  String? id;
  String? imageUrl;
  String? newsUrl;
  String? title;
  String? content;
  String? date;

  Blog(
      {this.id,
      this.imageUrl,
      this.newsUrl,
      this.title,
      this.content,
      this.date});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    newsUrl = json['newsUrl'];
    title = json['title'];
    content = json['content'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['newsUrl'] = this.newsUrl;
    data['title'] = this.title;
    data['content'] = this.content;
    data['date'] = this.date;
    return data;
  }
}
