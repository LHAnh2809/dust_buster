import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../common/util/navigator.dart';
import '../pet_note/pet_note_page.dart';
import '../premium/premium_page.dart';

class OtherOptionsPage extends StatelessWidget {
  final CleaningController controller;
  const OtherOptionsPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 0.0, height: 24.h),
        Container(
          width: 343.w,
          height: 56.h,
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            color: AppColors.kWarning050Color,
            borderRadius: BorderRadius.circular(12).r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImages.iconVipCrown2,
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.kYellowColor,
                  ),
                  SizedBox(width: 8.w, height: 0.0),
                  Text(
                    "Dịch vụ Premium",
                    style: AppTextStyle.textbodyStyle,
                  ),
                  SizedBox(width: 4.w, height: 0.0),
                  ButtonWidget(
                    onTap: () {
                      Get.to(() => const PremiumPage());
                    },
                    widget: SizedBox(
                      height: 20.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        AppImages.iconErrorWarningLine,
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => CustomSwitch(
                  value: controller.isPremiumService.value.obs,
                  onToggle: (bool value) {
                    controller.isPremiumService.value = value;
                    controller.updatePrimium();
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 0.0, height: 24.h),
        Text(
          'Tùy Chọn khác',
          style: AppTextStyle.lableBodyStyle,
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          width: 343.w,
          height: 56.h,
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColors.kGray200Color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Ưu tiên người làm yêu thích",
                    style: AppTextStyle.textbodyStyle,
                  ),
                  SizedBox(width: 4.w, height: 0.0),
                  ButtonWidget(
                    onTap: () {
                      goPresent(
                        children: [
                          const DescriptionService(),
                        ],
                      );
                    },
                    widget: SizedBox(
                      height: 20.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        AppImages.iconErrorWarningLine,
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => CustomSwitch(
                  value: controller.isFavoriteMaker.value.obs,
                  onToggle: (bool value) {
                    controller.isFavoriteMaker.value = value;
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          width: 343.w,
          height: 56.h,
          padding: const EdgeInsets.all(15).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColors.kGray200Color),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Nhà Có vật nuôi",
                        style: AppTextStyle.textbodyStyle,
                      ),
                      SizedBox(width: 4.w, height: 0.0),
                      ButtonWidget(
                        onTap: () {
                          goPresent(
                            children: [
                              const PetNotePage(),
                            ],
                          );
                        },
                        widget: SizedBox(
                          height: 20.h,
                          width: 24.w,
                          child: SvgPicture.asset(
                            AppImages.iconErrorWarningLine,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => CustomSwitch(
                      value: controller.isPet.value.obs,
                      onToggle: (bool value) {
                        controller.isPet.value = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
