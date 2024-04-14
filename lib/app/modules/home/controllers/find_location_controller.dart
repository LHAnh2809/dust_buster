import 'dart:convert';

import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/viet_map_models/auto_complete/auto_complete_model.dart';
import 'package:dust_buster/app/data/models/viet_map_models/reverse/reverse_model.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/homes/header/location/find_location/widgets/button_add_location.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class FindLocationController extends GetxController
    with StateMixin<List<AutoCompleteModel>> {
  final ApiHelper _apiHelper = Get.find();
  var reverseModel = Rxn<ReverseModel>();

  final TextEditingController textLocationController = TextEditingController();
  final TextEditingController textStreetLocationController =
      TextEditingController();

  var isaddLocation = false.obs;
  var isLoadingAddLocation = false.obs;
  var isLoadingAutoLocation = false.obs;
  var isPositionLoaded = false.obs;

  Position? _position;

  var isSevicePermission = false.obs;

  late LocationPermission permission;

  RxString location = "".obs;

  @override
  void onClose() {
    textLocationController.dispose();
    textStreetLocationController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    getAutoComplete("");
    super.onInit();
    // Thực hiện các tác vụ khởi tạo
  }

  checkNullAddLocation(String location) {
    if (location.isEmpty) {
      isaddLocation.value = false;
      return;
    }
    isaddLocation.value = true;
  }

  Future<void> getAutoComplete(String location) async {
    // ignore: unnecessary_null_comparison
    if (location == null || location.isEmpty) {
      change(null, status: RxStatus.empty());
      return;
    }

    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.vietMapAutoComplete(location: location);
      if (response.isNotEmpty) {
        final models = autoCompleteModelFromJson(json.encode(response));
        change(models, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      print('Error in getAutoComplete: $e');
      change(null, status: RxStatus.error());
    }
  }

  postLocationCreate(String location, String location2, String refId,
      String lat, String lng, int label) async {
    // ignore: unnecessary_null_comparison
    if (location2.isEmpty) {
      return;
    }

    try {
      isLoadingAddLocation.value = true;
      String lats = "";
      String lngs = "";
      if (label == 1) {
        lats = lat;
        lngs = lng;
      } else {
        final response = await _apiHelper.getPlaceVietMap(refId: refId);
        lats = response[0]['lat'].toString();
        lngs = response[0]['lng'].toString();
      }

      await _apiHelper.postCreateLocation(
        location: location,
        location2: location2,
        lat: lats,
        lng: lngs,
      );
      isLoadingAddLocation.value = false;
      Get.offNamed(Routes.location);
    } catch (e) {
      debugPrint(e.toString());
      isLoadingAddLocation.value = false;
    }
  }

  Future<Position> getCurrentLocation() async {
    isSevicePermission.value = await Geolocator.isLocationServiceEnabled();
    if (!isSevicePermission.value) {
      debugPrint("service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  void fetchCurrentLocation() async {
    try {
      isLoadingAutoLocation.value = true;
      _position = await getCurrentLocation();
      getAddressFromCoordinates();
      isPositionLoaded.value = true; // Đã lấy được tọa độ
      getReverseComplete(); // Thực hiện hàm getReverseComplete
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }

  void getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _position!.latitude, _position!.longitude);
      Placemark place = placemarks[0];
      location.value = "${place.locality}, ${place.country}";
    } catch (e) {}
  }

  Future<void> getReverseComplete() async {
    while (true) {
      if (!isPositionLoaded.value) {
        await Future.delayed(const Duration(milliseconds: 100));
        continue;
      }
      try {
        final response = await _apiHelper.getReverseVietMap(
          lat: _position!.latitude.toString(),
          lng: _position!.longitude.toString(),
        );
        print(response[0]['lat'].toString());
        print(response[0]['lng'].toString());

        if (response.isNotEmpty) {
          isLoadingAutoLocation.value = false;
          goPresent(
            children: [
              ButtonAddLocation(
                controller: FindLocationController(),
                name: response[0]['name'],
                address: response[0]['address'],
                lat: response[0]['lat'].toString(),
                lng: response[0]['lng'].toString(),
                ma: 1,
              ),
              SizedBox(width: 0.0, height: 16.h),
            ],
          );
          break;
        }
        break;
      } catch (e) {
        print('Error in getReverseComplete: $e');
        break;
      }
    }
  }
}
