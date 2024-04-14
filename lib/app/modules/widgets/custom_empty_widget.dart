import 'package:flutter/material.dart';

import '../../common/util/exports.dart';

class CustomEmptyWidget extends StatelessWidget {
  final double? top;
  const CustomEmptyWidget({Key? key, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: top ?? 0.18.sh),
        child: Column(
          children: <Widget>[
            AppImages.svg(AppImages.errorNoData, width: 250.w, height: 170.h),
            SizedBox(width: 0.0, height: 38.h),
            Text(
              Strings.errorNoData,
              style: AppTextStyle.bodySmallStyle,
            )
          ],
        ),
      ),
    );
  }
}
