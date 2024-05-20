import 'package:get/get.dart';

import '../../../data/models/periodic_models/Periodic.dart';
import '../../../data/repository/api_helper.dart';
import '../../home/exports.dart';

class PeriodicController extends GetxController
    with StateMixin<List<Periodic>> {
  final ApiHelper _apiHelper = Get.find();
  List<Periodic> listPeriodic = [];
  @override
  void onInit() {
    getPeriodicallyy();
    super.onInit();
  }

  Future<void> getPeriodicallyy() async {
    try {
      listPeriodic.clear();
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getPeriodically();
      if (response['status'] == "OK") {
        if (response['periodic'] != null) {
          final List<Periodic> periodic = (response['periodic'] as List)
              .map((json) => Periodic.fromJson(json))
              .toList();

          if (periodic.isNotEmpty) {
            listPeriodic = periodic;
            change(periodic.cast<Periodic>(), status: RxStatus.success());
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
}
