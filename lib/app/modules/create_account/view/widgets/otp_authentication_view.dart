import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/util/exports.dart';
import '../../../login/exports.dart';
import '../../exports.dart';

class OtpAuthenticationView extends StatelessWidget {
  final String email;
  final String name;
  final String phoneNumber;
  final String password;
  final String sex;
  final String dateBirth;
  final String referralCode;
  final CreateAccountController controller;
  const OtpAuthenticationView(
      {super.key,
      required this.email,
      required this.controller,
      required this.name,
      required this.phoneNumber,
      required this.password,
      required this.sex,
      required this.dateBirth,
      required this.referralCode});

  @override
  Widget build(BuildContext context) {
    controller.startCountdown();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          textAlign: TextAlign.center,
          '${Strings.insertCode} $email',
          style: AppTextStyle.buttonTextStyle.copyWith(
            color: AppColors.black,
            fontSize: 13.5.sp,
          ),
        ),
        SizedBox(height: 50.0.h),
        Pinput(
          length: 5,
          defaultPinTheme: controller.defaultPinTheme,
          focusedPinTheme: controller.defaultPinTheme.copyWith(
            decoration: controller.defaultPinTheme.decoration!.copyWith(
              border: Border.all(color: AppColors.kButtonColor),
            ),
          ),
          onCompleted: (pin) {
            debugPrint(pin);
            controller.getverifyOtp(email, pin, password, phoneNumber, name,
                sex, dateBirth, referralCode, context);
          },
        ),
        SizedBox(height: 5.0.h),
        Obx(() {
          if (controller.isOtpIsWrong.value == true) {
            return Text(
              Strings.otpIsWrong,
              style: AppTextStyle.regularStyle
                  .copyWith(color: Colors.red, fontSize: 11.sp),
            );
          } else {
            return const SizedBox(width: 0.0, height: 0.0);
          }
        }),
        SizedBox(height: 30.0.h),
        const Text('Bạn chưa nhận được mã!'),
        Obx(
          () {
            return controller.countdownValue.value == 0
                ? TextButtonWidget(
                    onTap: () {
                      controller.resetCountdown();
                      controller.getrequestOtp(email, name);
                    },
                    text: Strings.resendCode,
                  )
                : Text(
                    '${Strings.resendLater}: ${controller.formatDuration(controller.countdownValue.value)} s',
                  );
          },
        ),
      ],
    );
  }
}
