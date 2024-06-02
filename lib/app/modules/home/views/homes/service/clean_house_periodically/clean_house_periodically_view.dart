import 'dart:ffi';

import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../common/util/exports.dart';
import '../../../../../../common/util/navigator.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../../widgets/custom_status_widget.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../work/views/widgets/job_details_widget.dart';
import '../../../../controllers/cleaning_controller.dart';
import '../cleaning_hours/time/work_details.dart';
import 'configuration/configuration_page.dart';
import 'description/description_service.dart';

class CleanHousePeriodicallyView extends StatelessWidget {
  final String id;
  final String idL;
  final String location2;
  final String nameSV;
  final int lable;
  const CleanHousePeriodicallyView({
    Key? key,
    required this.id,
    required this.idL,
    required this.location2,
    required this.nameSV,
    required this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CleaningController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        centerTitle: controller.selectedIndex.value == 1 ? true : false,
        titleWidget: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (controller.selectedIndex.value != 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dọn dẹp nhà định kỳ',
                      style: AppTextStyle.textButtonStyle
                          .copyWith(color: AppColors.kGray1000Color),
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
                                itemCount: controller.locations.length,
                                itemBuilder: (context, index) {
                                  final location = controller.locations[index];
                                  final isSelected =
                                      controller.selectedLocation.value ==
                                          index;
                                  final color =
                                      controller.selectedLocation.value == index
                                          ? AppColors.kGray1000Color
                                          : AppColors.kGray500Color;
                                  return ButtonWidget(
                                    onTap: () {
                                      controller.selectLocation(index);
                                      controller.textLocation.value =
                                          location.location;
                                      controller.textLocation2.value =
                                          location.location2;
                                      controller.textLat.value = location.lat;
                                      controller.textLng.value = location.lng;
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
                      widget: Row(
                        children: [
                          Text(
                            controller.textLocation2.toString(),
                            style: AppTextStyle.textxsmallStyle
                                .copyWith(color: AppColors.kGray1000Color),
                          ),
                          SvgPicture.asset(AppImages.iconsArrowDownLine,
                              width: 16.w, height: 16.h, color: AppColors.black)
                        ],
                      ),
                    ),
                  ],
                ),
              if (controller.selectedIndex.value == 1)
                Text(
                  'Xác thực và thanh toán',
                  style: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
            ],
          ),
        ),
        actions: [
          Obx(() {
            if (controller.selectedIndex.value != 1) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 16).r,
                    child: ButtonWidget(
                      onTap: () {
                        goPresent(
                          children: [
                            const DescriptionService(),
                          ],
                        );
                        debugPrint('a');
                        print(controller.removeDays);
                      },
                      widget: SvgPicture.asset(
                        AppImages.iconErrorWarning,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabControllerPeriodicCleaning,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ConfigurationPage(
                  controller: controller,
                  lable: lable,
                ),
                WorkDetails(controller: controller, lable: lable),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              width: 375.w,
              height: controller.selectedIndexPeriodicCleaning.value == 1
                  ? 121.h
                  : 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TabBar(
                      onTap: (index) {
                        controller.selectTabsPeriodicCleaning(index);
                      },
                      isScrollable: false,
                      controller: controller.tabControllerPeriodicCleaning,
                      labelPadding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.zero,
                      unselectedLabelColor: AppColors.kGrayTextColor,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicator: const BoxDecoration(),
                      tabs: [
                        _buildTab(
                            controller.selectedIndexPeriodicCleaning.value, 0),
                        _buildTab(
                            controller.selectedIndexPeriodicCleaning.value, 1),
                      ],
                    ),
                  ),
                  controller.selectedIndexPeriodicCleaning.value == 1
                      ? Container(
                          width: 375.w,
                          height:
                              controller.selectedIndexPeriodicCleaning.value ==
                                      1
                                  ? 116.h
                                  : 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tổng cộng',
                                    style: AppTextStyle.textsmallStyle60016,
                                  ),
                                  Text(
                                    '${Utils.formatNumber(int.parse(controller.finalMoney.toString()))}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                ],
                              ),
                              Obx(
                                () => Column(
                                  children: [
                                    if (controller.isLoading.value == false)
                                      ButtonWidget(
                                        onTap: () {
                                          controller.posttCreateInvoice(lable);
                                        },
                                        text: 'Đăng việc',
                                        height: 48.h,
                                        colorBackGroud: AppColors.kButtonColor,
                                      ),
                                    if (controller.isLoading.value == true)
                                      Container(
                                        alignment: Alignment.center,
                                        height: 45.h,
                                        padding: const EdgeInsets.only(
                                                top: 4, bottom: 4)
                                            .r,
                                        decoration: BoxDecoration(
                                          color: AppColors.kButtonColor
                                              .withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(8).r,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.kButtonColor
                                                  .withOpacity(0.2),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                        child: LoadingAnimationWidget
                                            .threeArchedCircle(
                                          color: AppColors.white,
                                          size: 50.r,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 375.w,
                          height: 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Utils.formatNumber(int.parse(controller.originalAmount.toString()))}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                  Text(
                                    '${controller.totalNumberSessions} buổi',
                                    style: AppTextStyle.textsmallStyle.copyWith(
                                        color: AppColors.kGray500Color,
                                        fontFamily: 'PlusJakartaSans'),
                                  ),
                                ],
                              ),
                              Obx(
                                () => ButtonWidget(
                                  onTap: () {
                                    goPresent(children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Chọn giờ làm',
                                            style: AppTextStyle.textButtonStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .kGray1000Color),
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
                                      SizedBox(
                                        height: 212.h,
                                        child: CupertinoDatePicker(
                                          minimumDate: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              7),
                                          maximumDate: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              20),
                                          backgroundColor: AppColors.white,
                                          initialDateTime:
                                              controller.dateTime.value.hour < 7
                                                  ? DateTime.now().add(
                                                      const Duration(hours: 1))
                                                  : DateTime(
                                                      DateTime.now().year,
                                                      DateTime.now().month,
                                                      DateTime.now().day,
                                                      7),
                                          onDateTimeChanged:
                                              (DateTime newDate) {
                                            if (newDate.hour < 7) {
                                              controller.dateTime.value =
                                                  DateTime(
                                                      newDate.year,
                                                      newDate.month,
                                                      newDate.day,
                                                      7);
                                            } else if (newDate.hour >= 20) {
                                              controller.dateTime.value =
                                                  DateTime(
                                                      newDate.year,
                                                      newDate.month,
                                                      newDate.day,
                                                      19,
                                                      59);
                                            } else {
                                              controller.dateTime.value =
                                                  newDate;
                                            }

                                            int selectedHour = newDate.hour;
                                            controller.getDateAll();
                                            controller.nightMoney(
                                                selectedHour, 2);
                                          },
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.time,
                                        ),
                                      ),
                                      SizedBox(width: 0.0, height: 16.h),
                                    ]);
                                  },
                                  widget: Container(
                                    height: 48.h,
                                    padding: const EdgeInsets.all(12).r,
                                    decoration: BoxDecoration(
                                      color: AppColors.kGrayBackgroudColor,
                                      borderRadius: BorderRadius.circular(8).r,
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.kGray200Color),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${controller.dateTime.value.hour.toString().padLeft(2, '0')}:${controller.dateTime.value.minute.toString().padLeft(2, '0')}',
                                          style: AppTextStyle
                                              .textsmallStyle60016
                                              .copyWith(
                                                  color:
                                                      AppColors.kGray900Color),
                                        ),
                                        SvgPicture.asset(
                                          AppImages.iconTimeLine,
                                          width: 24.w,
                                          height: 24.h,
                                          color: AppColors.kGray400Color,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(int selextindex, int index) {
    return Tab(
      child: selextindex >= index
          ? Container(
              width: 186.5.w,
              height: 4.h,
              color: AppColors.black,
            )
          : Container(
              width: 186.5.w,
              height: 4.h,
              color: AppColors.kGray200Color,
            ),
    );
  }
}
