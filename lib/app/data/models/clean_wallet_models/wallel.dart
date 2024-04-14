
class Wallet {
  String? id;
  int? moneyBF;
  String? note;
  String? date;
  String? wallet;
  int? status;

  Wallet({this.id, this.moneyBF, this.note, this.date,this.wallet, this.status});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moneyBF = json['moneyBF'];
    note = json['note'];
    date = json['date'];
    wallet = json['wallet'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['moneyBF'] = this.moneyBF;
    data['note'] = this.note;
    data['date'] = this.date;
    data['wallet'] = this.wallet;
    data['status'] = this.status;
    return data;
  }
}
