import 'package:dust_buster/app/data/models/notification_calendar/notification_calendar.dart';

class NotificationCalendarModel {
  List<NotificationCalendar>? notificationCalendar;
  String? status;

  NotificationCalendarModel({this.notificationCalendar, this.status});

  NotificationCalendarModel.fromJson(Map<String, dynamic> json) {
    if (json['notification_calendar'] != null) {
      notificationCalendar = <NotificationCalendar>[];
      json['notification_calendar'].forEach((v) {
        notificationCalendar!.add(new NotificationCalendar.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationCalendar != null) {
      data['notification_calendar'] =
          this.notificationCalendar!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
