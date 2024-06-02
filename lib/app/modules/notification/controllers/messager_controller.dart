import 'package:get/get.dart';

import '../../../data/models/phong_chat_models/phong_chat_model.dart';
import '../../../data/repository/api_helper.dart';

class MessagerController extends GetxController
    with StateMixin<List<PhongChat>> {
  final ApiHelper _apiHelper = Get.find();
  
  Future<void> getPhongChat() async {
    change(null, status: RxStatus.loading());
    final response = await _apiHelper.getPhongChat();
    if (response['status'] == "OK") {
      final List<PhongChat> listPhongChat = [];
      for (var item in response['phong-chat']) {
        listPhongChat.add(PhongChat.fromJson(item));
      }
      change(listPhongChat, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(response['message']));
    }
  }
}
