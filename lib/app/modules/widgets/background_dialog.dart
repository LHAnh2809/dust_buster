import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundDialog extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const BackgroundDialog(
      {Key? key, required this.children, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.clear,
            size: Dimens.fontSize20,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15.w, right: 15.w),
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 16.w,
          ),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: 10.borderRadius),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: AppTextStyle.semiBoldStyle.copyWith(
                      fontSize: Dimens.fontSize20, color: AppColors.black),
                ),
              ),
              SizedBox(width: 0.0, height: 16.h),
              ...children
            ],
          ),
        ),
      ],
    );
  }
}
