import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class ButtonCircleWidge extends StatelessWidget {
  final VoidCallback onTap;
  final String images;
  const ButtonCircleWidge({Key? key, required this.onTap, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onTap,
      widget: Container(
        width: 40.w,
        height: 40.h,
        padding: const EdgeInsets.all(10).r,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.kBrightPurpleColor,
              AppColors.kDarkPurpleColor,
            ],
          ),
        ),
        child:  CustomSvg(
          image: images,
          color: AppColors.white,
        ),
      ),
    );
  }
}
