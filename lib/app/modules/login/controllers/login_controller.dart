import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/routes/app_pages.dart';

import '../../../data/repository/api_helper.dart';

class LoginController extends GetxController {
  final ApiHelper _apiHelper = Get.find();

  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  var isPasswordVisible = true.obs;
  var ispasswordOrEmailNull = false.obs;
  var isPasswordOrEmailIncorrect = false.obs;
  var isyourAccountBan = false.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  void onClose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.onClose();
  }

  login() async {
    final String email = textEmailController.text;
    final String passWord = textPasswordController.text;
    if (email.trim().isEmpty || passWord.trim().isEmpty) {
      isPasswordOrEmailIncorrect.value = false;
      isyourAccountBan.value = false;
      ispasswordOrEmailNull.value = true;
      return; // Trả về ngay khi email hoặc password rỗng
    }
    isLoading.value = true;
    try {
      final response =
          await _apiHelper.portLogin(email: email, password: passWord);
      final detail = response['detail'];
      if (detail == -1 || detail == -2) {
        isPasswordOrEmailIncorrect.value = true;
        isyourAccountBan.value = false;
        ispasswordOrEmailNull.value = false;
        isLoading.value = false;
        return;
      } else if (detail == -3) {
        isPasswordOrEmailIncorrect.value = false;
        isyourAccountBan.value = true;
        ispasswordOrEmailNull.value = false;
        isLoading.value = false;
        return;
      } else {
        final token = response['access_token'] as String;

        await Storage.saveValue('access_token', token);
        Get.offAndToNamed(Routes.navigationBar);
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
