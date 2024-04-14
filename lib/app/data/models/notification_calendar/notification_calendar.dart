class NotificationCalendar {
  String? id;
  String? idInvoiceDetails;
  String? idUsers;
  String? title;
  String? content;
  String? postingTime;
  int? statusNotification;

  NotificationCalendar(
      {this.id,
      this.idInvoiceDetails,
      this.idUsers,
      this.title,
      this.content,
      this.postingTime,
      this.statusNotification});

  NotificationCalendar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idInvoiceDetails = json['id_invoice_details'];
    idUsers = json['id_users'];
    title = json['title'];
    content = json['content'];
    postingTime = json['posting_time'];
    statusNotification = json['status_notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_invoice_details'] = this.idInvoiceDetails;
    data['id_users'] = this.idUsers;
    data['title'] = this.title;
    data['content'] = this.content;
    data['posting_time'] = this.postingTime;
    data['status_notification'] = this.statusNotification;
    return data;
  }
}
