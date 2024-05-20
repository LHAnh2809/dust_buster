import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/util/shimmer.dart';

class MessagerLoading extends StatelessWidget {
  const MessagerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(
            width: 343.w,
            child: Row(
              children: [
                customShimmer(width: 48.w, height: 48.h, circle: true),
                SizedBox(width: 8.w, height: 0.0),
                SizedBox(
                    width: 287.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customShimmer(width: 150.w, height: 24.h),
                            customShimmer(width: 80.w, height: 16.h),
                          ],
                        ),
                        SizedBox(width: 0.0, height: 4.h),
                        customShimmer(width: 251.w, height: 20.h),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(width: 0.0, height: 16.h),
          SizedBox(
            width: 343.w,
            child: Row(
              children: [
                customShimmer(width: 48.w, height: 48.h, circle: true),
                SizedBox(width: 8.w, height: 0.0),
                SizedBox(
                    width: 287.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customShimmer(width: 150.w, height: 24.h),
                            customShimmer(width: 80.w, height: 16.h),
                          ],
                        ),
                        SizedBox(width: 0.0, height: 4.h),
                        customShimmer(width: 251.w, height: 20.h),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
