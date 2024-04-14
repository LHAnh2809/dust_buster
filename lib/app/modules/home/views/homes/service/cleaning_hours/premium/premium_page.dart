import 'package:dust_buster/app/modules/home/views/home_view.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter/widgets.dart';

import '../../../../../exports.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity, // Đặt chiều rộng của Container
                height: 152.h, // Đặt chiều cao của Container
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.kDarkPurpleColor,
                      AppColors.kBrightPurpleColor,
                    ],
                    begin: Alignment.bottomLeft, // Điểm bắt đầu của gradient
                    end: Alignment.topRight, // Điểm kết thúc của gradient
                  ),
                ),
              ),
              Positioned(
                top: 16.w,
                left: 207.h,
                child: CustomSvg(
                  image: AppImages.iconVipCrown2,
                  color: AppColors.white.withOpacity(0.1),
                  width: 168.w,
                  height: 168.h,
                ),
              ),
              Positioned(
                left: 20.w,
                top: 56.h,
                child: ButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  widget: const CustomSvg(
                    image: AppImages.iconActionLeft,
                    color: AppColors.white,
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                top: 100.h,
                child: Text(
                  'Dịch vụ Premium là gì?',
                  style: AppTextStyle.titleBodyStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Những lợi ích khi bạn sử dụng dịch vụ Premium',
                  style: AppTextStyle.largeBodyStyle,
                ),
                SizedBox(width: 0.0, height: 24.h),
                CustomSvg(
                  image: AppImages.iconsUserStarFill,
                  color: AppColors.kSuccess600Color,
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(width: 0.0, height: 4.h),
                Text(
                  'Nhân viên có chuyên môn cao',
                  style: AppTextStyle.lableBodyStyle,
                ),
                SizedBox(width: 0.0, height: 8.h),
                Text(
                  'Được thực hiện bởi đội ngũ nhân viên có chuyên môn cao, đã qua đào tạo và cấp bằng Premium của 3Clean.',
                  style: AppTextStyle.textsmallStyle
                      .copyWith(color: AppColors.kGray600Color),
                ),
                SizedBox(width: 0.0, height: 24.h),
                CustomSvg(
                  image: AppImages.iconsStarFill,
                  color: AppColors.kSuccess600Color,
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(width: 0.0, height: 4.h),
                Text(
                  'Nhân viên được nhận xét tốt',
                  style: AppTextStyle.lableBodyStyle,
                ),
                SizedBox(width: 0.0, height: 8.h),
                Text(
                  'Được thực hiện bởi đội ngũ nhân viên được đánh giá tiêu chuẩn từ 4.9 sao trở lên và luôn được sàng lọc từ đánh giá của khách hàng và 3Clean.',
                  style: AppTextStyle.textsmallStyle
                      .copyWith(color: AppColors.kGray600Color),
                ),
                SizedBox(width: 0.0, height: 24.h),
                CustomSvg(
                  image: AppImages.iconsShieldStarFill,
                  color: AppColors.kSuccess600Color,
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(width: 0.0, height: 4.h),
                Text(
                  'Bộ công cụ làm việc đảm bảo an toàn vệ sinh',
                  style: AppTextStyle.lableBodyStyle,
                ),
                SizedBox(width: 0.0, height: 8.h),
                // Text(
                //   'Được thực hiện bởi đội ngũ nhân viên được đánh giá tiêu chuẩn từ 4.9 sao trở lên và luôn được sàng lọc từ đánh giá của khách hàng và 3Clean.',
                //   style: AppTextStyle.textsmallStyle
                //       .copyWith(color: AppColors.kGray600Color),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
