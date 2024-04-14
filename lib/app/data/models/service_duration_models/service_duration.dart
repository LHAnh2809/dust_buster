class ServiceDuration {
  String? id;
  int? time;
  String? acreage;
  String? room;
  int? money;
  int? status;

  ServiceDuration(
      {this.id, this.time, this.acreage, this.room, this.money, this.status});

  ServiceDuration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    acreage = json['acreage'];
    room = json['room'];
    money = json['money'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    data['acreage'] = this.acreage;
    data['room'] = this.room;
    data['money'] = this.money;
    data['status'] = this.status;
    return data;
  }
}
