import 'clean_wallet.dart';

class CleanWalletModel {
  CleanWallet? cleanWallet;
  String? status;

  CleanWalletModel({this.cleanWallet, this.status});

  CleanWalletModel.fromJson(Map<String, dynamic> json) {
    cleanWallet = json['clean_wallet'] != null
        ? new CleanWallet.fromJson(json['clean_wallet'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cleanWallet != null) {
      data['clean_wallet'] = this.cleanWallet!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
