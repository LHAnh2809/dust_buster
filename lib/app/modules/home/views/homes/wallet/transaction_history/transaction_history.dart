import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';

import '../../../../../../data/models/clean_wallet_models/clean_wallet.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../exports.dart';
import '../empty/wallet_empty.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CleanWallet? model = Get.arguments as CleanWallet?;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: 'Lịch sử giao dịch',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.kGray100Color,
              height: 5.h,
            ),
            if (model!.wallet!.isNotEmpty)
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.wallet!.length,
                itemBuilder: (context, index) {
                  final models = model.wallet![index];
                  return Padding(
                    padding: const EdgeInsets.all(16).r,
                    child: Row(
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.h,
                          padding: const EdgeInsets.all(4).r,
                          decoration: BoxDecoration(
                            color: models.status == 0
                                ? AppColors.kGray500Color
                                : models.status == 1
                                    ? AppColors.kRrror600Color
                                    : AppColors.kSuccess600Color,
                            borderRadius: BorderRadius.circular(24).r,
                          ),
                          child: CustomSvg(
                            image: models.status == 0
                                ? AppImages.iconMoneyDollarBox
                                : models.status == 1
                                    ? AppImages.iconsMoneyDollarCircleFill
                                    : AppImages.iconsWalletPlusFill,
                            fit: BoxFit.fitHeight,
                            color: AppColors.white,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        SizedBox(width: 8.w, height: 0.0),
                        SizedBox(
                          width: 199.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                models.note.toString(),
                                style: AppTextStyle.textsmallStyle,
                              ),
                              SizedBox(width: 4.w, height: 0.0),
                              Text(
                                Utils.formatDateTimeString(
                                    models.date.toString()),
                                style: AppTextStyle.textxsmallStyle
                                    .copyWith(color: AppColors.kGray500Color),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 104.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                models.status == 0 || models == 1
                                    ? '-${Utils.formatNumber(int.parse(models.moneyBF.toString()))}đ'
                                    : '+${Utils.formatNumber(int.parse(models.moneyBF.toString()))}đ',
                                style: AppTextStyle.textbodyStyle,
                              ),
                              SizedBox(width: 4.w, height: 0.0),
                              Text(
                                models.wallet.toString(),
                                style: AppTextStyle.textxsmallStyle
                                    .copyWith(color: AppColors.kGray500Color),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  height: 1.h,
                  color: AppColors.kGray100Color,
                ),
              ),
            if (model.wallet!.isEmpty)
              SizedBox(
                height: 400.h,
                child: const WalletEmpty(),
              ),
          ],
        ),
      ),
    );
  }
}
