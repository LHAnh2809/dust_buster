import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../common/util/exports.dart';
import '../../../create_account/controllers/create_account_controller.dart';
import '../../../login/view/widgets/text_button_widget.dart';

class OtpForgotPasswordWidget extends StatelessWidget {
  final String email;
  final CreateAccountController controller;
  const OtpForgotPasswordWidget(
      {Key? key, required this.email, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startCountdown();
    return Scaffold(
      body: Column(
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
              controller.forgotPaswordView(email, pin, context);
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
                      },
                      text: Strings.resendCode,
                    )
                  : Text(
                      '${Strings.resendLater}: ${controller.formatDuration(controller.countdownValue.value)} s',
                    );
            },
          ),
        ],
      ),
    );
  }
}
