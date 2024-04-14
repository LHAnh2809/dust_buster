import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

class LocationController extends GetxController
    with StateMixin<List<Location>> {
  final ApiHelper _apiHelper = Get.find();

  List<Location> listLocation = [];

  var isLoading = false.obs;

  @override
  void onInit() {
    getLocationn();
    super.onInit();
  }

  getLocationn() async {
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getLocation();

      if (response['status'] == "OK") {
        final List<Location> locations = (response['location'] as List)
            .map((json) => Location.fromJson(json))
            .toList();

        if (locations.isNotEmpty) {
          listLocation = locations;
          change(locations, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<List<Location>> getLocations() async {
    await getLocationn();
    return listLocation;
  }

  dellLocation(String id, int defaultt) async {
    try {
      isLoading.value = true;
      final response = await _apiHelper.delLocation(id: id, defaultt: defaultt);

      if (response['detail'] == "OK") {
        isLoading.value = false;
        showDialogSuccess(content: Strings.deleteSuccess);
        getLocationn();
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  putLocation(String id, String idUsers) async {
    try {
      final response = await _apiHelper.putLocation(id: id, idUsers: idUsers);

      if (response['detail'] == "OK") {
        showDialogSuccess(content: Strings.chageLocation);
        getLocationn();
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
