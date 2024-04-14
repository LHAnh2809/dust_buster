import '../home/exports.dart';

class ButtonAllWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  const ButtonAllWidget(
      {Key? key,
      required this.onTap,
      this.color,
      required this.text,
      this.colorText,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.semiBoldMediumStyle.copyWith(
            color: colorText ?? AppColors.kOrangeColor,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 16.5.sp,
          ),
        ),
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            height: 25.h,
            width: 63.w,
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              border: Border.all(
                color: AppColors.kOrangeColor,
                width: 1.r,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  Strings.all,
                  style: AppTextStyle.semiBoldMediumStyle.copyWith(
                    color: AppColors.kOrangeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                ),
                Icon(
                  Ionicons.grid_outline,
                  size: 16.5.sp,
                  color: AppColors.kOrangeColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
