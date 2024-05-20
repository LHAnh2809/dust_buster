import 'dart:async';
import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/create_account/view/widgets/check_dk_pw_widget.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../login/exports.dart';

class CreateAccountController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  final TextEditingController textEmailController = TextEditingController();
  final TextEditingController textphoneNumberController =
      TextEditingController();
  final TextEditingController textNameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();
  final TextEditingController textReEnterPasswordController =
      TextEditingController();
  final TextEditingController textSexPasswordController =
      TextEditingController();
  final TextEditingController textreferralCodeController =
      TextEditingController();

  // Rx<File?> imageFile = Rx<File?>(null);
  // final picker = ImagePicker();

  var isEmailValid = false.obs;
  var isEmailNull = true.obs;
  var isSdtValid = false.obs;
  var isSdtNull = true.obs;
  var isPasswordVisible = true.obs;

  var isCharacters = false.obs;
  var isCapitalLetter = false.obs;
  var isOneDigit = false.obs;
  var isCheckGd = true.obs;

  var isEmailExists = false.obs;
  var isOtpIsWrong = false.obs;
  var isReferralCode = false.obs;
  var isReferralCodeNull = false.obs;

  final List<String> options = ['Khác', 'Nam', 'Nữ'];
  final RxString selectedOption = RxString('Khác');
  var dateTime = DateTime.now().obs;
  var countdownValue = 60.obs;
  late Timer _timer;
  final RxString dateBirth = "".obs;
  @override
  void onInit() {
    String formattedDate = dateTime.value.formatDMY;

    dateBirth.value = formattedDate;
    super.onInit();
  }

  selectDate() {
    goDatePicker(
      onDateChanged: (DateTime? selectedDate) {
        // Xử lý ngày được chọn ở đây
        if (selectedDate != null) {
          String formattedDate = selectedDate.formatDMY;
          dateBirth.value = formattedDate;
        } else {
          debugPrint('No date selected');
        }
      },
    );
  }

  @override
  void dispose() {
    // imageFile.close();
    super.dispose();
  }

  @override
  void onClose() {
    textEmailController.dispose();
    textphoneNumberController.dispose();
    textNameController.dispose();
    textPasswordController.dispose();
    textReEnterPasswordController.dispose();
    textSexPasswordController.dispose();
    textreferralCodeController.dispose();
    super.onClose();
  }

  bool checkTextControllersNotEmpty() {
    bool isAnyEmpty = false;
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textEmailController, 'Email');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(textphoneNumberController, 'Phone number');
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textNameController, 'Name');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(textPasswordController, 'Password');
    isAnyEmpty = isAnyEmpty ||
        checkControllerNotEmpty(
            textReEnterPasswordController, 'Re-enter Password');
    isAnyEmpty =
        isAnyEmpty || checkControllerNotEmpty(textSexPasswordController, 'Sex');

    // Thêm điều kiện kiểm tra các biến khác
    isAnyEmpty = isAnyEmpty || !isEmailValid.value;
    isAnyEmpty = isAnyEmpty || isEmailNull.value;
    // Thêm các điều kiện khác tương tự ở đây

    return isAnyEmpty;
  }

  bool checkTextPasswordNotEmpty() {
    bool isAnyEmpty = false;
    // Kiểm tra xem mật khẩu có đủ độ dài
    isAnyEmpty = isAnyEmpty ||
        textPasswordController.value.text.length < 8 ||
        textReEnterPasswordController.value.text.length < 8;

    // Kiểm tra xem mật khẩu có chứa ít nhất một chữ in hoa
    isAnyEmpty = isAnyEmpty || !isCapitalLetter.value;

    // Kiểm tra xem mật khẩu có chứa ít nhất một chữ số
    isAnyEmpty = isAnyEmpty || !isOneDigit.value;

    // Kiểm tra xem hai mật khẩu có khớp nhau
    if (textPasswordController.value.text !=
        textReEnterPasswordController.value.text) {
      isAnyEmpty = true;
    }

    return isAnyEmpty;
  }

  bool checkControllerNotEmpty(
      TextEditingController controller, String fieldName) {
    bool isEmpty = controller.text.isEmpty;
    if (!isEmpty) {
      debugPrint('$fieldName is empty');
    } else {
      debugPrint('$fieldName is empty');
      ('$fieldName is not empty');
    }
    return isEmpty;
  }

  void setTextControllerDefaultIfEmpty(
      TextEditingController controller, String defaultValue) {
    if (controller.text.isEmpty) {
      controller.text = defaultValue;
    }
  }

  void checkEmailFormat(String email) {
    if (email.isEmpty) {
      isEmailNull.value = true;
      isEmailValid.value = false;
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    isEmailValid.value = emailRegex.hasMatch(email);
    isEmailNull.value = false;
  }

  void checkPhoneNumberFormat(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      isSdtNull.value = true;
      isSdtValid.value = false;
      return;
    }

    final phoneNumberRegex = RegExp(r'^[0-9]{10}$');

    isSdtValid.value = phoneNumberRegex.hasMatch(phoneNumber);
    isSdtNull.value = false;
  }

  void checkPassWordFormat(String password) {
    isCharacters.value = password.length >= 8;

    isCapitalLetter.value = password.contains(RegExp(r'[A-Z]'));

    isOneDigit.value = password.contains(RegExp(r'[0-9]'));
  }

  void checkPasswordsMatch(String password1, String password2) {
    if (password2.isEmpty) {
      isCheckGd.value = true;
      return;
    }
    if (password1 != password2) {
      isCheckGd.value = false;
      return;
    }
    // So sánh hai chuỗi mật khẩu với nhau
    if (password1 == password2) {
      isCheckGd.value = true;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void referralCodeNull(String code) {
    if (code.isEmpty) {
      isReferralCodeNull.value = false;
      return;
    }
    isReferralCodeNull.value = true;
  }

  final defaultPinTheme = PinTheme(
    width: 45.w,
    height: 45.h,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.black),
    ),
  );

  void startCountdown() {
    if (countdownValue.value < 60 && countdownValue.value > 1) {
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownValue.value > 0) {
        countdownValue.value -= 1;
      } else {
        _timer.cancel();
      }
    });
  }

  void resetCountdown() {
    countdownValue.value = 60;
    startCountdown();
  }

  String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String formatDate(String dateStr) {
    // Tách chuỗi ngày thành các thành phần: ngày, tháng, năm
    List<String> parts = dateStr.split('/');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Định dạng ngày và tháng thành chuỗi có hai chữ số
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');

    // Trả về chuỗi ngày được định dạng mới
    return '$formattedDay/$formattedMonth/$year';
  }

  getCheckreferralCode(String code) async {
    try {
      final response = await _apiHelper.referralCode(code: code);
      final detail = response['detail'];
      if (detail == -1) {
        isReferralCode.value = false;
        return;
      } else {
        isReferralCode.value = true;
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getrequestOtp(String email, String name) async {
    try {
      final response = await _apiHelper.requestOtp(email: email, name: name);

      final detail = response['detail'];
      if (detail == -1) {
        isEmailExists.value = true;
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getverifyOtp(
      String email,
      String otp,
      String password,
      String phoneNumber,
      String name,
      String sex,
      String datebirth,
      String referralCode,
      context) async {
    try {
      final response = await _apiHelper.verifyOtp(email: email, otp: otp);
      final detail = response['detail'];
      if (detail == -1) {
        isOtpIsWrong.value = true;
        return;
      } else {
        int sexs;
        if (sex == "Nam") {
          sexs = 1;
        } else if (sex == "Nữ") {
          sexs = 2;
        } else {
          sexs = 0;
        }
        String formattedDate = formatDate(datebirth);
        await _apiHelper.portCreateUsers(
          password: password,
          phoneNumber: phoneNumber,
          email: email,
          name: name,
          sex: sexs,
          datebirth: formattedDate,
          referralCode: referralCode,
        );

        Get.offNamed(Routes.login);
        return Utils.showSnackbar(
            message:
                "Bạn đã đăng ký thành công vui lòng đăng nhập để sử dụng dịch vụ",
            colors: AppColors.amaranth);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getforgotPassword(String email, String newPassword) async {
    try {
      await _apiHelper.forgotPassword(email: email, newPassword: newPassword);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void forgotPaswordView(email, otp, context) async {
    final response = await _apiHelper.verifyOtp(email: email, otp: otp);
    final detail = response['detail'];
    if (detail == -1) {
      isOtpIsWrong.value = true;
      return;
    }
    Get.bottomSheet(
      // isScrollControlled: true,
      Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20).r,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.plsNewPassword,
                style: AppTextStyle.semiBoldMediumStyle
                    .copyWith(color: Colors.black),
              ),
              SizedBox(width: 0.0, height: 20.h),
              TextFormWidget(
                controller: textPasswordController,
                hintText: Strings.newPassword,
                textInputType: TextInputType.visiblePassword,
                obscureText: isPasswordVisible,
                togglePasswordVisibility: () {
                  togglePasswordVisibility();
                },
                showButton: true,
                onChanged: (value) {
                  checkPassWordFormat(value);
                  checkPasswordsMatch(
                      value, textReEnterPasswordController.value.text);
                },
              ),
              SizedBox(width: 0.0, height: 7.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.characters,
                  color: isCharacters.value
                      ? AppColors.kGreenChart
                      : AppColors
                          .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                );
              }),
              SizedBox(width: 0.0, height: 5.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.capitalLetter,
                  color: isCapitalLetter.value
                      ? AppColors.kGreenChart
                      : AppColors
                          .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                );
              }),
              SizedBox(width: 0.0, height: 5.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.oneDigit,
                  color: isOneDigit.value
                      ? AppColors.kGreenChart
                      : AppColors
                          .kGreyChart, // Sử dụng màu đỏ nếu không đáp ứng điều kiện
                );
              }),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: textReEnterPasswordController,
                hintText: Strings.reEnterPassword,
                textInputType: TextInputType.text,
                obscureText: isPasswordVisible,
                togglePasswordVisibility: () {
                  togglePasswordVisibility();
                },
                showButton: true,
                onChanged: (value) {
                  checkPasswordsMatch(textPasswordController.value.text, value);
                },
              ),
              SizedBox(width: 0.0, height: 5.h),
              Obx(
                () {
                  if (isCheckGd.value == false) {
                    return Text(
                      Strings.notTheSame,
                      style: AppTextStyle.buttonTextStyle
                          .copyWith(color: Colors.red, fontSize: 12.sp),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (checkTextPasswordNotEmpty() == true) {
                  } else {
                    getforgotPassword(email, textPasswordController.value.text);
                    Get.snackbar(
                      'Thông báo',
                      'Bạn đã đăng ký thành công vui lòng đăng nhập',
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 3),
                      backgroundColor: AppColors.kSelectedDay.withOpacity(0.7),
                      colorText: Colors.white,
                    );
                    Get.offNamed(Routes.login);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.kButtonColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8).r,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kButtonColor.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Text(
                    Strings.confirm,
                    style: AppTextStyle.buttonTextStyle.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
