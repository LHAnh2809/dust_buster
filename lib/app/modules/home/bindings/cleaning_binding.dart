
import 'package:dust_buster/app/modules/home/exports.dart';

class CleaningBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CleaningController>(() => CleaningController());
  }
}
