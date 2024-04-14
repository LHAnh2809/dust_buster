import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  const CustomSvg(
      {Key? key,
      required this.image,
      this.width,
      this.height,
      this.color,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: width ?? 24.w,
      height: height ?? 24.h,
      color: color ?? AppColors.kButtonColor,
      fit: fit ?? BoxFit.contain,
    );
  }
}
