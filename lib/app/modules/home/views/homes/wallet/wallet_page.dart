import '../../../controllers/wallet_controller.dart';
import '../../../exports.dart';
import 'empty/wallet_empty.dart';
import 'loading/wallet_loading.dart';
import 'recharge/recharge_page.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: controller.obx(
        (state) {
          final model = controller.cleanWalletList[0];
          return RechargePage(
            controller: controller,
            model: model,
          );
        },
        onLoading: const Padding(
          padding: EdgeInsets.all(16),
          child: WalletLoading(),
        ),
        onEmpty: const Center(child: WalletEmpty()),
        onError: (error) => Center(
          child: CustomNotFoundWidget(error: error, top: 0.18.sh),
        ),
      ),
    );
  }
}
