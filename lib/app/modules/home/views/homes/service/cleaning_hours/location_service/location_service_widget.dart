import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../widgets/custom_status_widget.dart';

class LocationServiceWidget extends StatelessWidget {
  final CleaningController? controller;
  const LocationServiceWidget({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vị trí làm việc',
          style: AppTextStyle.textButtonStyle
              .copyWith(color: AppColors.kGray1000Color),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          height: 90.h,
          width: 343.w,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8).r,
          decoration: BoxDecoration(
            color: AppColors.kGray100Color,
            borderRadius: BorderRadius.circular(8).r,
            border: Border.all(color: AppColors.kGray100Color),
          ),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller!.textLocation2.toString(),
                      style: AppTextStyle.textbodyStyle,
                    ),
                    ButtonWidget(
                      onTap: () {
                        goPresent(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chọn địa chỉ làm việc',
                                  style: AppTextStyle.textButtonStyle.copyWith(
                                      color: AppColors.kGray1000Color),
                                ),
                                ButtonWidget(
                                  onTap: () {
                                    Get.back();
                                  },
                                  widget: SvgPicture.asset(
                                    AppImages.iconClose,
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                  boder: false.obs,
                                )
                              ],
                            ),
                            SizedBox(width: 0.0, height: 16.h),
                            Flexible(
                              child: ListView.separated(
                                itemCount: controller!.locations.length,
                                itemBuilder: (context, index) {
                                  final location = controller!.locations[index];
                                  final isSelected =
                                      controller!.selectedLocation.value ==
                                          index;
                                  final color =
                                      controller!.selectedLocation.value ==
                                              index
                                          ? AppColors.kGray1000Color
                                          : AppColors.kGray500Color;
                                  return ButtonWidget(
                                    onTap: () {
                                      controller!.selectLocation(index);
                                      controller!.textLocation.value =
                                          location.location;
                                      controller!.textLocation2.value =
                                          location.location2;
                                      controller!.textLat.value = location.lat;
                                      controller!.textLng.value = location.lng;
                                      Get.back();
                                    },
                                    widget: Container(
                                      height: 68.h,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8)
                                          .r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8).r,
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.kGray1000Color
                                              : AppColors.kGray500Color,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              LinearGradient gradient;
                                              if (location.defaultt == 1) {
                                                gradient = const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors
                                                        .kBrightPurpleColor,
                                                    AppColors.kDarkPurpleColor,
                                                  ],
                                                );
                                              } else {
                                                gradient = const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors.kGray400Color,
                                                    AppColors.kGray400Color,
                                                  ],
                                                );
                                              }
                                              return gradient
                                                  .createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcIn,
                                            child: SizedBox(
                                              height: 24.h,
                                              width: 24.w,
                                              child: SvgPicture.asset(
                                                AppImages.iconLocation,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 259.w,
                                            height: 50.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      location.location2,
                                                      style: AppTextStyle
                                                          .textsmallStyle12,
                                                    ),
                                                    SizedBox(
                                                        width: 8.w,
                                                        height: 0.0),
                                                    if (location.defaultt == 1)
                                                      CustomStatusWidget(
                                                        width: 61.w,
                                                        height: 12.h,
                                                        widget: Text(
                                                          Strings.defaultt,
                                                          style: AppTextStyle
                                                              .textsmallStyle10
                                                              .copyWith(
                                                            color: AppColors
                                                                .kGray700Color,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: 0.0, height: 4.h),
                                                Expanded(
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    location.location,
                                                    style: AppTextStyle
                                                        .textxsmallStyle40010
                                                        .copyWith(
                                                            fontFamily:
                                                                "PlusJakartaSans"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          CustomSvg(
                                            image: isSelected
                                                ? AppImages
                                                    .iconRadioButtonChecked
                                                : AppImages
                                                    .iconRadioButtonUnchecked,
                                            color: color,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 0.0, height: 8.h),
                              ),
                            ),
                          ],
                        );
                      },
                      widget: Container(
                        height: 24.h,
                        width: 67.w,
                        padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 7)
                            .r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(color: AppColors.kGray1000Color),
                        ),
                        child: Text(
                          Strings.change,
                          style: AppTextStyle.textsmallStyle12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 0.0, height: 7.h),
                Expanded(
                  child: Text(
                    controller!.textLocation.toString(),
                    style: AppTextStyle.textxsmallStyle
                        .copyWith(fontFamily: 'PlusJakartaSans'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
