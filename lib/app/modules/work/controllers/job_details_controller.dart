import 'package:dust_buster/app/data/models/job_details_models/job_details.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../home/exports.dart';
import 'waiting_controller.dart';

class JobDetailsController extends GetxController with StateMixin<JobDetails> {

  final ApiHelper _apiHelper = Get.find(); // Loại bỏ const ở đây
  var textId = "".obs;
  late WaitingController waitingController;
  @override
  onInit() {
    waitingController = WaitingController();
    super.onInit;
  }

  Future<void> getJobDetailss(String id) async {
    if (textId.value == "") {
      textId.value = id;
    }
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getJobDetails(id: id);
      if (response['status'] == "OK") {
        if (response['job_details'] != null &&
            response['job_details'].length > 0) {
          List<JobDetails> jobDetailsList = [];
          for (var jobDetailsJson in response['job_details']) {
            JobDetails data = JobDetails.fromJson(jobDetailsJson);
            jobDetailsList.add(data);
          }
          if (jobDetailsList.length == 1) {
            change(jobDetailsList.first, status: RxStatus.success());
          } else {
            change(jobDetailsList.first, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
      change(null, status: RxStatus.error());
    }
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
}
