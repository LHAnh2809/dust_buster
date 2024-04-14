import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/util/exports.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? height;
  final TextInputType textInputType;
  final RxBool obscureText;
  final RxBool? obscureCode;
  final Function() togglePasswordVisibility;
  final Function(String) onChanged;
  final bool? showButton;
  final bool? showButtonDone;
  final int? maxLines;

  const TextFormWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.obscureText,
    required this.togglePasswordVisibility,
    required this.showButton,
    required this.onChanged,
    this.showButtonDone,
    this.obscureCode,
    this.height, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: height ?? 48.h,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12).r,
      decoration: BoxDecoration(
        color: AppColors.kGrayBackgroudColor,
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(width: 1.w, color: AppColors.kGrayBorderColor),
      ),
      child: Obx(
        () => Stack(
          alignment: Alignment.centerRight,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: showButton != null && showButton! ? 40 : 0),
              child: TextFormField(
                maxLines: maxLines ?? 1,
                controller: controller,
                keyboardType: textInputType,
                obscureText: obscureText.value,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  // errorBorder: InputBorder.none,
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  // disabledBorder: InputBorder.none,
                  // focusedErrorBorder: InputBorder.none,
                  hintStyle:
                      const TextStyle(color: AppColors.kGrayTextFormColor),
                  filled: false,
                ),
              ),
            ),
            if (showButton != null && showButton!)
              InkWell(
                onTap: togglePasswordVisibility,
                child: Icon(
                  obscureText.value ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            if (showButtonDone != null && showButtonDone!)
              obscureCode!.value
                  ? SvgPicture.asset(
                      AppImages.iconCircleCheck,
                      color: AppColors.caribbeanGreen,
                    )
                  : SvgPicture.asset(
                      AppImages.iconCloseCircleFill,
                      color: AppColors.amaranth,
                    )
          ],
        ),
      ),
    );
  }
}
