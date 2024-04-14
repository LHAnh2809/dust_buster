import 'package:dust_buster/app/modules/home/exports.dart';
import '../../exports.dart';

class HeaderWidget extends StatelessWidget {
  final PromotionController controller;
  final VoidCallback onTap;
  const HeaderWidget({Key? key, required this.controller, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180.h,
          color: Colors.red,
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Strings.member,
                  style: AppTextStyle.titleStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          AppImages.iconMedai,
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(width: 4.w, height: 0.0),
                        Text(
                          '0',
                          style: AppTextStyle.titleStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(width: 4.w, height: 0.0),
                        Text(
                          Strings.gCoins,
                          style: AppTextStyle.titleStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: onTap,
                      child: Container(
                        height: 30.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Ionicons.ticket_outline,
                              size: 18.sp,
                              color: AppColors.kOrangeColor,
                            ),
                            Text(
                              '0',
                              style: AppTextStyle.titleStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: AppColors.kOrangeColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 2).r,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  child: Obx(
                    () => LinearProgressIndicator(
                      minHeight: 8.h,
                      borderRadius: BorderRadius.circular(10).r,
                      value:
                          controller.progress.value / controller.request.value,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(166, 165, 52, 206)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => Text(
                    'Điểm cần để thăng hạng BẠC: ${controller.request.value} G-Coins',
                    style: AppTextStyle.titleStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
