import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

import '../../../../common/util/shimmer.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 343.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customShimmer(width: 48.w, height: 48.h),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customShimmer(width: 150.w, height: 10.h),
                  SizedBox(width: 30.w, height: 0.0),
                  customShimmer(width: 80.w, height: 10.h),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  customShimmer(width: 235.w, height: 10.h),
                  SizedBox(width: 30.w, height: 0.0),
                  customShimmer(width: 8.w, height: 8.h),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
