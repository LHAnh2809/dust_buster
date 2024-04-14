import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class CheckDkPwWidget extends StatelessWidget {
  final String text;
  final Color color;
  const CheckDkPwWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.task_alt_outlined,
          size: 17.r,
          color: color,
        ),
        SizedBox(width: 15.w, height: 0.0),
        Text(
          text,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
