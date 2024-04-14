import 'package:flutter/material.dart';
import 'package:dust_buster/app/common/util/exports.dart';

class AppTextStyle {
  const AppTextStyle._();

  static const TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "Quicksand");

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bodySmallStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );
  static final TextStyle semiBoldMediumStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle celsiusStyle = TextStyle(
      fontSize: 100.sp, fontWeight: FontWeight.bold, color: Colors.white);

  static final TextStyle semiBoldBigStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize20,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle text24BoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize24,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle titleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle smallStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w300,
  );
  static final TextStyle regularBlandStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize14,
    color: AppColors.kBlackLight,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  //Phần text add
  static TextStyle titleBodyStyle44 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize44,
      fontFamily: "SFProText");
      
  static TextStyle titleBodyStyle28 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize28,
      fontFamily: "SFProText");
  static TextStyle titleBodyStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize24,
      fontFamily: "SFProText");

  static TextStyle largeBodyStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize20,
      fontFamily: "SFProText");

  static TextStyle textButtonStyle = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize18,
      fontFamily: "SFProText");

  static TextStyle lableBodyStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize16,
      fontFamily: "SFProText");

  static TextStyle textbodyStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize14,
      fontFamily: "SFProText");

  static TextStyle textsmallStyle12 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize12,
      fontFamily: "SFProText");
      
  static TextStyle textsmallStyle10 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w600,
      fontSize: Dimens.fontSize10,
      fontFamily: "SFProText");
  static TextStyle textsmallStyle60016 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w400,
      fontSize: Dimens.fontSize16,
      fontFamily: "SFProText");
  static TextStyle textsmallStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w400,
      fontSize: Dimens.fontSize14,
      fontFamily: "SFProText");

  static TextStyle textxsmallStyle = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w400,
      fontSize: Dimens.fontSize12,
      fontFamily: "SFProText");
  static TextStyle textxsmallStyle40010 = TextStyle(
      color: AppColors.kGray1000Color,
      fontWeight: FontWeight.w400,
      fontSize: Dimens.fontSize10,
      fontFamily: "SFProText");
}
