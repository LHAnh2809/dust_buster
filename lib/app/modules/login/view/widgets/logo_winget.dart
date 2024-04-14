import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/util/exports.dart';

class LogoWinget extends StatelessWidget {
  const LogoWinget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AppImages.logo3Clean,
        height: 70.h,
        width: 200.w,
      ),
    );
  }
}
