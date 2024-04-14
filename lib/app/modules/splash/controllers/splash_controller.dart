import 'dart:async';
import 'package:dust_buster/app/common/storage/storage.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  void getTime() {
    Timer(const Duration(seconds: 2), () {
      String? accessToken = Storage.getValue<String>('access_token');
      print(accessToken);
      if (accessToken != null) {
        getVerifyToken(accessToken);
      } else {
        Get.offNamed(Routes.login);
      }
    });
  }

  getVerifyToken(String accessToken) async {
    try {
      await _apiHelper.postVerifyToken(token: accessToken);
      Get.offAllNamed(Routes.navigationBar);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
