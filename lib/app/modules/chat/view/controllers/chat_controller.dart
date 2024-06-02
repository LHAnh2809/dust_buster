import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../common/util/exports.dart';
import '../../../../data/models/messager/messager.dart';
import '../../../../data/repository/api_helper.dart';

class ChatController extends GetxController {
  var chat = TextEditingController();
  var textChat = "".obs;
  var idPC = "";
  var idUser = "";
  late IOWebSocketChannel _channel;
  final ApiHelper _apiHelper = Get.find();
  var messages = <Message>[].obs;
  final ScrollController scrollController = ScrollController();

  void getChats() async {
    final response = await _apiHelper.getChat(id: idPC);
    var messageList = (response['messages'] as List)
        .map((message) => Message.fromJson(message))
        .toList();
    messages.clear();
    messages.value = messageList;
  }

  void connect(String id) async {
    idPC = id;

    String? ip = Storage.getValue<String>('ip');
    print('Received message: $ip');

    final responseID = await _apiHelper.getUsers();
    idUser = responseID['user'][0]['id'];

    final response = await _apiHelper.getChat(id: idPC);
    var messageList = (response['messages'] as List)
        .map((message) => Message.fromJson(message))
        .toList();
    messages.value = messageList;

    _channel = IOWebSocketChannel.connect('ws://$ip:8000/ws');
    _channel.stream.listen((message) {
      try {
        // var newMessage = Message.fromJson(json.decode(message));
        // messages.add(newMessage);
        getChats();
      } catch (e) {
        print('Error: $e');
      }
      print('Received message: $message');
    });
  }

 

  var selectedMessageId = ''.obs;

  void selectMessage(String messageId) {
    if (selectedMessageId.value == messageId) {
      selectedMessageId.value = '';
    } else {
      selectedMessageId.value = messageId;
    }
  }

  // Đóng kết nối WebSocket
  void disconnect() {
    _channel.sink.close();
  }

  // Gửi tin nhắn qua kết nối WebSocket
  void sendMessage() {
    if (chat.text.isEmpty) return;

    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yyyy HH:mm:ss').format(now);

    var message = {
      "id_phong_chat": idPC,
      "noi_dung": chat.text,
      "id_nguoi_gui": idUser,
      "thoi_gian": formattedDate,
    };
    _channel.sink.add(json.encode(message));
    chat.clear();
    textChat.value = "";

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void onClose() {
    disconnect();
    super.onClose();
  }
}
