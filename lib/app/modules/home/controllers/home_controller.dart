import 'package:dust_buster/app/data/models/customer_promotions_models/customer_promotions.dart';
import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/data/models/user_models/user.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:geolocator/geolocator.dart';
import '../exports.dart';
import '../views/homes/service/clean_house_periodically/clean_house_periodically_view.dart';

class HomeController extends GetxController with StateMixin<HomeModel> {
  final ApiHelper _apiHelper = Get.find();
  static HomeController instance = Get.find();
  final ScrollController scrollController = ScrollController();
  final double scrollThreshold = 200.0;
  var isVisible = false.obs;
  var isScrollingToTop = false.obs;
  RxBool isLoading = false.obs;
  var showMoreButton = true.obs;
  var currentIndex = 0.obs;
  Position? position;
  List<User> userList = [];
  List<CustomerPromotions> customerPromotionsList = [];
  var isSevicePermission = false.obs;

  late LocationPermission permission;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    getHomePage();
    gettUser();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  getHomePage() async {
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getHomePage();

      if (response.isNotEmpty) {
        HomeModel data = HomeModel.fromJson(response);
        change(data, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      debugPrint('Error in getAutoComplete: $e');
      change(null, status: RxStatus.error());
    }
  }

  Future<void> gettUser() async {
    try {
      final response = await _apiHelper.getUsers();
      if (response['status'] == "OK") {
        List<User> users = [];
        for (var userData in response['user']) {
          User user = User.fromJson(userData);
          users.add(user);
        }
        userList = users;
      }
    } catch (e) {
      debugPrint('Error in getAutoComplete: $e');
    }
  }

  Future<List<User>> getUser() async {
    await gettUser();
    return userList;
  }

  Future<void> gettCustomerPromotion() async {
    try {
      final response = await _apiHelper.getCustomerPromotions();
      if (response['status'] == "OK") {
        List<CustomerPromotions> customerPromotions = [];
        for (var userData in response['customer_promotions']) {
          CustomerPromotions customerPromotion =
              CustomerPromotions.fromJson(userData);
          customerPromotions.add(customerPromotion);
        }
        customerPromotionsList = customerPromotions;
      }
    } catch (e) {
      debugPrint('Error in getAutoComplete: $e');
    }
  }

  Future<List<CustomerPromotions>> getCustomerPromotion() async {
    await gettCustomerPromotion();
    return customerPromotionsList;
  }

  void handleScroll(double offset) {
    if (offset >= scrollThreshold) {
      isVisible.value = true;
    } else {
      isVisible.value = false;
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
      position = await getCurrentLocation();
    } catch (e) {
      debugPrint("Error fetching current location: $e");
    }
  }

  // Kiểm tra xem một khuyến mãi đã được lưu hay chưa
  // bool isPromotionSaved(String promotionId) {
  //   return customerPromotions
  //       .any((promotion) => promotion.idPCP == promotionId);
  // }

  void navigateToNextScreen(label, id, idL, location2, nameSV) {
    if (label == 1) {
      Get.to(() => CleaningHoursPage(
            id: id,
            idL: idL,
            location2: location2,
            nameSV: nameSV,
            lable: label,
          ));
    } else if (label == 2) {
      Get.to(() => CleanHousePeriodicallyView(
            id: id,
            idL: idL,
            location2: location2,
            nameSV: nameSV,
            lable: label,
          ));
    } else if (label == 3) {
    } else if (label == 4) {
    } else if (label == 5) {
    } else if (label == 6) {
    } else {}
  }
}
