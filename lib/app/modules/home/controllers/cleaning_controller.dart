import 'dart:math';
import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/common/util/notification_sevice.dart';
import 'package:dust_buster/app/data/models/customer_promotions_models/customer_promotions.dart';
import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/data/models/service_duration_models/ServiceDurationModel.dart';
import 'package:dust_buster/app/data/models/service_duration_models/service_duration.dart';
import 'package:dust_buster/app/data/models/user_models/user.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

class CleaningController extends GetxController
    with SingleGetTickerProviderMixin {
  final ApiHelper _apiHelper = Get.find();
  final TextEditingController textPetEditingController =
      TextEditingController();
  final TextEditingController textEmployeeNotesEditingController =
      TextEditingController();

  late LocationController locationController;
  late HomeController homeController;
  late NavigationBarController navigationBarController;

  final markedDays = RxList<int>();

  final removeDays = RxList<DateTime>();

  final List<Map<String, dynamic>> numbersmonthlyPackage = [
    {'value': 1},
    {'value': 2},
    {'value': 3},
    {'value': 6}
  ].obs;
  var totalNumberSessions = 0.obs;
  DateTime now = DateTime.now();
  var dateTime = DateTime.now().add(const Duration(hours: 1)).obs;
  late RxString selectedDate =
      'Hôm nay, ${DateFormat('dd/MM/yyyy').format(now)}'.obs;

  var selectedTimeOption = 0.obs;
  var selectedPackageType = 0.obs;
  var selectedIndex = 0.obs;
  var selectedIndexPeriodicCleaning = 0.obs;
  var selectedLocation = 0.obs;
  var selectedPromotions = Rx<int?>(null).obs;
  var isFavoriteMaker = true.obs;
  var isPremiumService = false.obs;
  var isPet = false.obs;
  var isRepeatWeekly = false.obs;
  var isLoading = false.obs;

  var isPromotions = false.obs;

  var selectedDateIndex = 0.obs;

  var textLocation = "".obs;
  var textLocation2 = "".obs;
  var textLat = "".obs;
  var textLng = "".obs;

  var textRoomNumber = "".obs;
  var textAcreage = "".obs;
  var textRoomCharge = 0.obs;
  var textMoneyPremium = 0.obs;

  var textTime = 0.obs;
  var textTimeRequest = 2.obs;

  var textName = "".obs;
  var textPhoneNumber = "".obs;
  var textMoney = 0.obs;

  var totalAmount = 0.obs;

  var originalAmount = 0.obs;

  var textTimeAll = "".obs;

  var textRepeat = "".obs;

  var finalMoney = 0.obs;

  var textIdPromotions = "".obs;
  var textPromotions = 0.obs;
  var textPoint = 0.obs;
  var textCodePromotions = "".obs;
  var textlabelKM = 0.obs;
  var textPremiumService = 0.obs;
  var textlabelSV = 0.obs;

  var packageType = 1.obs;

  var priceMD2 = 0.obs;
  var textpriceMD2 = 0.obs;
  var timeMD2 = 0.obs;
  var textWorkingTime = "".obs;

  var textDuration = "".obs;

  void tabControllerIndex(index) {
    selectedIndex.value = index;
    tabController.animateTo(index);
  }

  void tabControllerIndexPeriodicCleaning(index) {
    selectedIndexPeriodicCleaning.value = index;
    tabController.animateTo(index);
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    tabControllerPeriodicCleaning = TabController(length: 2, vsync: this);
    locationController = Get.put(LocationController());
    homeController = Get.put(HomeController());
    navigationBarController = Get.put(NavigationBarController());
    gettServiceDuration();
    getCustomerPromotions();
    getDateAll();
    loadLocations();
    loadUrse();
    formatDate();
    minimumDatee();
    super.onInit();
  }

  String calculateFutureDate() {
    // Thêm số ngày vào ngày hiện tại
    DateTime futureDate = now.add(Duration(days: packageType.value * 30));

    // Format ngày và thứ
    String formattedNow = DateFormat('dd/MM/yyyy').format(now);
    String formattedFutureDate = DateFormat('dd/MM/yyyy').format(futureDate);
    return "Từ ngày $formattedNow đến Ngày $formattedFutureDate";
  }

  String workingTime2(String thu) {
    String temp = "";
    DateTime futureDate = now.add(Duration(days: packageType.value * 30));

    // Format ngày và thứ
    String formattedNow = DateFormat('dd/MM/yyyy').format(now);
    String formattedFutureDate = DateFormat('dd/MM/yyyy').format(futureDate);
    temp = "$formattedNow - $formattedFutureDate";
    textDuration.value = temp;
    return temp;
  }

  String workingTime(int lable) {
    String temp = "";
    switch (lable) {
      case 1: // Case 1
        temp = selectedDate.toString();
        break;
      case 2: // Case 2

        String tempTT = textRepeat.value.split(', ')[0];
        int tempT;
        if (tempTT == "Thứ 2") {
          tempT = 1;
        } else if (tempTT == "Thứ 3") {
          tempT = 2;
        } else if (tempTT == "Thứ 4") {
          tempT = 3;
        } else if (tempTT == "Thứ 5") {
          tempT = 4;
        } else if (tempTT == "Thứ 6") {
          tempT = 5;
        } else if (tempTT == "Thứ 7") {
          tempT = 6;
        } else {
          tempT = 7;
        }

        int currentDayOfWeek = now.weekday;

        // Tính toán khoảng cách giữa ngày hiện tại và ngày mục tiêu
        int difference = tempT - currentDayOfWeek;

        if (difference <= 0) {
          difference +=
              7; // Nếu ngày mục tiêu đã trôi qua, ta cần tới ngày trong tuần tiếp theo
        }

        // Tính toán ngày gần nhất của ngày mục tiêu
        DateTime nearestDate = now.add(Duration(days: difference));
        String formattedNearestDate =
            DateFormat('dd/MM/yyyy').format(nearestDate);
        selectedDate.value = "$tempTT, $formattedNearestDate";
        temp = selectedDate.value;
        break;
      // Add more cases as needed
      default: // Default case
        // Handle default case here
        break;
    }

    return temp;
  }

  void posttCreateInvoice(lable) async {
    isLoading.value = true;
    try {
      int paymentMethod = 1;
      int pet = 1;
      int repeat = 1;
      int premiumService = 1;
      int price = 0;
      if (selectedPaymentMethod != "Tiền mặt") {
        paymentMethod = 2;
      }
      if (isPet.value == false) {
        pet = 0;
      }
      if (isPremiumService.value == false) {
        premiumService = 0;
      }

      if (textRepeat == "") {
        repeat = 0;
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
      final response = await _apiHelper.postCreateInvoice(
        idP: textIdPromotions.toString(),
        label: lable,
        nameUser: textName.toString(),
        phoneNumber: textPhoneNumber.toString(),
        location: textLocation.toString(),
        location2: textLocation2.toString(),
        lat: textLat.toString(),
        lng: textLng.toString(),
        repeat: textRepeat.toString(),
        petNote: textPetEditingController.text,
        employeeNote: textEmployeeNotesEditingController.text,
        workingDay: formattedDate,
        workTime: textTimeAll.toString(),
        roomArea: roomArea,
        price: price,
        gPoints: textPoint.toInt(),
        paymentMethods: paymentMethod,
        repeatState: repeat,
        premiumService: premiumService,
        note: Utils.getLabel(lable),
        duration: textDuration.value,
        numberSessions: totalNumberSessions.value.toString(),
        removalDate: removeDays.toString(),
      );
      isLoading.value = false;

      if (response['detail'] == 0) {
        await NotificationService.showNotification(
          title: "Lịch dọn dẹp nhà",
          body: "Gói dọn dẹp: $formattedDate",
          payload: {
            "navigate": "work",
          },
        );

        goPresent(
          isDismissibles: false,
          children: [
            Text(
              'Đăng việc thành công',
              style:
                  AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
            ),
            SizedBox(width: 0.0, height: 16.h),
            CustomSvg(
              image: AppImages.iconCircleCheck,
              color: AppColors.caribbeanGreen,
              width: 48.w,
              height: 48.h,
            ),
            SizedBox(width: 0.0, height: 8.h),
            Text(
              'Bạn đã đăng việc thành công, bạn có thể kiểm tra trạng thái của công việc ở trang “hoạt động”.',
              style: AppTextStyle.textsmallStyle,
            ),
            SizedBox(width: 0.0, height: 32.h),
            ButtonWidget(
              onTap: () {
                navigationBarController.selecteIndex.value = 1;
                Get.offNamed(Routes.navigationBar);
                Get.delete<CleaningController>();
              },
              text: "Theo dõi công việc",
            ),
            SizedBox(width: 0.0, height: 16.h),
            ButtonWidget(
              boder: true.obs,
              colorBackGroud: AppColors.white,
              onTap: () {
                navigationBarController.selecteIndex.value = 0;
                Get.offNamed(Routes.navigationBar);
                Get.delete<CleaningController>();
              },
              textStyle: AppTextStyle.textButtonStyle.copyWith(
                color: AppColors.black,
              ),
              text: "Trở về trang chủ",
            ),
          ],
        );
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  RxList<ServiceDuration> listServiceDuration = <ServiceDuration>[].obs;

  RxList<Location> locations = <Location>[].obs;

  RxList<CustomerPromotions> customerPromotions = <CustomerPromotions>[].obs;

  RxList<User> user = <User>[].obs;

  var isSelectedList = List<bool>.filled(7, false).obs;
  final List<int> colors = [
    0xFFE57373,
    0xFF90CAF9,
    0xFF81C784,
    0xFFFFD54F,
    0xFFBA68C8,
  ];

  var currentColor = 0.obs;

  void selectRandomColor() {
    final random = Random();
    currentColor.value = colors[random.nextInt(colors.length)];
  }

  void getDateAll() {
    DateTime nextTime =
        dateTime.value.add(Duration(hours: textTimeRequest.value));
    String formattednewDate = DateFormat.Hm().format(dateTime.value);
    String formattedTime = DateFormat.Hm().format(nextTime);
    textTimeAll.value =
        '${textTimeRequest.value} giờ, $formattednewDate đến $formattedTime';
    print(textTimeAll.value);
  }

  void selectFirstDayOption(int index) {
    isSelectedList[index] = !isSelectedList[index];
  }

  List<String> getSelectedDays() {
    List<String> daysOfWeek = [
      'Thứ 2',
      'Thứ 3',
      'Thứ 4',
      'Thứ 5',
      'Thứ 6',
      'Thứ 7',
      'Chủ nhật'
    ];

    List<int> selectedDays = [];

    for (int i = 0; i < isSelectedList.length; i++) {
      if (isSelectedList[i] == true) {
        // Nếu ngày thứ i được chọn, thêm i vào danh sách selectedDays
        selectedDays.add(i);
      }
    }
    List<String> selectedDayNames = selectedDays.map((index) {
      return daysOfWeek[index];
    }).toList();
    return selectedDayNames;
  }

  void loadLocations() {
    locationController.getLocations().then((locationsData) {
      if (locationsData.isNotEmpty) {
        locations.assignAll(locationsData);
        textLocation.value = locations[0].location;
        textLocation2.value = locations[0].location2;
        textLat.value = locations[0].lat;
        textLng.value = locations[0].lng;
      }
    });
  }

  void getCustomerPromotions() {
    homeController.getCustomerPromotion().then((customerPromotionData) {
      customerPromotions.assignAll(customerPromotionData);
    });
  }

  void loadUrse() {
    homeController.getUser().then((userData) {
      if (userData.isNotEmpty) {
        user.assignAll(userData);
        textName.value = user[0].name!;
        textPhoneNumber.value = user[0].phoneNumber!;
        textMoney.value = user[0].money!;
      }
    });
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

  void preSession() {
    if (markedDays.isEmpty) {
      updatePrimium(2);
      nightMoney(textTime.value, 2);
    } else {
      totalAmount.value = priceMD2.value * totalNumberSessions.value;
    }

    finalMoney.value = totalAmount.value;
    originalAmount.value = totalAmount.value;
  }

  var selectedPaymentMethod = 'Tiền mặt'.obs;
  List<String> paymentMethods = ['Ví 3CleanPay', 'Tiền mặt'];

  late TabController tabController;
  late TabController tabControllerPeriodicCleaning;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  late DateTime parsedDate;

  void formatDate() {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    List<String> parts = selectedDate.split(', ');

    String datePart = parts[1];

    parsedDate = dateFormat.parse(datePart);
  }

  late DateTime minimumDate;

  void minimumDatee() {
    minimumDate = DateTime.now().hour > 7
        ? DateTime.now().add(const Duration(hours: 1))
        : DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);

    if (parsedDate.isAfter(DateTime.now())) {
      minimumDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);
    }
    if (dateTime.value.hour < 7) {
      dateTime.value = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7);
    }
  }

  void gettServiceDuration() async {
    try {
      final response = await _apiHelper.getServiceDuration();

      if (response['status'] == "OK") {
        final serviceDurationModel = ServiceDurationModel.fromJson(response);
        listServiceDuration.value = serviceDurationModel.serviceDuration ?? [];
        textRoomNumber.value = listServiceDuration[0].room.toString();
        textAcreage.value = listServiceDuration[0].acreage.toString();
        textRoomCharge.value = listServiceDuration[0].money!;
        totalAmount.value = listServiceDuration[0].money!;
        finalMoney.value = totalAmount.value;
        originalAmount.value = totalAmount.value;
        priceMD2.value = totalAmount.value;
        timeMD2.value = listServiceDuration[0].money!;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    tabControllerPeriodicCleaning.dispose();
    super.onClose();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectTabsPeriodicCleaning(int index) {
    selectedIndexPeriodicCleaning.value = index;
  }

  void selectLocation(int option) {
    selectedLocation.value = option;
  }

  void selectePromotions(int option) {
    if (selectedPromotions.value == option) {
      selectedPromotions.value = Rx<int?>(null);
      textPromotions.value = 0;
      textCodePromotions.value = "";
      isPromotions.value = false;
      finalMoney.value = originalAmount.value;
    } else {
      isPromotions.value = true;
      selectedPromotions.value = Rx<int?>(option);
      if (textlabelKM == 1) {
        finalMoney.value = originalAmount.value - textPromotions.value;
      }
      if (textlabelKM == 2) {
        finalMoney.value = originalAmount.value -
            ((textPromotions.value / 100) * originalAmount.value).toInt();
      }
    }
  }

  void selectTimeOption(int option) {
    selectedTimeOption.value = option;
  }

  void selectPackageType(int option) {
    selectedPackageType.value = option;
  }

  void selectdDateIndex(int option) {
    selectedDateIndex.value = option;
  }

  void onTabIndexChanged(int index) {
    tabController.animateTo(index);
  }

  void onTabIndexChangedPeriodicCleaning(int index) {
    tabControllerPeriodicCleaning.animateTo(index);
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

  // Phương thức để thêm hoặc loại bỏ một ngày khỏi danh sách các ngày cần ẩn
  void toggleRemoveDay(DateTime day) {
    if (removeDays.contains(day)) {
      removeDays.remove(day); // Loại bỏ nếu đã có trong danh sách
    } else {
      removeDays.add(day); // Thêm vào danh sách nếu chưa có
    }
  }

  void togglemarkedDays(int day) {
    if (markedDays.contains(day)) {
      markedDays.remove(day);
    } else {
      markedDays.add(day);
    }
  }
}
