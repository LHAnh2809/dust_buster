import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../common/util/exports.dart';

class ButtonPresent extends StatelessWidget {
  final String text;
  final String icon;
  final Color? color;
  const ButtonPresent(
      {Key? key, required this.text, required this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
            color: color ?? AppColors.kGray1000Color,
          ),
          SizedBox(width: 11.w, height: 0.0),
          Text(
            text,
            style: AppTextStyle.lableBodyStyle.copyWith(
              color: color ?? AppColors.kGray1000Color,
            ),
          )
        ],
      ),
    );
  }
}
