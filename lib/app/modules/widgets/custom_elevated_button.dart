import 'package:flutter/material.dart';

import '../../common/util/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double height, minWidth;
  final Widget? titleWidget;
  final Color buttonColor;
  final bool addBorder;
  final Color? borderColor;
  final Color? textColor;

  const CustomElevatedButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.height = 48,
    this.minWidth = 220,
    this.buttonColor = AppColors.kButtonColor,
    this.titleWidget,
    this.addBorder = false,
    this.borderColor,
    this.textColor,
  })  : assert(
          title == null || titleWidget == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "titleWidget: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => Size(
            minWidth.w,
            height.h,
          ),
        ),
        shape: addBorder
            ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: borderColor ?? Colors.white,
                    width: 1.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColors.kGreyChart.withOpacity(.24)
                  : Colors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.doveGray;
            }
            return buttonColor;
          },
        ),
      ),
      child: titleWidget ??
          Text(
            title!,
            style: textStyle ??
                AppTextStyle.bodySmallStyle
                    .copyWith(color: textColor ?? Colors.white),
          ),
    );
  }
}
