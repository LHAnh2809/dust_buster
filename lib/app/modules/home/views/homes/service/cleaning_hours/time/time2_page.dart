import 'package:dust_buster/app/common/util/calendar/cupertino/date_picker.dart';
import 'package:dust_buster/app/modules/widgets/custom_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../common/util/navigator.dart';
import '../../../../../../login/exports.dart';
import '../../../../../../widgets/custom_svg.dart';
import '../../../../../../widgets/text_field_widget.dart';
import '../../../../../exports.dart';

class Time2Page extends StatelessWidget {
  final CleaningController controller;
  const Time2Page({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(16).r,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Thời gian làm việc',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => ButtonWidget(
                height: 700,
                onTap: () {
                  List<String> weekDates = controller.generateWeekDates();
                  goPresent(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Chọn ngày làm',
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
                      Flexible(
                        child: ListView.separated(
                          itemCount: weekDates.length,
                          itemBuilder: (context, index) {
                            Color? color = controller.selectedDate.value ==
                                    weekDates[index]
                                ? AppColors.kGray1000Color
                                : AppColors.kGray500Color;
                            return ButtonWidget(
                              onTap: () {
                                controller.selectedDate.value =
                                    weekDates[index];
                                controller.formatDate();
                                Get.back();
                              },
                              widget: Container(
                                height: 56.h,
                                padding: const EdgeInsets.all(16).r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).r,
                                  border: Border.all(
                                    color: color,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      weekDates[index],
                                      style:
                                          AppTextStyle.lableBodyStyle.copyWith(
                                        color: color,
                                      ),
                                    ),
                                    CustomSvg(
                                      image: controller.selectedDate.value ==
                                              weekDates[index]
                                          ? AppImages.iconRadioButtonChecked
                                          : AppImages.iconRadioButtonUnchecked,
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
                      SizedBox(width: 0.0, height: 32.h),
                    ],
                  );
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
                        controller.selectedDate.toString(),
                        style: AppTextStyle.textsmallStyle60016
                            .copyWith(color: AppColors.kGray900Color),
                      ),
                      SvgPicture.asset(
                        AppImages.iconCalendarLine,
                        width: 24.w,
                        height: 24.h,
                        color: AppColors.kGray400Color,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => ButtonWidget(
                onTap: () {
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
                        minimumDate: controller.minimumDate,
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
                          controller.nightMoney(selectedHour);
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
            SizedBox(width: 0.0, height: 8.h),
            Container(
              height: 48.h,
              padding: const EdgeInsets.all(8).r,
              decoration: BoxDecoration(
                color: AppColors.kGrayBackgroudColor,
                borderRadius: BorderRadius.circular(8).r,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.iconInformationFill,
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.kButtonColor,
                  ),
                  SizedBox(width: 8.w, height: 0.0),
                  Expanded(
                    child: Text(
                      'Lưu ý! Giá dịnh vụ tăng do nhu cầu công việc tăng trong thời điểm này',
                      maxLines: 2,
                      style: AppTextStyle.textxsmallStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            SizedBox(
              height: 48.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Lặp lại hàng tuần",
                        style: AppTextStyle.textbodyStyle,
                      ),
                      SizedBox(width: 4.w, height: 0.0),
                      ButtonWidget(
                        onTap: () {
                          goPresent(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lặp lại hàng tuần',
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
                              SizedBox(width: 0.0, height: 20.h),
                              RichText(
                                text: TextSpan(
                                  style: AppTextStyle
                                      .textsmallStyle, // Style của toàn bộ văn bản
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Tính năng này dành cho khách hàng có nhu cầu dọn dẹp nhà cố định vào các ngày trong tuần.\n\nHệ thống sẽ tự động đăng việc vào các ngày bạn đã chọn. Bạn có thể thay đổi cài đặt này tại ',
                                    ),
                                    TextSpan(
                                      text: '“Hoạt động" -> “Lặp lại"',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .w600), // In đậm phần này
                                    ),
                                    TextSpan(
                                      text:
                                          '\n\nĐối với công việc đã đăng, hãy thay đổi trực tiếp trên từng công việc đó.',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 0.0, height: 20.h),
                              ButtonWidget(
                                boder: false.obs,
                                onTap: () {
                                  Get.back();
                                },
                                widget: Container(
                                  alignment: Alignment.center,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    color:
                                        AppColors.kButtonColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(8).r,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.kButtonColor
                                            .withOpacity(0.2),
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Text(
                                    Strings.close,
                                    style:
                                        AppTextStyle.buttonTextStyle.copyWith(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 0.0, height: 16.h),
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
                      value: controller.isRepeatWeekly.value.obs,
                      onToggle: (bool value) {
                        controller.isRepeatWeekly.value = value;
                        if (value == false) {
                          controller.textRepeat.value = "";
                        } else {
                          List<String> selectedDayNames =
                              controller.getSelectedDays();
                          String result = selectedDayNames.join(', ');
                          controller.textRepeat.value = result;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.isRepeatWeekly.value == true) {
                return Wrap(
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
                          controller.selectFirstDayOption(index);
                          List<String> selectedDayNames =
                              controller.getSelectedDays();
                          String result = selectedDayNames.join(', ');
                          controller.textRepeat.value = result;
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
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            SizedBox(width: 0.0, height: 8.h),
            Text(
              'Ghi chú cho người làm',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            SizedBox(width: 0.0, height: 4.h),
            Flexible(
              child: Text(
                'Ghi chú này sẽ giúp cho nhân viên hoàn thành công việc nhanh hơn và tốt hơn',
                style: AppTextStyle.textsmallStyle
                    .copyWith(color: AppColors.kGray500Color),
              ),
            ),
            SizedBox(width: 0.0, height: 16.h),
            TextFieldWidget(
              controller: controller.textEmployeeNotesEditingController,
              hintText: 'Nhập ở đây những yêu cầu hoặc lưu ý của bạn ở đây...',
              obsNhapText: false,
            ),
          ],
        ),
      ),
    );
  }
}
