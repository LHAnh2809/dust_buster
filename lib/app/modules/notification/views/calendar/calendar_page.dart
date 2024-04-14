import 'package:dust_buster/app/common/util/exports.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exports.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => controller.getNotificationCalendarr(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16).r,
          child: ListView(
            children: [
              controller.obx(
                (state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final NotificationCalendar? model =
                          state![index] as NotificationCalendar?;

                      return NotificationWidget(
                        id: model!.id.toString(),
                        status:model.statusNotification,
                        controller: controller,
                        label: 1,
                        idIVD: model.idInvoiceDetails.toString(),
                        title: model.title.toString(),
                        content: model.content.toString(),
                        image: AppImages.iconJob,
                        color: AppColors.kButtonColor,
                        time: Utils.formatTimeAgo(model.postingTime!), 
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 0.0, height: 8.h),
                  );
                },
                onLoading: const LoadingPage(),
                onEmpty: Padding(
                    padding: const EdgeInsets.only(top: 200).r,
                    child: const EmptPage(
                      text: 'lịch làm việc',
                    )),
                onError: (error) => Center(
                    child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
