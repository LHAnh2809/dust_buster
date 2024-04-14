import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../common/util/exports.dart';
import '../../login/exports.dart';
import '../exports.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              AppImages.iconBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
          SizedBox(width: 10.w)
        ],
        title: Center(
          child: Text(
            Strings.createAccount,
            style:
                AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 15, right: 15, top: 10).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 0.0, height: 20.h),
                  TextFormWidget(
                    controller: controller.textEmailController,
                    hintText: Strings.email,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false.obs,
                    togglePasswordVisibility: () {},
                    showButton: false,
                    onChanged: (value) {
                      controller.checkEmailFormat(value);
                    },
                  ),
                ],
              ),
              Obx(
                () {
                  if (controller.isEmailNull.value ||
                      controller.isEmailValid.value) {
                    // Nếu email rỗng hoặc hợp lệ, không hiển thị văn bản lỗi
                    return const SizedBox();
                  } else {
                    // Nếu email không rỗng và không hợp lệ, hiển thị văn bản lỗi
                    return Column(
                      children: [
                        SizedBox(width: 0.0, height: 10.h),
                        Text(
                          Strings.malformedEmail,
                          style: AppTextStyle.textsmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textphoneNumberController,
                hintText: Strings.phoneNumber,
                textInputType: TextInputType.number,
                obscureText: false.obs,
                togglePasswordVisibility: () {},
                showButton: false,
                onChanged: (value) {
                  controller.checkPhoneNumberFormat(value);
                },
              ),
              Obx(
                () {
                  if (controller.isSdtNull.value ||
                      controller.isSdtValid.value) {
                    return const SizedBox();
                  } else {
                    return Column(
                      children: [
                        SizedBox(width: 0.0, height: 10.h),
                        Text(
                          Strings.phoneNumberIncorrect,
                          style: AppTextStyle.textsmallStyle
                              .copyWith(color: Colors.red, fontSize: 12.sp),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textNameController,
                hintText: Strings.username,
                textInputType: TextInputType.text,
                obscureText: false.obs,
                togglePasswordVisibility: () {},
                showButton: false,
                onChanged: (value) {},
              ),
              SizedBox(width: 0.0, height: 10.h),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.sex, style: AppTextStyle.textbodyStyle),
                      SizedBox(height: 5.h),
                      Stack(
                        children: [
                          Center(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.options.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(controller.options[index],
                                              style:
                                                  AppTextStyle.textsmallStyle),
                                          onTap: () {
                                            controller.selectedOption.value =
                                                controller.options[index];
                                            controller.textSexPasswordController
                                                    .text =
                                                controller.options[index];
                                            Get.back();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 45.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.1),
                                      blurRadius: 7.r,
                                    ),
                                  ],
                                ),
                                child: Obx(
                                  () => Center(
                                    child: Text(controller.selectedOption.value,
                                        style: AppTextStyle.textsmallStyle),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w, height: 0),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.dateOfBirth,
                          style: AppTextStyle.textbodyStyle,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 45.h,
                          padding: const EdgeInsets.only(left: 10, right: 10).r,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 7.r,
                              ),
                            ],
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              controller.selectDate();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Obx(
                                  () => Text(
                                    controller.dateBirth.value,
                                    style:
                                        AppTextStyle.buttonTextStyle.copyWith(
                                      color: AppColors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textPasswordController,
                hintText: Strings.password,
                textInputType: TextInputType.visiblePassword,
                obscureText: controller.isPasswordVisible,
                togglePasswordVisibility: () {
                  controller.togglePasswordVisibility();
                },
                showButton: true,
                onChanged: (value) {
                  controller.checkPassWordFormat(value);
                  controller.checkPasswordsMatch(value,
                      controller.textReEnterPasswordController.value.text);
                },
              ),
              SizedBox(width: 0.0, height: 7.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.characters,
                  color: controller.isCharacters.value
                      ? AppColors.kGreenChart
                      : AppColors.kGreyChart,
                );
              }),
              SizedBox(width: 0.0, height: 5.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.capitalLetter,
                  color: controller.isCapitalLetter.value
                      ? AppColors.kGreenChart
                      : AppColors.kGreyChart,
                );
              }),
              SizedBox(width: 0.0, height: 5.h),
              Obx(() {
                return CheckDkPwWidget(
                  text: Strings.oneDigit,
                  color: controller.isOneDigit.value
                      ? AppColors.kGreenChart
                      : AppColors.kGreyChart,
                );
              }),
              SizedBox(width: 0.0, height: 10.h),
              TextFormWidget(
                controller: controller.textReEnterPasswordController,
                hintText: Strings.reEnterPassword,
                textInputType: TextInputType.text,
                obscureText: controller.isPasswordVisible,
                togglePasswordVisibility: () {
                  controller.togglePasswordVisibility();
                },
                showButton: true,
                onChanged: (value) {
                  controller.checkPasswordsMatch(
                      controller.textPasswordController.value.text, value);
                },
              ),
              SizedBox(width: 0.0, height: 10.h),
              Obx(
                () {
                  if (controller.isCheckGd.value == false) {
                    return Text(
                      Strings.notTheSame,
                      style: AppTextStyle.textsmallStyle
                          .copyWith(color: Colors.red, fontSize: 12.sp),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              SizedBox(width: 0.0, height: 5.h),
              Obx(
                () => TextFormWidget(
                  controller: controller.textreferralCodeController,
                  hintText: Strings.referralCode,
                  textInputType: TextInputType.text,
                  obscureText: false.obs,
                  togglePasswordVisibility: () {},
                  showButton: false,
                  obscureCode: controller.isReferralCode,
                  showButtonDone: controller.isReferralCodeNull.value,
                  onChanged: (value) {
                    controller.referralCodeNull(value);
                    controller.getCheckreferralCode(value);
                    debugPrint(value);
                  },
                ),
              ),
              SizedBox(width: 0.0, height: 10.h),
              Stack(
                children: [
                  Center(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showDialogConfirm(
                          child: Center(
                            child: LoadingAnimationWidget.discreteCircle(
                              color: AppColors.white,
                              size: 50.r,
                            ),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          Get.back();
                          controller.setTextControllerDefaultIfEmpty(
                              controller.textSexPasswordController, 'Khác');

                          if (controller.checkTextControllersNotEmpty() ==
                              true) {
                          } else {
                            if (controller.isReferralCodeNull.value == true &&
                                controller.isReferralCode.value == true) {
                              controller.getrequestOtp(
                                controller.textEmailController.value.text,
                                controller.textNameController.value.text,
                              );
                              String email =
                                  controller.textEmailController.value.text;
                              Get.bottomSheet(
                                Container(
                                  padding: const EdgeInsets.only(
                                          top: 20, left: 20, right: 20)
                                      .r,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: OtpAuthenticationView(
                                    email: email,
                                    name: controller
                                        .textNameController.value.text,
                                    phoneNumber: controller
                                        .textphoneNumberController.value.text,
                                    controller: CreateAccountController(),
                                    password: controller
                                        .textPasswordController.value.text,
                                    sex: controller
                                        .textSexPasswordController.value.text,
                                    dateBirth: controller.dateBirth.value,
                                    referralCode: controller
                                        .textreferralCodeController.value.text,
                                  ),
                                ),
                              );
                            } else if (controller.isReferralCodeNull.value ==
                                    false &&
                                controller.isReferralCode.value == false) {
                              controller.getrequestOtp(
                                controller.textEmailController.value.text,
                                controller.textNameController.value.text,
                              );
                              String email =
                                  controller.textEmailController.value.text;
                              Get.bottomSheet(
                                Container(
                                  padding: const EdgeInsets.only(
                                          top: 20, left: 20, right: 20)
                                      .r,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: OtpAuthenticationView(
                                    email: email,
                                    name: controller
                                        .textNameController.value.text,
                                    phoneNumber: controller
                                        .textphoneNumberController.value.text,
                                    controller: CreateAccountController(),
                                    password: controller
                                        .textPasswordController.value.text,
                                    sex: controller
                                        .textSexPasswordController.value.text,
                                    dateBirth: controller.dateBirth.value,
                                    referralCode: controller
                                        .textreferralCodeController.value.text,
                                  ),
                                ),
                              );
                            } else {
                              Get.snackbar(
                                'Thông báo',
                                'Mã xác giới thiệu không tồn tại!',
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 3),
                                backgroundColor:
                                    AppColors.kSelectedDay.withOpacity(0.7),
                                colorText: Colors.white,
                              );
                            }
                          }
                        });
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
                          Strings.continues,
                          style: AppTextStyle.buttonTextStyle.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 0.0, height: 5.h),
              if (controller.isEmailExists.value == true)
                Text(
                  Strings.emailAlreadyExists,
                  style: AppTextStyle.textsmallStyle
                      .copyWith(color: Colors.red, fontSize: 12.sp),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
