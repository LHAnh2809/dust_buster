import 'dart:math';

import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:get/get.dart';

class PromotionDetailsController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  final List<int> colors = [
    0xFFE57373,
    0xFF90CAF9,
    0xFF81C784,
    0xFFFFD54F,
    0xFFBA68C8,
  ];

  var currentColor = 0.obs;

  void selectRandomColor() {
    final random = Random();
    currentColor.value = colors[random.nextInt(colors.length)];
  }

  var isCheckKM = false.obs;
  var isLoadingPermission = false.obs;
  @override
  void onInit() {
    super.onInit();
    selectRandomColor();
  }

  void gettCustomerPromotions(String id) async {
    try {
      isLoadingPermission.value = true;
      final response = await _apiHelper.postCustomerPromotions(id: id);

      if (response['detail'] == "OK") {
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  void posttCheckPromotions(String id) async {
    try {
      final response = await _apiHelper.postCheckPromotions(id: id);

      if (response['detail'] == 0) {
        isCheckKM.value = true;
        isLoadingPermission.value = false;
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
