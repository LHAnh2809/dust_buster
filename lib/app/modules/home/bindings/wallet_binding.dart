import 'package:dust_buster/app/modules/home/exports.dart';

import '../controllers/wallet_controller.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
