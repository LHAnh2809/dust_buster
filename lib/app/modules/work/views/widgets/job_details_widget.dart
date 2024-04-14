import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JobDetailsWidget extends StatelessWidget {
  final String image;
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  const JobDetailsWidget(
      {super.key, required this.image, required this.text, this.textStyle, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
            color: color,
          ),
        ),
        SizedBox(width: 12.w, height: 0.0),
        Expanded(
          child: Text(
            text,
            style: textStyle ??
                AppTextStyle.textsmallStyle.copyWith(
                  color: AppColors.kGray1000Color,
                ),
          ),
        ),
      ],
    );
  }
}
