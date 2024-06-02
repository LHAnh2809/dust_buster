import 'package:dust_buster/app/data/models/partner_information_models/partner_information.dart';
import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/work/controllers/periodic_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../common/util/navigator.dart';
import '../../../data/models/periodic_models/Periodic.dart';
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

  final RxList<String> itemsLiDo = [
    'Bận việc đột suất',
    'Đăng nhầm ngày',
    'Không có nhu cầu',
    'Chưa có người nhận',
    'Lý do khác',
  ].obs;

  var textLido = "".obs;

  var textPrime = 0.obs;

  var textEditNoteKhac = TextEditingController();
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
        return Utils.showSnackbar(
            message: 'Vui lòng chọn số sao',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kRrror400Color);
      }
      if (noiDungdanhgia.text.isEmpty) {
        return Utils.showSnackbar(
            message: 'Vui lòng điền nội dung đánh giá',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kRrror400Color);
      }
      final response = await _apiHelper.postDanhGia(
          idP: idP, idID: idID, star: soSao.value, note: noiDungdanhgia.text);
      if (response['detail'] == 0) {
        getHistoryy();
        noiDungdanhgia.clear();
        Get.back();
        Get.back();
        return Utils.showSnackbar(
            message: 'Đánh giá thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
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
        return Utils.showSnackbar(
            message: 'Chọn đối tác thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
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

  Future<void> periodicallyCancel(Periodic model) async {
    try {
      final responseCount =
          await _apiHelper.getWorkCompleted(id: model.idIV.toString());
      int countWorkCompleted = responseCount['work-completed'];
      int countWork = int.parse(model.numberSessions!) - countWorkCompleted;
      int money = (int.parse(model.price.toString()) * countWork) -
          int.parse(model.price.toString());
      final response = await _apiHelper.postPeriodicallyCanneled(
          stt: 0, idI: model.idIV.toString(), money: money);
      if (response['detail'] == 0) {
        var ctn = Get.put(PeriodicController());
        ctn.getPeriodicallyy();
        Get.back();
        Get.back();
        return Utils.showSnackbar(
            message: 'Hủy việc thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> prepareTheBill2(Periodic model) async {
    try {
      int pre = int.parse(model.price.toString());
      List<String> parts = model.workTime!.split(', ');
      String hourPart = parts[1].trim();
      List<String> partsS = hourPart.split(' đến ');
      String hourParts = partsS[0].trim();

      // Chuyển đổi hourParts thành TimeOfDay
      TimeOfDay startTime = TimeOfDay(
        hour: int.parse(hourParts.split(':')[0]),
        minute: int.parse(hourParts.split(':')[1]),
      );

      // Tính toán thời gian kết thúc (hourParts + 1 giờ)
      TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);

      // Ví dụ về thời gian hiện tại (giả sử là TimeOfDay.now())
      TimeOfDay currentTime = TimeOfDay.now();

      // Chuyển đổi TimeOfDay thành Duration để so sánh
      Duration startTimeDuration =
          Duration(hours: startTime.hour, minutes: startTime.minute);
      Duration endTimeDuration =
          Duration(hours: endTime.hour, minutes: endTime.minute);
      Duration currentTimeDuration =
          Duration(hours: currentTime.hour, minutes: currentTime.minute);

      // Kiểm tra và áp dụng giảm giá
      if (currentTimeDuration > startTimeDuration &&
          currentTimeDuration <= endTimeDuration) {
        if (currentTimeDuration < startTimeDuration + Duration(hours: 1)) {
          // Giảm giá 30%
          textPrime.value = (pre - (pre * 0.30)).toInt();
          return;
        } else if (currentTimeDuration ==
            startTimeDuration + Duration(hours: 1)) {
          // Giảm giá 20000k
          textPrime.value = (pre - 20000.0).toInt();
          return;
        }
      }
      Get.back();
      return;
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> prepareTheBill(PendingInvoices model) async {
    try {
      int pre = int.parse(model.price.toString());
      List<String> parts = model.workTime!.split(', ');
      String hourPart = parts[1].trim();
      List<String> partsS = hourPart.split(' đến ');
      String hourParts = partsS[0].trim();

      // Chuyển đổi hourParts thành TimeOfDay
      TimeOfDay startTime = TimeOfDay(
        hour: int.parse(hourParts.split(':')[0]),
        minute: int.parse(hourParts.split(':')[1]),
      );

      // Tính toán thời gian kết thúc (hourParts + 1 giờ)
      TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);

      // Ví dụ về thời gian hiện tại (giả sử là TimeOfDay.now())
      TimeOfDay currentTime = TimeOfDay.now();

      // Chuyển đổi TimeOfDay thành Duration để so sánh
      Duration startTimeDuration =
          Duration(hours: startTime.hour, minutes: startTime.minute);
      Duration endTimeDuration =
          Duration(hours: endTime.hour, minutes: endTime.minute);
      Duration currentTimeDuration =
          Duration(hours: currentTime.hour, minutes: currentTime.minute);

      // Kiểm tra và áp dụng giảm giá
      if (currentTimeDuration > startTimeDuration &&
          currentTimeDuration <= endTimeDuration) {
        if (currentTimeDuration < startTimeDuration + Duration(hours: 1)) {
          // Giảm giá 30%
          textPrime.value = (pre - (pre * 0.30)).toInt();
          return;
        } else if (currentTimeDuration ==
            startTimeDuration + Duration(hours: 1)) {
          // Giảm giá 20000k
          textPrime.value = (pre - 20000.0).toInt();
          return;
        }
      }
      Get.back();
      return;
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> putCancelJobb(PendingInvoices model) async {
    try {
      if (model.price! > textPrime.value && textPrime.value != 0) {
        goPresent(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thông báo',
                style: AppTextStyle.textButtonStyle
                    .copyWith(color: AppColors.kGray1000Color),
              ),
              ButtonWidget(
                onTap: () {
                  Get.back();
                },
                widget: SvgPicture.asset(
                  AppImages.iconClose,
                  width: 24.w,
                  height: 24.h,
                ),
                boder: false.obs,
              )
            ],
          ),
          SizedBox(width: 0.0, height: 32.h),
          Text(
              'Bạn sẽ bị trừ ${Utils.formatNumber(model.price! - textPrime.value)}đ nếu huỷ công việc này. Bạn có chắc chắn muốn huỷ?'),
          SizedBox(width: 0.0, height: 16.h),
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  colorBackGroud: Colors.white,
                  text: 'Quay lại',
                  boder: true.obs,
                  textStyle: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
              ),
              SizedBox(width: 16.w, height: 0.0),
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    putHuy(model);
                  },
                  text: 'Đồng ý',
                  boder: false.obs,
                ),
              ),
              SizedBox(width: 16.w, height: 0.0),
            ],
          )
        ]);
      } else {
        putHuy(model);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> putCancelJobb2(Periodic model) async {
    try {
      if (model.price! > textPrime.value && textPrime.value != 0) {
        goPresent(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thông báo',
                style: AppTextStyle.textButtonStyle
                    .copyWith(color: AppColors.kGray1000Color),
              ),
              ButtonWidget(
                onTap: () {
                  Get.back();
                },
                widget: SvgPicture.asset(
                  AppImages.iconClose,
                  width: 24.w,
                  height: 24.h,
                ),
                boder: false.obs,
              )
            ],
          ),
          SizedBox(width: 0.0, height: 32.h),
          Text(
              'Bạn sẽ bị trừ ${Utils.formatNumber(model.price! - textPrime.value)}đ nếu huỷ công việc này. Bạn có chắc chắn muốn huỷ?'),
          SizedBox(width: 0.0, height: 16.h),
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  colorBackGroud: Colors.white,
                  text: 'Quay lại',
                  boder: true.obs,
                  textStyle: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
              ),
              SizedBox(width: 16.w, height: 0.0),
              Expanded(
                child: ButtonWidget(
                  onTap: () {
                    putHuy2(model);
                  },
                  text: 'Đồng ý',
                  boder: false.obs,
                ),
              ),
              SizedBox(width: 16.w, height: 0.0),
            ],
          )
        ]);
      } else {
        putHuy2(model);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> putHuy(PendingInvoices model) async {
    try {
      String note = "";
      if (textEditNoteKhac.text.isEmpty) {
        note = textLido.value;
      } else {
        note = textEditNoteKhac.text;
      }
      final response = await _apiHelper.putCancelJob(
        Stt: 0,
        price: textPrime.value,
        idInvoiceDetails: model.idID.toString(),
        idU: '',
        reasonCancellation: note,
      );
      if (response['detail'] == "OK") {
        getPendingInvoicee();
        Get.back();
        Get.back();
        return Utils.showSnackbar(
            message: 'Hủy việc thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  Future<void> putHuy2(Periodic model) async {
    try {
      String note = "";
      if (textEditNoteKhac.text.isEmpty) {
        note = textLido.value;
      } else {
        note = textEditNoteKhac.text;
      }
      final response = await _apiHelper.putCancelJob(
        Stt: 0,
        price: textPrime.value,
        idInvoiceDetails: model.idID.toString(),
        idU: '',
        reasonCancellation: note,
      );
      if (response['detail'] == "OK") {
        getPendingInvoicee();
        Get.back();
        Get.back();
        return Utils.showSnackbar(
            message: 'Hủy việc thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      }
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
            message: 'Xác nhận đối tác hoàn thành công việc thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      } else {}
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  void puttComplete2(Periodic model) async {
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
            message: 'Xác nhận đối tác hoàn thành công việc thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      } else {}
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  var idPC = "";
  Future<void> postCreateChatt(String id) async {
    try {
      final response = await _apiHelper.postCreateChat(id: id);
      if (response['detail'] == 0) {
        idPC = response['id'];
        debugPrint('Tạo cuộc trò chuyện thành công');
      } else if (response['detail'] == -1) {
        idPC = response['id'];
        debugPrint('Cuộc trò chuyện đã tồn tại');
      } else {
        debugPrint('Tạo cuộc trò chuyện thất bại');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
