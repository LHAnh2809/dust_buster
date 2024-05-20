class Message {
  String id;
  String idPhongChat;
  String idNguoiGui;
  String noiDung;
  String thoiGian;

  Message(
      {required this.id,
      required this.idPhongChat,
      required this.idNguoiGui,
      required this.noiDung,
      required this.thoiGian});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      idPhongChat: json['id_phong_chat'],
      idNguoiGui: json['id_nguoi_gui'],
      noiDung: json['noi_dung'],
      thoiGian: json['thoi_gian'],
    );
  }
}
