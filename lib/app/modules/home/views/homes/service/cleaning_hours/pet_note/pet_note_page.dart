import '../../../../../../work/exports.dart';
import '../../../../../exports.dart';

class PetNotePage extends StatelessWidget {
  const PetNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nhà có vật nuôi là gi?',
              style:
                  AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
            ),
            ButtonWidget(
              boder: false.obs,
              onTap: () {
                Get.back();
              },
              widget: SvgPicture.asset(
                AppImages.iconClose,
                width: 24.w,
                height: 24.h,
              ),
            )
          ],
        ),
        SizedBox(width: 0.0, height: 20.h),
        Text(
          'Một số Công tác viên 3Clean bị dị ứng với lông hoặc không thích động vật. Vậy nên bạn cần ghi rõ vật nuôi trong nhà nếu có, để tránh Cộng tác viên nhận việc mà không làm được!',
          style: AppTextStyle.textxsmallStyle,
        ),
        SizedBox(width: 0.0, height: 20.h),
        ButtonWidget(
          boder: false.obs,
          onTap: () {
            Get.back();
          },
          widget: Container(
            alignment: Alignment.center,
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.kButtonColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8).r,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kButtonColor.withOpacity(0.2),
                  blurRadius: 10,
                )
              ],
            ),
            child: Text(
              Strings.close,
              style: AppTextStyle.buttonTextStyle.copyWith(
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
      ],
    );
  }
}
