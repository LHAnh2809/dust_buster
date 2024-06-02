import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAvartarWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonAvartarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24).r,
        child: ButtonWidget(
          onTap: onTap,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.kBrightPurpleColor,
                          AppColors.kDarkPurpleColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      color: AppColors.kPurplePurpleColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppImages.iconAvtUser,
                      fit: BoxFit.cover,
                      width: 41.w,
                      height: 41.h,
                    ),
                  ),
                  Container(
                    width: 64.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: AppColors.kPurplePurpleColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 223.w,
                height: 52.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('LHAnh', style: AppTextStyle.lableBodyStyle),
                    Text('Chỉnh sửa tài khoản',
                        style: AppTextStyle.textxsmallStyle),
                  ],
                ),
              ),
              const CustomSvg(
                image: AppImages.iconArrowright,
                fit: BoxFit.fitHeight,
              )
            ],
          ),
        ));
  }
}
