import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletWidget extends StatelessWidget {
  final String nameWallet;
  final String money;
  final String unit;
  final String image;
  final VoidCallback onTap;
  const WalletWidget(
      {Key? key,
      required this.nameWallet,
      required this.money,
      required this.unit,
      required this.image,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget( boder: false.obs,
      onTap: onTap,
      widget: Container(
        width: 155.5.w,
        height: double.infinity,
        padding: const EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          color: AppColors.kGrayBodyColor,
          borderRadius: BorderRadius.circular(8).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nameWallet,
              style: AppTextStyle.textbodyStyle.copyWith(
                fontSize: 9.sp,
                color: AppColors.kGrayTextColor,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 24.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(money, style: AppTextStyle.textbodyStyle),
                      Text(
                        unit,
                        style: AppTextStyle.textbodyStyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset(image),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
