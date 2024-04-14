import 'package:dust_buster/app/data/models/notification_calendar/notification_calendar.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

class CalendarController extends GetxController
    with StateMixin<List<NotificationCalendar>> {
  final ApiHelper _apiHelper = Get.find();

  List<NotificationCalendar> listNotificationCalendar = [];

  @override
  void onInit() {
    getNotificationCalendarr();
    super.onInit();
  }

  Future<void> getNotificationCalendarr() async {
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getNotificationCalendar();
      if (response['status'] == "OK") {
        if (response['notification_calendar'] != null) {
          final List<NotificationCalendar> notificationCalendar =
              (response['notification_calendar'] as List)
                  .map((json) => NotificationCalendar.fromJson(json))
                  .toList();

          if (notificationCalendar.isNotEmpty) {
            listNotificationCalendar = notificationCalendar;
            change(notificationCalendar, status: RxStatus.success());
            return;
          }
        }
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      // If an error occurs, set status to error
      debugPrint('Error in getPendingInvoicee: $e');
      change(null, status: RxStatus.error());
    }
  }

  Future<void> putNotificationn(String id) async {
    try {
      await _apiHelper.putNotification(id: id);
    } catch (e) {
      // If an error occurs, set status to error
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }
}
