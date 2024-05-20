import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/util/exports.dart';


class PartnerInformation extends StatelessWidget {
  final String id;
  final String image;
  const PartnerInformation({Key? key, required this.id, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.w,
      height: 48.h,
      child: Stack(
        children: [
          if (image != "")
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.kGray200Color,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
          if (image == "")
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.kGray200Color,
                shape: BoxShape.circle,
                border: Border.all(width: 3),
              ),
              child: SvgPicture.asset(
                AppImages.iconAvtUser,
                fit: BoxFit.cover,
                width: 41.w,
                height: 41.h,
              ),
            ),
          if (image == "")
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: AppColors.kGray200Color),
              ),
            ),
          if (id != "")
            Positioned(
              top: 32.h,
              left: 32.w,
              child: Container(
                width: 16.w,
                height: 16.h,
                padding: const EdgeInsets.all(1).r,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x0a000000).withOpacity(0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 4.r,
                        spreadRadius: -1.r,
                      ),
                      BoxShadow(
                        color: const Color(0x0a000000).withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 6.r,
                        spreadRadius: -1.r,
                      ),
                    ]),
                child: SvgPicture.asset(
                  AppImages.iconsShieldStarFill,
                  fit: BoxFit.cover,
                  color: AppColors.kSuccess600Color,
                ),
              ),
            ),
          if (id == "")
            Positioned(
              top: 32.h,
              left: 32.w,
              child: Container(
                width: 16.w,
                height: 16.h,
                padding: const EdgeInsets.all(1).r,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x0a000000).withOpacity(0.06),
                        offset: const Offset(0, 2),
                        blurRadius: 4.r,
                        spreadRadius: -1.r,
                      ),
                      BoxShadow(
                        color: const Color(0x0a000000).withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 6.r,
                        spreadRadius: -1.r,
                      ),
                    ]),
                child: SvgPicture.asset(
                  AppImages.iconTimeLine,
                  fit: BoxFit.cover,
                  color: AppColors.kPurplePurpleColor,
                ),
              ),
            )
        ],
      ),
    );
  }
}
