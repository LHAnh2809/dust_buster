import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/create_account/controllers/create_account_controller.dart';
import 'package:dust_buster/app/modules/forgot_password/view/widgets/otp_forgot_password.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  final CreateAccountController accountController = CreateAccountController();
  final TextEditingController textEmailController = TextEditingController();

  @override
  void onClose() {
    textEmailController.dispose();
    super.onClose();
  }

  var isEmailExists = false.obs;
  var isEmailNull = true.obs;
  var isEmailValid = false.obs;

  checkEmailFormat(String email) {
    if (email.isEmpty) {
      isEmailNull.value = true;
      isEmailValid.value = false;
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    isEmailValid.value = emailRegex.hasMatch(email);
    isEmailNull.value = false;
  }

  bool checkTextControllersNotEmpty() {
    bool isAnyEmpty = false;
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textEmailController, 'Email');

    // Thêm điều kiện kiểm tra các biến khác
    isAnyEmpty = isAnyEmpty || !isEmailValid.value;
    isAnyEmpty = isAnyEmpty || isEmailNull.value;
    // Thêm các điều kiện khác tương tự ở đây

    return isAnyEmpty;
  }

  bool checkControllerNotEmpty(
      TextEditingController controller, String fieldName) {
    bool isEmpty = controller.text.isEmpty;
    if (isEmpty) {
      debugPrint('$fieldName is empty');
    } else {
      debugPrint('$fieldName is empty');
      ('$fieldName is not empty');
    }
    return isEmpty;
  }

  getrequestEmail(String email) async {
    try {
      final response = await _apiHelper.requestEmail(email: email);

      final detail = response['detail'];
      if (detail == -1) {
        isEmailExists.value = true;
        return;
      } else {
        isEmailExists.value = false;
        var name = "";
        accountController.getrequestOtp(email, name);
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: OtpForgotPasswordWidget(
              email: email,
              controller: CreateAccountController(),
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
