import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

import '../../common/values/app_images.dart';

class CustomNotFoundWidget extends StatelessWidget {
  final String? error;
  final double? top;
  const CustomNotFoundWidget({Key? key, this.error, this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: top ?? top ?? 0.18.sh),
        child: Column(
          children: <Widget>[
            AppImages.svg(AppImages.error404, width: 250.w, height: 170.h),
            SizedBox(width: 0.0, height: 38.h),
            Text(
              error.isNullOrEmpty ? Strings.error404 : error!,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodySmallStyle,
            )
          ],
        ),
      ),
    );
  }
}
