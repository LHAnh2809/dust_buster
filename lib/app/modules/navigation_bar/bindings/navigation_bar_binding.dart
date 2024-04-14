import 'package:dust_buster/app/modules/account/controllers/account_controller.dart';
import 'package:dust_buster/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:dust_buster/app/modules/notification/controllers/calendar_controller.dart';
import 'package:dust_buster/app/modules/notification/controllers/notification_controller.dart';
import 'package:dust_buster/app/modules/promotion/controllers/promotion_controller.dart';

import 'package:dust_buster/app/modules/work/exports.dart';

import '../../home/exports.dart';

class NavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationBarController>(() => NavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<WorkController>(() => WorkController());
    Get.lazyPut<PromotionController>(() => PromotionController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<WaitingController>(() => WaitingController());
    Get.lazyPut<CalendarController>(() => CalendarController());
    Get.lazyPut<JobDetailsController>(() => JobDetailsController());
  }
}
