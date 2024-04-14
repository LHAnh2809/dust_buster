import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import '../../../../common/util/exports.dart';

class ButtonEndowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? widget;
  final String text;
  final String image;
  final String? lable;
  const ButtonEndowWidget(
      {Key? key,
      required this.onTap,
      this.widget,
      required this.text,
      required this.image,
      this.lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.kDarkPurpleColor,
                          AppColors.kBrightPurpleColor,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: CustomSvg(image: image)),
                SizedBox(width: 8.w, height: 0.0),
                Text(
                  text,
                  style: AppTextStyle.textsmallStyle60016,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                widget ?? const SizedBox(width: 0.0, height: 0.0),
                SizedBox(width: 10.w, height: 0.0),
                const CustomSvg(
                  image: AppImages.iconArrowright,
                  fit: BoxFit.fitHeight,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
