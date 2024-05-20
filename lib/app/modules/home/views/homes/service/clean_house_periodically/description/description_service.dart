import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionService extends StatelessWidget {
  const DescriptionService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dọn dẹp định kỳ',
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
          'Nhịp sống đô thị đang dần trở nên bận rộn hơn với công việc và xã hội. Đặc biệt thời gian của người phụ nữ dành cho gia đình và chăm sóc nhà cửa cũng càng trở nên eo hẹp hơn. Vậy làm sao để cân bằng được giữa công việc và gia đình luôn là vấn đề khúc mắc của nhiều gia đình Việt. Đã có nhiều gia đình bỏ ra một khoản tiền lớn hằng tháng chỉ để thuê giúp việc cố định nhưng đôi lúc việc này trở nên không thực sự cần thiết vì không phải lúc nào cũng có việc để người giúp việc làm liên tục. Lúc này giúp việc nhà theo giờ sẽ là giải pháp hợp lý cho mọi gia đình!',
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
