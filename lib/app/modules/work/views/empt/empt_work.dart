import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptWork extends StatelessWidget {
  const EmptWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = Get.find();
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
                AppImages.iconsHousekeeping,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Text(
          textAlign: TextAlign.center,
          'Đăng việc để tìm người giúp việc nhà cho\nbạn để tận hưởng cuôc sống của bạn.',
          style: AppTextStyle.textsmallStyle.copyWith(
            color: AppColors.kGray500Color,
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
        ButtonWidget(
          boder: false.obs,
          onTap: () {
            controller.selecteIndex.value = 0;
            Get.toNamed(Routes.navigationBar);
          },
          widget: Container(
            alignment: Alignment.center,
            height: 40.h,
            width: 153.w,
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            decoration: BoxDecoration(
              color: AppColors.kButtonColor,
              borderRadius: BorderRadius.circular(6).r,
            ),
            child: Text(
              'Đăng việc ngay',
              style: AppTextStyle.lableBodyStyle.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
