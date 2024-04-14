import 'package:dust_buster/app/common/util/calendar/material/calendar_style.dart';
import 'package:dust_buster/app/common/util/calendar/material/date_utils.dart';
import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/widgets/background_dialog.dart';
import 'package:dust_buster/app/modules/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dust_buster/app/common/util/calendar/material/calendar_date_picker.dart'
    as common;

goPresent(
    {required List<Widget> children, double? height, bool? isDismissibles}) {
  return Get.bottomSheet(
    isDismissible: isDismissibles ?? true,
    Container(
      height: height,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(Get.context!).size.height * 0.8,
      ),
      padding:
          EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ),
  );
}

Future goDateRangePicker(
    {required DateTime selectedStartDate,
    required DateTime selectedEndDate,
    Function(DateTime?)? onStartDateChanged,
    Function(DateTime?)? onEndDateChanged}) {
  final DateTime _now = DateTime.now();
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
      child: common.CalendarDatePicker(
        firstDate: DateTime(_now.year - 100),
        lastDate: DateTime.now(),
        selectedStartDate: selectedStartDate,
        selectedEndDate: selectedEndDate,
        onStartDateChanged: onStartDateChanged,
        onEndDateChanged: onEndDateChanged,
        selectionMode: SelectionMode.range,
        calendarStyle: CalendarStyle(),
      ),
    ),
  );
}

Future goDatePicker({
  Function(DateTime?)? onDateChanged,
}) {
  final DateTime _now = DateTime.now();
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
      child: common.CalendarDatePicker(
        firstDate: DateTime(_now.year - 100),
        lastDate: DateTime.now(),
        onDateChanged: onDateChanged,
        selectionMode: SelectionMode.single,
        calendarStyle: CalendarStyle(),
      ),
    ),
  );
}

goDialog({required Widget child}) {
  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: child,
    ),
  );
}

showDialogConfirm({required Widget child}) {
  return goDialog(
    child: child,
  );
}

showDialogDelete(
    {required String title,
    required String content,
    required void Function() onPressed}) {
  return showDialogConfirm(
    child: BackgroundDialog(
      title: title,
      children: [
        Text(
          content,
          style: AppTextStyle.bodySmallStyle.copyWith(color: AppColors.black),
        ),
        SizedBox(width: 0.0, height: 50.h),
        CustomElevatedButton(
          onPressed: onPressed,
          height: 43,
          title: Strings.deleteAnyway,
        ),
        SizedBox(width: 0.0, height: 8.h)
      ],
    ),
  );
}

Future showDialogSuccess({String? content}) async {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        width: 334,
        height: 166,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your dialog content here
            AppImages.svg(AppImages.iconCircleCheck, width: 50, height: 50),
            const SizedBox(width: 0, height: 22),
            Text(
              textAlign: TextAlign.center,
              content ?? 'Đăng công việc thành công',
              style: AppTextStyle.text24BoldStyle.copyWith(
                fontSize: Dimens.fontSize20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
