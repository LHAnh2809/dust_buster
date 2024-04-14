import 'package:dust_buster/app/data/models/home_models/blog.dart';
import 'package:dust_buster/app/data/models/home_models/promotion.dart';
import 'package:dust_buster/app/data/models/home_models/service.dart';
import 'package:dust_buster/app/data/models/home_models/slides.dart';

class HomeModel {
  String? id;
  String? name;
  int? money;
  int? gPoints;
  String? idL;
  String? location;
  String? location2;
  List<Slides>? slides;
  List<Service>? service;
  List<Promotion>? promotion;
  List<Blog>? blog;

  HomeModel(
      {this.id,
      this.name,
      this.money,
      this.gPoints,
      this.idL,
      this.location,
      this.location2,
      this.slides,
      this.service,
      this.promotion,
      this.blog});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    money = json['money'];
    idL = json['idL'];
    gPoints = json['g_points'];
    location = json['location'];
    location2 = json['location2'];
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(new Slides.fromJson(v));
      });
    }
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(new Service.fromJson(v));
      });
    }
    if (json['promotion'] != null) {
      promotion = <Promotion>[];
      json['promotion'].forEach((v) {
        promotion!.add(new Promotion.fromJson(v));
      });
    }
    if (json['blog'] != null) {
      blog = <Blog>[];
      json['blog'].forEach((v) {
        blog!.add(new Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['money'] = this.money;
    data['g_points'] = this.gPoints;
    data['idL'] = this.idL;
    data['location'] = this.location;
    data['location2'] = this.location2;
    if (this.slides != null) {
      data['slides'] = this.slides!.map((v) => v.toJson()).toList();
    }
    if (this.service != null) {
      data['service'] = this.service!.map((v) => v.toJson()).toList();
    }
    if (this.promotion != null) {
      data['promotion'] = this.promotion!.map((v) => v.toJson()).toList();
    }
    if (this.blog != null) {
      data['blog'] = this.blog!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
