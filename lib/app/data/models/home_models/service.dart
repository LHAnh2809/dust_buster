class Service {
  String? id;
  String? name;
  String? icon;
  int? label;
  int? status;

  Service({this.id, this.name, this.icon, this.label, this.status});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    label = json['label'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['label'] = this.label;
    data['status'] = this.status;
    return data;
  }
}
