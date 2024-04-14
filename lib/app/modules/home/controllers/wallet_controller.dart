import 'package:dust_buster/app/data/models/clean_wallet_models/clean_wallet.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

import '../../../data/repository/api_helper.dart';

class WalletController extends GetxController with StateMixin<CleanWallet> {
  final ApiHelper _apiHelper = Get.find();
  final TextEditingController textMoneyController = TextEditingController();
  @override
  void onInit() {
    get3CleanWallett();
    super.onInit();
  }

  var isMoney = false.obs;
  var isLoading = false.obs;
  List<CleanWallet> cleanWalletList = [];

  Future<void> get3CleanWallett() async {
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.get3cleanWallet();

      if (response['status'] == "OK") {
        final CleanWallet cleanWallet =
            CleanWallet.fromJson(response['3clean_wallet']);

        cleanWalletList = [cleanWallet];
        change(cleanWallet, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  var selectedIndex = RxInt(-1);

  void selectOption(int index) {
    selectedIndex.value = index == selectedIndex.value ? -1 : index;
  }

  final List<String> optionFirstDay = [
    '2000000',
    '1000000',
    '500000',
    '200000'
  ];

  void posttWallet() async {
    isLoading.value = true;
    var money =
        cleanWalletList[0].moneyU! + int.parse(textMoneyController.text);
    try {
      final response = await _apiHelper.postWallet(
          price: int.parse(textMoneyController.text),
          money: money,
          note: 'Nạp tiền vào ví',
          wallet: 'Momo',
          status: 3);

      if (response['detail'] == 0) {
        get3CleanWallett();
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
