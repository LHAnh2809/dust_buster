import 'package:dust_buster/app/common/values/app_colors.dart';
import 'package:flutter/material.dart';

class CalendarStyle {
  TextStyle? dayNormalStyle;
  TextStyle? daySelectedStyle;
  TextStyle? dayDisableStyle;
  TextStyle? currentDayStyle;
  TextStyle? dayFocusStyle;
  TextStyle? weekTitleStyle;
  TextStyle? monthStyle;
  Color? arrowColor;
  Color? backgroundColor;
  BoxDecoration? daySelectedDecoration;
  BoxDecoration? dayFocusDecoration;
  BoxDecoration? dayRangeFocusDecoration;
  Color? dayRangeFocusColor;

  CalendarStyle(
      {this.backgroundColor = Colors.white,
      this.dayNormalStyle = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFF333333)),
      this.daySelectedStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      this.dayDisableStyle = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFFD2D2D6)),
      this.currentDayStyle,
      this.dayFocusStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      this.weekTitleStyle = const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w800, color: Colors.black),
      this.monthStyle = const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w800, color: Colors.black),
      this.daySelectedDecoration = const BoxDecoration(
        color: AppColors.kSelectedDay,
        shape: BoxShape.circle,
        border: Border(
          top: BorderSide(color: AppColors.kRangeDay, width: 1),
          left: BorderSide(color: AppColors.kRangeDay, width: 1),
          right: BorderSide(color: AppColors.kRangeDay, width: 1),
          bottom: BorderSide(color: AppColors.kRangeDay, width: 1),
        ),
      ),
      this.dayFocusDecoration = const BoxDecoration(
        color: Color(0xFFF04F24),
      ),
      this.arrowColor = Colors.black,
      this.dayRangeFocusColor = const Color(0x1AF04F24),
      this.dayRangeFocusDecoration =
          const BoxDecoration(color: Color(0x1AF04F24))});
}
