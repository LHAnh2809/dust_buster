import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarItemWidget extends StatelessWidget {
  final String imagePath;
  final List<Color> colors;
  const BottomNavigationBarItemWidget(
      {Key? key,
      required this.imagePath,
      required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ).createShader(bounds);
      },
      child: SvgPicture.asset(
        imagePath,
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
