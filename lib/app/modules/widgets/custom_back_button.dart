import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/exports.dart';

class CustomBackButton extends StatelessWidget {
  final Widget? leading;
  final Function()? onBackTap;
  final Color? backbuttonColor;

  const CustomBackButton({
    Key? key,
    this.leading,
    this.onBackTap,
    this.backbuttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onBackTap ?? () => Get.back(),
      widget: leading ??
          Icon(
            Icons.arrow_back_ios_rounded,
            size: 18.sp,
            color: backbuttonColor ?? Get.theme.primaryIconTheme.color,
          ).paddingOnly(left: 10.w),
    );
  }
}
