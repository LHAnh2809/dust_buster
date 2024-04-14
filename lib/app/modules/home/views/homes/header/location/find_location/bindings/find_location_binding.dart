import 'package:dust_buster/app/modules/home/exports.dart';

class FindLocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindLocationController>(() => FindLocationController());
  }
}
