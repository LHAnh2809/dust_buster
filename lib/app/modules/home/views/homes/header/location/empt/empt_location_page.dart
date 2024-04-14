import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/svg.dart';

class EmptLocationPage extends StatelessWidget {
  const EmptLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15).r,
          height: 104,
          width: 104,
          decoration: BoxDecoration(
            color: AppColors.kGray100Color,
            borderRadius: BorderRadius.circular(88).r,
          ),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.kBrightPurpleColor,
                  AppColors.kDarkPurpleColor,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: SizedBox(
              height: 56.h,
              width: 56.w,
              child: SvgPicture.asset(
                AppImages.iconLocation,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Text(
          Strings.yourDefaultAddress,
          style: AppTextStyle.textsmallStyle.copyWith(
            color: AppColors.kGray500Color,
          ),
        ),
      ],
    );
  }
}
