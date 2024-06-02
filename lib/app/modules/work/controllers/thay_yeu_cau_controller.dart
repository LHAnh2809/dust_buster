import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/util/exports.dart';
import '../../../common/util/notification_sevice.dart';
import '../../../common/util/utils.dart';
import '../../../data/models/service_duration_models/ServiceDurationModel.dart';
import '../../../data/models/service_duration_models/service_duration.dart';
import '../../../data/repository/api_helper.dart';
import 'waiting_controller.dart';

class ThayYeuCauController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  RxList<ServiceDuration> listServiceDuration = <ServiceDuration>[].obs;
  var selectedTimeOption = 0.obs;
  var textRoomNumber = "".obs;
  var textAcreage = "".obs;
  var textRoomCharge = 0.obs;
  var totalAmount = 0.obs;
  var finalMoney = 0.obs;
  var originalAmount = 0.obs;
  var textTimeRequest = 2.obs;
  var isPremiumService = false.obs;
  var textMoneyPremium = 0.obs;
  var textTime = 0.obs;
  var totalNumberSessions = 0.obs;
  var timeMD2 = 0.obs;
  var priceMD2 = 0.obs;
  var textTimeAll = "".obs;
  late RxString selectedDate = "".obs;
  late DateTime parsedDate;
  DateTime now = DateTime.now();
  late WaitingController waitingController;
  @override
  void onInit() {
    // TODO: implement onInit
    waitingController = Get.put(WaitingController());
    super.onInit();
  }

  void gettServiceDuration() async {
    try {
      final response = await _apiHelper.getServiceDuration();

      if (response['status'] == "OK") {
        final serviceDurationModel = ServiceDurationModel.fromJson(response);
        listServiceDuration.value = serviceDurationModel.serviceDuration ?? [];
        textRoomNumber.value =
            listServiceDuration[selectedTimeOption.value].room.toString();
        textAcreage.value =
            listServiceDuration[selectedTimeOption.value].acreage.toString();
        textRoomCharge.value =
            listServiceDuration[selectedTimeOption.value].money!;
        totalAmount.value =
            listServiceDuration[selectedTimeOption.value].money!;
        finalMoney.value = totalAmount.value;
        //originalAmount.value = totalAmount.value;
        priceMD2.value = totalAmount.value;
        timeMD2.value = listServiceDuration[selectedTimeOption.value].money!;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void selectTimeOption(int option) {
    selectedTimeOption.value = option;
  }

  void updatePrimium(int lable) {
    print(lable);
    int premiumAmount = isPremiumService.value ? 50000 : 0;
    textMoneyPremium.value = 0;
    switch (lable) {
      case 1: // Case 1
        if (textTime.value >= 17 && textTime.value <= 20) {
          totalAmount.value = textRoomCharge.value +
              textMoneyPremium.value +
              premiumAmount +
              30000;
          textMoneyPremium.value = premiumAmount;
        } else {
          totalAmount.value =
              textRoomCharge.value + textMoneyPremium.value + premiumAmount;
          textMoneyPremium.value = premiumAmount;
        }
        break;
      case 2: // Case 2
        if (textTime.value >= 17 && textTime.value <= 20) {
          totalAmount.value = totalNumberSessions.value != 0
              ? (textRoomCharge.value +
                      textMoneyPremium.value +
                      premiumAmount +
                      30000) *
                  totalNumberSessions.value
              : textRoomCharge.value +
                  textMoneyPremium.value +
                  premiumAmount +
                  30000;
          textMoneyPremium.value = premiumAmount;
          priceMD2.value = timeMD2.value + premiumAmount + 30000;
        } else {
          totalAmount.value = totalNumberSessions.value != 0
              ? (textRoomCharge.value +
                      textMoneyPremium.value +
                      premiumAmount) *
                  totalNumberSessions.value
              : textRoomCharge.value + textMoneyPremium.value + premiumAmount;
          textMoneyPremium.value = premiumAmount;
          priceMD2.value = timeMD2.value + premiumAmount + 0;
        }
        break;
      // Add more cases as needed
      default: // Default case
        // Handle default case here
        break;
    }

    finalMoney.value = totalAmount.value;
    originalAmount.value = totalAmount.value;
  }

  List<String> generateWeekDates() {
    List<String> weekDates = [];

    // Add today's date with the sign
    weekDates.add('Hôm nay, ${DateFormat('dd/MM/yyyy').format(now)}');

    // Add dates for the next 6 days with signs
    for (int i = 1; i <= 6; i++) {
      DateTime nextDay = now.add(Duration(days: i));
      String sign = Utils.getDaySign(nextDay.weekday);
      weekDates.add('$sign, ${DateFormat('dd/MM/yyyy').format(nextDay)}');
    }

    return weekDates;
  }

  void formatDate() {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    List<String> parts = selectedDate.split(', ');

    String datePart = parts[1];

    parsedDate = dateFormat.parse(datePart);
  }

  late DateTime minimumDate;
  var dateTime = DateTime.now().add(const Duration(hours: 1)).obs;
  void minimumDatee() {
    minimumDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour >= 7 ? DateTime.now().hour : 7,
    );

    if (dateTime.value.hour < 7) {
      dateTime.value = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);
    } else if (dateTime.value.hour >= 20) {
      dateTime.value = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 19, 59);
    }
  }

  void nightMoney(int selectedHour, int lable) {
    textTime.value = selectedHour;

    switch (lable) {
      case 1: // Case 1
        if (selectedHour >= 17 && selectedHour <= 20) {
          totalAmount.value =
              textRoomCharge.value + textMoneyPremium.value + 30000;
        } else {
          totalAmount.value = textRoomCharge.value + textMoneyPremium.value + 0;
        }
        break;
      case 2: // Case 2
        if (selectedHour >= 17 && selectedHour <= 20) {
          totalAmount.value = totalNumberSessions.value != 0
              ? (textRoomCharge.value + textMoneyPremium.value + 30000) *
                  totalNumberSessions.value
              : textRoomCharge.value + textMoneyPremium.value + 30000;
          priceMD2.value = timeMD2.value + textMoneyPremium.value + 30000;
        } else {
          totalAmount.value = totalNumberSessions.value != 0
              ? (textRoomCharge.value + textMoneyPremium.value + 0) *
                  totalNumberSessions.value
              : textRoomCharge.value + textMoneyPremium.value + 0;
          priceMD2.value = timeMD2.value + 0;
        }
        break;
      // Add more cases as needed
      default: // Default case
        // Handle default case here
        break;
    }

    finalMoney.value = totalAmount.value;
    originalAmount.value = totalAmount.value;
  }

  void getDateAll() {
    DateTime nextTime =
        dateTime.value.add(Duration(hours: textTimeRequest.value));
    String formattednewDate = DateFormat.Hm().format(dateTime.value);
    String formattedTime = DateFormat.Hm().format(nextTime);
    textTimeAll.value =
        '${textTimeRequest.value} giờ, $formattednewDate đến $formattedTime';
  }

  var isLoading = false.obs;
  void puttInvoiceDettail(int lable, String id) async {
    isLoading.value = true;
    try {
      int premiumService = 1;
      int price = 0;
      if (isPremiumService.value == false) {
        premiumService = 0;
      }

      String formattedDate =
          Utils.replaceTodayWithDayOfWeek(selectedDate.toString());
      if (lable == 1) {
        price = finalMoney.toInt();
      } else if (lable == 2) {
        price = finalMoney.toInt() ~/ totalNumberSessions.value;
      }
      // ignore: unnecessary_brace_in_string_interps
      String roomArea = '${textAcreage} m2 / ${textRoomNumber} phòng';
      print('id: $id');
      print('workingDay: $formattedDate');
      print('workTime: ${textTimeAll.toString()}');
      print('roomArea: $roomArea');
      print('price: $price');
      print('premiumService: $premiumService');
      final response = await _apiHelper.putInvoiceDettail(
        id: id,
        workingDay: formattedDate,
        workTime: textTimeAll.toString(),
        roomArea: roomArea,
        price: price,
        premiumService: premiumService,
      );
      isLoading.value = false;

      if (response['detail'] == "OK") {
        Get.back();
        Get.back();
        waitingController.getPendingInvoicee();
        return Utils.showSnackbar(
            message: 'Cập nhật thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
