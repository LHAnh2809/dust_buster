import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

import '../../../../../common/util/shimmer.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 0.0, height: 70.h),
        Container(
          height: 80.h,
          width: 343.w,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
          decoration: BoxDecoration(
              color: AppColors.kBackgroundColor,
              border: Border.all(color: AppColors.kBackgroundColor, width: 0.5),
              borderRadius: 10.borderRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customShimmer(width: 130.w, height: 40.h),
              customShimmer(width: 130.w, height: 40.h),
            ],
          ),
        ),
        SizedBox(width: 0.0, height: 20.h),
        customShimmer(width: 343.w, height: 120.h),
        SizedBox(width: 0.0, height: 50.h),
        customShimmer(width: 343.w, height: 70.h),
        SizedBox(width: 0.0, height: 20.h),
        customShimmer(width: 343.w, height: 70.h),
        SizedBox(width: 0.0, height: 50.h),
        customShimmer(width: 343.w, height: 30.h),
        SizedBox(width: 0.0, height: 20.h),
        customShimmer(width: 343.w, height: 400.h),
      ],
    );
  }
}
