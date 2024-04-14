import 'package:dust_buster/app/common/util/shimmer.dart';
import 'package:dust_buster/app/common/values/app_colors.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter/material.dart';

class FindLocationLoading extends StatelessWidget {
  const FindLocationLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.kBackgroundColor,
              border: Border.all(color: AppColors.kBackgroundColor, width: 0.5),
              borderRadius: 10.borderRadius),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customShimmer(width: 16.w, height: 16.h),
              SizedBox(width: 10.w, height: 0.0),
              customShimmer(width: 280.w, height: 16.h),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.kBackgroundColor,
              border: Border.all(color: AppColors.kBackgroundColor, width: 0.5),
              borderRadius: 10.borderRadius),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customShimmer(width: 16.w, height: 16.h),
              SizedBox(width: 10.w, height: 0.0),
              customShimmer(width: 280.w, height: 16.h),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
              color: AppColors.kBackgroundColor,
              border: Border.all(color: AppColors.kBackgroundColor, width: 0.5),
              borderRadius: 10.borderRadius),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customShimmer(width: 16.w, height: 16.h),
              SizedBox(width: 10.w, height: 0.0),
              customShimmer(width: 280.w, height: 16.h),
            ],
          ),
        ),
      ],
    );
  }
}
