import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/util/calendar/cupertino/date_picker.dart';
import '../../../../../../common/util/navigator.dart';
import '../../../../../home/exports.dart';
import '../../../../../home/views/homes/service/cleaning_hours/premium/premium_page.dart';
import '../../../../../widgets/custom_appbar_widget.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../widgets/custom_switch.dart';
import '../../../../controllers/thay_yeu_cau_controller.dart';

class ThayYeuCau extends StatefulWidget {
  final String id;
  final int lable;
  final int premium;
  final String wordTime;
  final String wordDay;
  final int money;
  final int label;
  const ThayYeuCau({
    Key? key,
    required this.lable,
    required this.premium,
    required this.wordTime,
    required this.wordDay,
    required this.money,
    required this.label,
    required this.id,
  }) : super(key: key);

  @override
  _ThayYeuCauState createState() => _ThayYeuCauState();
}

class _ThayYeuCauState extends State<ThayYeuCau> {
  final thayYeuCauController = Get.put(ThayYeuCauController());
  @override
  void initState() {
    setService();
    thayYeuCauController.gettServiceDuration();

    thayYeuCauController.formatDate();
    thayYeuCauController.getDateAll();
    thayYeuCauController.minimumDatee();
    thayYeuCauController.originalAmount.value = widget.money;

    super.initState();
  }

  void setService() {
    if (widget.premium == 1) {
      thayYeuCauController.isPremiumService.value = true;
    } else {
      thayYeuCauController.isPremiumService.value = false;
    }

    String time = widget.wordTime.split(", ")[0];
    if (time == "2 giờ") {
      thayYeuCauController.selectedTimeOption.value = 0;
    } else if (time == "3 giờ") {
      thayYeuCauController.selectedTimeOption.value = 1;
    } else if (time == "4 giờ") {
      thayYeuCauController.selectedTimeOption.value = 2;
    } else if (time == "5 giờ") {
      thayYeuCauController.selectedTimeOption.value = 3;
    }
    thayYeuCauController.selectedDate.value = widget.wordDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: "Thay đổi yêu cầu",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thời lượng',
              style: AppTextStyle.lableBodyStyle,
            ),
            SizedBox(width: 0.0, height: 4.h),
            Text(
              'Vui lòng chọn ước tính chính xác diện tính cần dọn dẹp',
              style: AppTextStyle.textsmallStyle
                  .copyWith(color: AppColors.kGray500Color),
            ),
            SizedBox(width: 0.0, height: 16.h),
            Obx(
              () => Wrap(
                spacing: 8.w, // Khoảng cách giữa các hình ảnh
                runSpacing: 8.h, // Khoảng cách giữa các dòng
                children: List.generate(
                  thayYeuCauController.listServiceDuration.length,
                  (index) {
                    final serviceDuration =
                        thayYeuCauController.listServiceDuration[index];
                    final isSelect =
                        thayYeuCauController.selectedTimeOption.value == index;
                    return ButtonWidget(
                      onTap: () {
                        thayYeuCauController.textRoomNumber.value =
                            serviceDuration.room.toString();
                        thayYeuCauController.textAcreage.value =
                            serviceDuration.acreage.toString();
                        thayYeuCauController.textRoomCharge.value =
                            serviceDuration.money!;
                        thayYeuCauController.totalAmount.value =
                            serviceDuration.money!;
                        thayYeuCauController.finalMoney.value =
                            thayYeuCauController.totalAmount.value;
                        thayYeuCauController.originalAmount.value =
                            thayYeuCauController.totalAmount.value;
                        thayYeuCauController.textTimeRequest.value =
                            serviceDuration.time!;
                        thayYeuCauController.selectTimeOption(index);
                        thayYeuCauController.updatePrimium(1);
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
                      value: thayYeuCauController.isPremiumService.value.obs,
                      onToggle: (bool value) {
                        thayYeuCauController.isPremiumService.value = value;
                        thayYeuCauController.updatePrimium(widget.lable);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 24.h),
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
                  List<String> weekDates =
                      thayYeuCauController.generateWeekDates();
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
                            Color? color =
                                thayYeuCauController.selectedDate.value ==
                                        weekDates[index]
                                    ? AppColors.kGray1000Color
                                    : AppColors.kGray500Color;
                            return ButtonWidget(
                              onTap: () {
                                thayYeuCauController.selectedDate.value =
                                    weekDates[index];
                                thayYeuCauController.formatDate();
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
                                      image: thayYeuCauController
                                                  .selectedDate.value ==
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
                        thayYeuCauController.selectedDate.toString(),
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
            SizedBox(width: 0.0, height: 24.h),
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
                        minimumDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 7),
                        maximumDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 20),
                        backgroundColor: AppColors.white,
                        initialDateTime:
                            thayYeuCauController.dateTime.value.hour < 7
                                ? DateTime.now().add(const Duration(hours: 1))
                                : DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                    7),
                        onDateTimeChanged: (DateTime newDate) {
                          if (newDate.hour < 7) {
                            thayYeuCauController.dateTime.value = DateTime(
                                newDate.year, newDate.month, newDate.day, 7);
                          } else if (newDate.hour >= 20) {
                            thayYeuCauController.dateTime.value = DateTime(
                                newDate.year,
                                newDate.month,
                                newDate.day,
                                19,
                                59);
                          } else {
                            thayYeuCauController.dateTime.value = newDate;
                          }

                          int selectedHour = newDate.hour;
                          thayYeuCauController.getDateAll();
                          thayYeuCauController.nightMoney(
                              selectedHour, widget.lable);
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
                        '${thayYeuCauController.dateTime.value.hour.toString().padLeft(2, '0')}:${thayYeuCauController.dateTime.value.minute.toString().padLeft(2, '0')}',
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
          ],
        ),
      ),
      bottomSheet: Container(
        height: 106.h,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16).r,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                offset: const Offset(0, -4),
                blurRadius: 8,
                spreadRadius: 1)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 207.w,
              height: 48.h,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${Utils.formatNumber(int.parse(thayYeuCauController.originalAmount.toString()))}đ',
                      style: AppTextStyle.largeBodyStyle,
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                    Text(
                      '${thayYeuCauController.textAcreage} m2 / ${thayYeuCauController.textRoomNumber} phòng',
                      style: AppTextStyle.textsmallStyle.copyWith(
                          color: AppColors.kGray500Color,
                          fontFamily: 'PlusJakartaSans'),
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.w, height: 0.0),
            Obx(
              () => Column(
                children: [
                  if (thayYeuCauController.isLoading.value == false)
                    ButtonWidget(
                      onTap: () {
                        thayYeuCauController.puttInvoiceDettail(
                            widget.lable, widget.id);
                      },
                      text: 'Cập nhật',
                      width: 120.w,
                      height: 48.h,
                      colorBackGroud: AppColors.kButtonColor,
                    ),
                  if (thayYeuCauController.isLoading.value == true)
                    Container(
                      alignment: Alignment.center,
                      height: 48.h,
                      width: 120.w,
                      padding: const EdgeInsets.only(top: 4, bottom: 4).r,
                      decoration: BoxDecoration(
                        color: AppColors.kButtonColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8).r,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kButtonColor.withOpacity(0.2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.white,
                        size: 50.r,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
