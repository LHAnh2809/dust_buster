
import 'wallel.dart';

class CleanWallet {
  int? moneyU;
  List<Wallet>? wallet;

  CleanWallet({this.moneyU, this.wallet});

  CleanWallet.fromJson(Map<String, dynamic> json) {
    moneyU = json['moneyU'];
    if (json['wallet'] != null) {
      wallet = <Wallet>[];
      json['wallet'].forEach((v) {
        wallet!.add(new Wallet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moneyU'] = this.moneyU;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}