import 'package:dust_buster/app/data/models/partner_information_models/partner_information.dart';
import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../views/job_details/detailer/detailer_page.dart';

class WaitingController extends GetxController
    with StateMixin<List<PendingInvoices>> {
  final ApiHelper _apiHelper = Get.find();

  List<PendingInvoices> listPendingInvoices = [];
  List<PartnerInformation> partnerInformationList = [];

  var textLabel = "".obs;
  var hasRepeatStateOne = false.obs;
  var isLoading = false.obs;

  var soSao = 0.obs;

  var noiDungdanhgia = TextEditingController();

  @override
  void onInit() {
    getPendingInvoicee();
    super.onInit();
  }

  final formattedNewStartTime = RxString('');
  final formattedDate = RxString('');
  void formatTime(String date, String time) {
    // Initialize date formatting for the Vietnamese locale
    initializeDateFormatting('vi_VN', null).then((_) {
      try {
        // Extract the day of the week from the date string
        String dayOfWeek = date.split(',')[0].trim();

        // Parse the date string without the day of the week
        DateFormat inputDateFormat = DateFormat("dd/MM/yyyy", "vi_VN");
        DateTime startDate =
            inputDateFormat.parse(date.substring(dayOfWeek.length + 2).trim());

        // Format the parsed date to a desired format
        formattedDate.value = DateFormat('dd/MM/yyyy').format(startDate);

        // Parse the start time string
        List<String> timeParts = time.split('đến');
        String startTimeString = timeParts[0].trim();
        DateFormat inputTimeFormat = DateFormat('H giờ, HH:mm');
        DateTime startTime = inputTimeFormat.parse(startTimeString);

        // Subtract one hour from the start time
        DateTime newStartTime = startTime.subtract(Duration(hours: 1));

        // Format the new start time
        formattedNewStartTime.value = DateFormat('HH:mm').format(newStartTime);
      } catch (e) {
        // Handle any parsing errors
        print('Error parsing date/time: $e');
      }
    });
  }

  void postDanhgia(String idP, String idID) async {
    try {
      if (soSao.value == 0) {
        return Utils.showSnackbar('Vui lòng chọn số sao',
            AppImages.iconCircleCheck, AppColors.kRrror400Color);
      }
      if (noiDungdanhgia.text.isEmpty) {
        return Utils.showSnackbar('Vui lòng điền nội dung đánh giá',
            AppImages.iconCircleCheck, AppColors.kRrror400Color);
      }
      final response = await _apiHelper.postDanhGia(
          idP: idP, idID: idID, star: soSao.value, note: noiDungdanhgia.text);
      if (response['detail'] == 0) {
        getHistoryy();
        noiDungdanhgia.clear();
        Get.back();
        Get.back();
        return Utils.showSnackbar('Đánh giá thành công',
            AppImages.iconCircleCheck, AppColors.kSuccess600Color);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  void putAcceptJobb(String idParther, String idInvoiceDetails) async {
    try {
      final response = await _apiHelper.putAcceptJob(
          idParther: idParther, idInvoiceDetails: idInvoiceDetails);
      if (response['detail'] == "OK") {
        getPendingInvoicee();
        Get.back();
        return Utils.showSnackbar('Chọn đối tác thành công',
            AppImages.iconCircleCheck, AppColors.kSuccess600Color);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> getPendingInvoicee() async {
    try {
      listPendingInvoices.clear();
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getPendingInvoice();
      if (response['status'] == "OK") {
        if (response['pending_invoices'] != null) {
          final List<PendingInvoices> pendingInvoices =
              (response['pending_invoices'] as List)
                  .map((json) => PendingInvoices.fromJson(json))
                  .toList();

          if (pendingInvoices.isNotEmpty) {
            listPendingInvoices = pendingInvoices;
            change(pendingInvoices, status: RxStatus.success());
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

  Future<void> getHistoryy() async {
    try {
      listPendingInvoices.clear();
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getHistory();
      if (response['status'] == "OK") {
        if (response['pending_invoices'] != null) {
          final List<PendingInvoices> pendingInvoices =
              (response['pending_invoices'] as List)
                  .map((json) => PendingInvoices.fromJson(json))
                  .toList();

          if (pendingInvoices.isNotEmpty) {
            listPendingInvoices = pendingInvoices;
            change(pendingInvoices, status: RxStatus.success());
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

  Future<void> gettPartnerInformation(String id) async {
    try {
      isLoading.value = true;
      final response = await _apiHelper.getPartnerInformation(id: id);
      if (response['status'] == "OK") {
        if (response['partner_information'] != null) {
          final List<PartnerInformation> partnerInformation =
              (response['partner_information'] as List)
                  .map((json) => PartnerInformation.fromJson(json))
                  .toList();

          if (partnerInformation.isNotEmpty) {
            partnerInformationList = partnerInformation;
            Get.to(() => const DetailerPage());
            isLoading.value = false;
            return;
          }
        }
      }
    } catch (e) {
      // If an error occurs, set status to error
      debugPrint('Error in getPendingInvoicee: $e');
      isLoading.value = false;
    }
  }

  void putCancelJobb(PendingInvoices model) async {
    try {
      // int pre = int.parse(model.price.toString());
      // String time = '2 giờ, 17:28 đến 19:28';
      // List<String> parts = model.workTime.toString().split(', ');
      // String hourPart = parts[1].trim();
      // List<String> partss = model.workTime.toString().split('đến');
      // String hourPartt = partss[0].trim();
      // print(hourPartt);
      // DateTime now = DateTime.now();
      // String howDay =
      //     '$hourPart, ${Utils.getHourStart(model.workingDay.toString())}';
      // List<String> partst = howDay.split(', ');
      // String timePart = partst[0];
      // String datePart = partst[1];

      // // Tạo đối tượng DateTime từ howDay
      // DateTime howDayDateTime =
      //     DateFormat('HH:mm, dd/MM/yyyy').parse('$timePart, $datePart');
      // DateTime earliestCancellationTime =
      //     howDayDateTime.subtract(Duration(hours: 6));
      // DateTime earliestCancellationTime1Hour =
      //     howDayDateTime.subtract(Duration(hours: 1));
      // if (model.idPT.toString() != '' ||
      //     now.isBefore(earliestCancellationTime) == true) {
      //   print('a');
      // } else if (now.isAfter(earliestCancellationTime) &&
      //     now.isBefore(earliestCancellationTime1Hour)) {
      //   print('b');
      // } else if (now.isBefore(earliestCancellationTime1Hour)) {
      //   print('c');
      // }
      // final response = await _apiHelper.putCancelJob(
      //     orderStatus: 0,
      //     Stt: 0,
      //     price: null,
      //     idInvoiceDetails: '');
      // if (response['detail'] == "OK") {
      //   getPendingInvoicee();
      //   Get.back();
      //   return Utils.showSnackbar('Chọn đối tác thành công',
      //       AppImages.iconCircleCheck, AppColors.kSuccess600Color);
      // }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  var orderStatuss = 0.obs;
  void puttComplete(PendingInvoices model) async {
    try {
      final response = await _apiHelper.putComplete(
          id: model.idID.toString(),
          money: int.parse(model.price.toString()),
          note: Utils.getLabel(int.parse(model.label.toString())),
          wallet: 'Nhận từ khách hàng',
          status: 3,
          idP: model.idPT.toString());
      if (response['detail'] == "OK") {
        getPendingInvoicee();
        orderStatuss.value = 5;
        return Utils.showSnackbar(
            'Xác nhận đối tác hoàn thành công việc thành công',
            AppImages.iconCircleCheck,
            AppColors.kSuccess600Color);
      } else {}
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }
}
