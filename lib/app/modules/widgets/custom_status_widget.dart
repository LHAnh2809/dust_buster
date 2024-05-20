import 'package:dust_buster/app/modules/home/exports.dart';

class CustomStatusWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget widget;
  const CustomStatusWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kGray100Color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: widget,
    );
  }
}
