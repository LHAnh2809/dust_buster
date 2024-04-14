import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/util/exports.dart';

class ButtonHistoryBenefitsWidget extends StatelessWidget {
  const ButtonHistoryBenefitsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Column(
              children: [
                Container(
                  height: 45.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 165, 52, 206),
                    borderRadius: BorderRadius.circular(35).r,
                  ),
                  child: SvgPicture.asset(
                    AppImages.iconHistory,
                    color: AppColors.white,
                    height: 27.h,
                    width: 27.w,
                  ),
                ),
                SizedBox(width: 0.0, height: 5.w),
                Text(
                  'Lịch sử điểm',
                  style: AppTextStyle.titleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.5.sp,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Column(
              children: [
                Container(
                  height: 45.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 165, 52, 206),
                    borderRadius: BorderRadius.circular(35).r,
                  ),
                  child: SvgPicture.asset(
                    AppImages.iconRight,
                    color: AppColors.white,
                    height: 27.h,
                    width: 27.w,
                  ),
                ),
                SizedBox(width: 0.0, height: 5.w),
                Text(
                  'Quyền lợi của bạn',
                  style: AppTextStyle.titleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.5.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
