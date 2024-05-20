import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../common/util/calendar/cupertino/date_picker.dart';
import '../../../../../../../common/util/exports.dart';
import '../../../../../../../common/util/navigator.dart';
import '../../../../../../widgets/button_widget.dart';
import '../../../../../../widgets/text_field_widget.dart';
import '../../../../../controllers/cleaning_controller.dart';
import '../../cleaning_hours/other_options/other_options_page.dart';

class ConfigurationPage extends StatelessWidget {
  final int lable;
  final CleaningController controller;
  const ConfigurationPage(
      {Key? key, required this.controller, required this.lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime selectedDate = DateTime.now();
    final initialMonth = selectedDate.month;
    final initialYear = selectedDate.year;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Chọn ngày làm',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => Wrap(
                spacing: 5.w, // Khoảng cách giữa các hình ảnh
                children: List.generate(
                  7,
                  (index) {
                    final optionFirstDay = [
                      'T2',
                      'T3',
                      'T4',
                      'T5',
                      'T6',
                      'T7',
                      'CN',
                    ];

                    return GestureDetector(
                      onTap: () {
                        controller.togglemarkedDays(index + 1);
                        controller.selectFirstDayOption(index);
                        List<String> selectedDayNames =
                            controller.getSelectedDays();
                        String result = selectedDayNames.join(', ');
                        controller.textRepeat.value = result;

                        controller.totalNumberSessions.value =
                            Utils.countDaysInWeekdays(
                          selectedDate,
                          controller.packageType.value,
                          controller.markedDays,
                          controller.removeDays.length,
                        );
                        controller.preSession();

                        if (controller.markedDays.isEmpty) {
                          controller.removeDays.value = [];
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 44.w,
                        height: 44.h,
                        padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8)
                            .r,
                        decoration: BoxDecoration(
                          color: controller.isSelectedList[index]
                              ? AppColors.kGray1000Color
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(48).r,
                          border: Border.all(color: AppColors.kGray300Color),
                        ),
                        child: Text(
                          optionFirstDay[index],
                          style: AppTextStyle.textbodyStyle.copyWith(
                              color: controller.isSelectedList[index]
                                  ? AppColors.white
                                  : AppColors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 24.h),
            Text(
              'Chọn giờ làm',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => ButtonWidget(
                onTap: () {
                  controller.dateTime.value = DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day, 7);
                  goPresent(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chọn giờ làm',
                          style: AppTextStyle.textButtonStyle
                              .copyWith(color: AppColors.kGray1000Color),
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
                        minimumDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 7),
                        maximumDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 20),
                        backgroundColor: AppColors.white,
                        initialDateTime: controller.dateTime.value.hour < 7
                            ? DateTime.now().add(const Duration(hours: 1))
                            : DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day, 7),
                        onDateTimeChanged: (DateTime newDate) {
                          if (controller.dateTime.value.hour < 7) {
                            controller.dateTime.value = DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                7);
                            print(controller.dateTime.value);
                          } else {
                            controller.dateTime.value = newDate;
                          }

                          int selectedHour = newDate.hour;
                          controller.getDateAll();
                          controller.nightMoney(selectedHour, 2);
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
                    border:
                        Border.all(width: 1.w, color: AppColors.kGray200Color),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${controller.dateTime.value.hour.toString().padLeft(2, '0')}:${controller.dateTime.value.minute.toString().padLeft(2, '0')}',
                        style: AppTextStyle.textsmallStyle60016
                            .copyWith(color: AppColors.kGray900Color),
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
            SizedBox(width: 0.0, height: 24.h),
            Text(
              'Thời lượng',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => Wrap(
                spacing: 8.w, // Khoảng cách giữa các hình ảnh
                runSpacing: 8.h, // Khoảng cách giữa các dòng
                children: List.generate(
                  controller.listServiceDuration.length,
                  (index) {
                    final serviceDuration =
                        controller.listServiceDuration[index];
                    final isSelect =
                        controller.selectedTimeOption.value == index;
                    return ButtonWidget(
                      onTap: () {
                        controller.textRoomNumber.value =
                            serviceDuration.room.toString();
                        controller.textAcreage.value =
                            serviceDuration.acreage.toString();
                        controller.textRoomCharge.value =
                            serviceDuration.money!;
                        controller.totalAmount.value = serviceDuration.money!;
                        controller.finalMoney.value =
                            controller.totalAmount.value;
                        controller.originalAmount.value =
                            controller.totalAmount.value;
                        controller.textTimeRequest.value =
                            serviceDuration.time!;
                        controller.timeMD2.value = serviceDuration.money!;

                        controller.selectTimeOption(index);
                        controller.updatePrimium(lable);
                        controller.getDateAll();
                      },
                      widget: Container(
                        width: 167.w,
                        height: 48.h,
                        padding: const EdgeInsets.all(6).r,
                        decoration: BoxDecoration(
                          color: isSelect
                              ? AppColors.kGray1000Color
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12).r,
                          border: Border.all(color: AppColors.kGray300Color),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${serviceDuration.time.toString()} Giờ',
                              style: AppTextStyle.textbodyStyle.copyWith(
                                  color: isSelect
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                            Expanded(
                              child: Text(
                                '${serviceDuration.acreage.toString()} m2 / ${serviceDuration.room.toString()} phòng',
                                style: AppTextStyle.textsmallStyle10.copyWith(
                                    color: isSelect
                                        ? AppColors.white
                                        : AppColors.kGray500Color),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 24.h),
            Text(
              'Loại gói',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => Wrap(
                spacing: 8.w, // Khoảng cách giữa các hình ảnh
                runSpacing: 8.h, // Khoảng cách giữa các dòng
                children: List.generate(
                  controller.numbersmonthlyPackage.length,
                  (index) {
                    final monthlyPackage =
                        controller.numbersmonthlyPackage[index];
                    final isSelect =
                        controller.selectedPackageType.value == index;
                    return ButtonWidget(
                      onTap: () {
                        controller.selectPackageType(index);
                        controller.packageType.value = monthlyPackage['value'];
                        controller.totalNumberSessions.value =
                            Utils.countDaysInWeekdays(
                          selectedDate,
                          controller.packageType.value,
                          controller.markedDays,
                          controller.removeDays.length,
                        );
                        controller.preSession();
                      },
                      widget: Container(
                        width: 167.w,
                        height: 48.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6).r,
                        decoration: BoxDecoration(
                          color: isSelect
                              ? AppColors.kGray1000Color
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12).r,
                          border: Border.all(color: AppColors.kGray300Color),
                        ),
                        child: Text(
                          '${monthlyPackage['value']} Tháng',
                          style: AppTextStyle.textbodyStyle.copyWith(
                            color: isSelect ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Obx(() => controller.textRepeat.value != ""
                ? Column(
                    children: [
                      SizedBox(width: 0.0, height: 8.h),
                      ButtonWidget(
                        onTap: () {
                          goPresent(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lịch làm việc',
                                    style: AppTextStyle.textButtonStyle
                                        .copyWith(color: AppColors.black),
                                  ),
                                  ButtonWidget(
                                    boder: false.obs,
                                    onTap: () {
                                      Get.back();
                                    },
                                    widget: SvgPicture.asset(
                                      AppImages.iconClose,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: controller.packageType.value + 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final month = initialMonth + index;
                                    final year = initialYear +
                                        month ~/
                                            12; // Tính năm cho tháng tiếp theo nếu có
                                    final startDate =
                                        DateTime(year, month % 12, 1);

                                    final endDate =
                                        DateTime(year, month % 12 + 1, 0);

                                    // List of days of the month
                                    final List<int> days = List.generate(
                                        endDate.day, (index) => index + 1);

                                    // Calculate the weekday of the first day of the month
                                    final int firstWeekday = startDate.weekday;
                                    final List<int?> firstWeek = List.generate(
                                        firstWeekday - 1, (index) => null);

                                    // Concatenate the first week with the days of the month
                                    final List<int> allDays = [
                                      ...firstWeek.map((day) => day ?? 0),
                                      ...days
                                    ];

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  left: 8.0, top: 8.0)
                                              .r,
                                          child: Text(
                                            Utils.formatVietnameseDate(
                                                startDate),
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0).r,
                                          child: GridView.count(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            crossAxisCount: 7,
                                            childAspectRatio: 2,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: List.generate(7, (index) {
                                              return Container(
                                                alignment: Alignment.topCenter,
                                                child: Text(
                                                  Utils.getDayLabel(index),
                                                  style: AppTextStyle
                                                      .textsmallStyle12
                                                      .copyWith(
                                                          color: AppColors
                                                              .kGray400Color),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0).r,
                                          child: Obx(
                                            () => GridView.count(
                                              key: UniqueKey(),
                                              shrinkWrap: true,
                                              crossAxisCount: 7,
                                              childAspectRatio: 1.0,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: List.generate(
                                                allDays.length,
                                                (index) {
                                                  final currentDay =
                                                      allDays[index];
                                                  final currentDate = DateTime(
                                                      year,
                                                      month % 12,
                                                      currentDay);

                                                  final isWithinRange = currentDate
                                                          .isAfter(
                                                              selectedDate) &&
                                                      currentDate.isBefore(
                                                          selectedDate.add(Duration(
                                                              days: 30 *
                                                                  int.parse(controller
                                                                      .packageType
                                                                      .value
                                                                      .toString()))));
                                                  final isMarkedDay = controller
                                                      .markedDays
                                                      .any((day) {
                                                    return currentDate
                                                            .weekday ==
                                                        day;
                                                  });
                                                  final textStyle =
                                                      isWithinRange
                                                          ? isMarkedDay
                                                              ? !controller
                                                                      .removeDays
                                                                      .contains(
                                                                          currentDate)
                                                                  ? AppTextStyle
                                                                      .textsmallStyle12
                                                                      .copyWith(
                                                                          color: AppColors
                                                                              .white)
                                                                  : AppTextStyle
                                                                      .textsmallStyle12
                                                                      .copyWith(
                                                                          color: AppColors
                                                                              .kGray1000Color)
                                                              : AppTextStyle
                                                                  .textsmallStyle12
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .kGray1000Color)
                                                          : AppTextStyle
                                                              .textsmallStyle12
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .kGray400Color);
                                                  return currentDay != 0
                                                      ? ButtonWidget(
                                                          onTap: () {
                                                            isMarkedDay
                                                                ? controller
                                                                    .toggleRemoveDay(
                                                                        currentDate)
                                                                : null;
                                                            controller
                                                                    .totalNumberSessions
                                                                    .value =
                                                                Utils
                                                                    .countDaysInWeekdays(
                                                              selectedDate,
                                                              controller
                                                                  .packageType
                                                                  .value,
                                                              controller
                                                                  .markedDays,
                                                              controller
                                                                  .removeDays
                                                                  .length,
                                                            );
                                                            controller
                                                                .preSession();
                                                          },
                                                          widget: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                                const EdgeInsets
                                                                        .all(8)
                                                                    .r,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                          .circular(
                                                                              40)
                                                                      .r,
                                                              color: isWithinRange
                                                                  ? isMarkedDay
                                                                      ? controller.removeDays.contains(currentDate)
                                                                          ? null
                                                                          : AppColors.kGray1000Color
                                                                      : null
                                                                  : null,
                                                            ),
                                                            child: Text(
                                                              currentDay
                                                                  .toString(),
                                                              style: textStyle,
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox.square();
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                        widget: Container(
                          width: 343.w,
                          height: 56.h,
                          padding: const EdgeInsets.all(16).r,
                          decoration: BoxDecoration(
                            color: AppColors.kGray100Color,
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.iconDate,
                                    color: AppColors.kPurplePurpleColor,
                                  ),
                                  SizedBox(width: 10.w, height: 0.0),
                                  Text(
                                    'Xem hoặc thay đổi lịch làm việc',
                                    style: AppTextStyle.textbodyStyle,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppImages.iconArrowright,
                                width: 24.w,
                                height: 24.h,
                                color: AppColors.kGray400Color,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink()),
            OtherOptionsPage(controller: controller, lable: lable,),
            SizedBox(width: 0.0, height: 8.h),
            Obx(() {
              if (controller.isPet.value == true) {
                return TextFieldWidget(
                  controller: controller.textPetEditingController,
                  hintText: 'Nhập ghi chú về vật nuôi...',
                  obsNhapText: false,
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            SizedBox(width: 0.0, height: 16.h),
            Text(
              'Ghi chú cho người làm',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            TextFieldWidget(
              controller: controller.textEmployeeNotesEditingController,
              hintText: 'Nhập ở đây những yêu cầu hoặc lưu ý của bạn ở đây...',
              obsNhapText: false,
            ),
            SizedBox(width: 0.0, height: 8.h),
          ],
        ),
      ),
    );
  }
}
