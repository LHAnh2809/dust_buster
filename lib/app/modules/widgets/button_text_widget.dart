import 'package:flutter/material.dart';

import '../../common/util/exports.dart';

class ButtonTextWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle? textStyle;
  const ButtonTextWidget(
      {Key? key, required this.onTap, required this.text, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Text(text, style: textStyle ?? AppTextStyle.textbodyStyle),
    );
  }
}
