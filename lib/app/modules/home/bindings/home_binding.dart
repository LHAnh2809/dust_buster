import 'package:dust_buster/app/modules/home/exports.dart';
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<PromotionDetailsController>(() => PromotionDetailsController());
  }
}
