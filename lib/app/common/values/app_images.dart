import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/exports.dart';

class AppImages {
  ///add app images here
  const AppImages._();

  static SizedBox svg(
    String name, {
    Color? color,
    double? width,
    double? height,
    Widget Function(BuildContext context)? placeholderBuilder,
    String defaultImage = "",
    BoxFit fit = BoxFit.contain,
  }) {
    return SizedBox(
      width: width ?? Dimens.fontSize20,
      height: height ?? Dimens.fontSize20,
      child: SvgPicture.asset(
        name,
        color: color,
        fit: fit,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }

  static Widget svgUrl(String name,
      {Color? color,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      bool circle = false,
      Widget? placeholderWidget,
      Map<String, String>? header,
      EdgeInsets padding = const EdgeInsets.all(6.0)}) {
    return Padding(
      padding: padding,
      child: SvgPicture.network(
        name,
        color: color,
        placeholderBuilder: (context) => placeholderWidget ?? Container(),
        width: width,
        height: height,
        fit: fit,
        headers: header,
      ),
    );
  }

  //auth
  static const String iconMedai = 'assets/icons/medal.png';
  static const String iconTicket = 'assets/icons/ticket.svg';
  static const String imageHinhAnh = 'assets/images/hinh_anh.jpg';
  static const String iconHistory = 'assets/icons/history.svg';
  static const String iconComplete = 'assets/icons/complete_tb.svg';
  static const String iconAvtTest = 'assets/icons/IconTest/avatar.png';

  //chính
  static const String logo3Clean = 'assets/images/3clean-master-logo.svg';
  static const String illustration = 'assets/images/Illustration.svg';
  static const String iconBack = 'assets/icons/iconBack.svg';
  static const String iconCircleCheck = 'assets/icons/circle_check_24px.svg';
  static const String iconSpam2 = 'assets/icons/spam-2.svg';
  static const String iconCloseCircleFill =
      'assets/icons/close-circle-fill.svg';
  static const String homePage = 'assets/icons/home-smile-2-fill.svg';
  static const String iconWork = 'assets/icons/work.svg';
  static const String iconNotification = 'assets/icons/notification.svg';
  static const String iconAccount = 'assets/icons/account_circle.svg';
  static const String imageHeader = 'assets/images/image_header.png';
  static const String iconLocation = 'assets/icons/location.svg';
  static const String iconLocation2 = 'assets/icons/location_2.svg';
  static const String iconWallet = 'assets/icons/wallet-fill.svg';
  static const String iconCopperDiamond = 'assets/icons/copper-diamond.svg';
  static const String iconVector = 'assets/icons/Vector.svg';
  static const String iconHouseCleaning = 'assets/icons/house_cleaning.svg';
  static const String iconmore = 'assets/icons/more.svg';
  static const String iconCleaning_1 = 'assets/images/cleaning_1.png';
  static const String iconCleaning = 'assets/images/cleaning.png';
  static const String iconAccessTime = 'assets/icons/access_time.svg';
  static const String iconDate = 'assets/icons/date.svg';
  static const String iconNote = 'assets/icons/note.svg';
  static const String iconPrice = 'assets/icons/price.svg';
  static const String iconRepeat = 'assets/icons/repeat.svg';
  static const String iconTime = 'assets/icons/time.svg';
  static const String iconAvtUser = 'assets/icons/avatar.svg';
  static const String iconActionLeft = 'assets/icons/action_Left.svg';
  static const String iconAddLocation = 'assets/icons/addLocation.svg';
  static const String iconSearchLine = 'assets/icons/search-line.svg';
  static const String iconMapPinRange = 'assets/icons/map-pin-range.svg';
  static const String iconMapPin = 'assets/icons/map-pin.svg';
  static const String errorNoData = 'assets/images/error_no_data.svg';
  static const String error404 = 'assets/images/error_404.svg';
  static const String iconClose = 'assets/icons/close.svg';
  static const String iconRight = 'assets/icons/right_icon.svg';
  static const String iconEdit = 'assets/icons/action_Icon.svg';
  static const String iconClean = 'assets/icons/clean.svg';
  static const String iconJob = 'assets/icons/job.svg';
  static const String iconCompany = 'assets/icons/company.svg';
  static const String iconPromotion = 'assets/icons/promotion.svg';
  static const String iconArrowright = 'assets/icons/arrow-right-s-line.svg';
  static const String iconBookmark = 'assets/icons/bookmark.svg';
  static const String iconUserHeart = 'assets/icons/user-heart.svg';
  static const String iconUserAdd = 'assets/icons/user-add.svg';
  static const String iconQuestion = 'assets/icons/question.svg';
  static const String iconMessage = 'assets/icons/message.svg';
  static const String iconSetting = 'assets/icons/settings.svg';
  static const String iconPrivacyPolicy = 'assets/icons/lock-password.svg';
  static const String iconErrorWarning = 'assets/icons/error-warning.svg';
  static const String iconErrorWarningLine =
      'assets/icons/error-warning-line.svg';
  static const String iconCalendarLine = 'assets/icons/calendar-line.svg';
  static const String iconCalendar2Line = 'assets/icons/calendar-2-line.svg';
  static const String iconTimeLine = 'assets/icons/time-line.svg';
  static const String iconInformationFill = 'assets/icons/information-fill.svg';
  static const String iconRadioButtonChecked =
      'assets/icons/radio_button_checked.svg';
  static const String iconRadioButtonUnchecked =
      'assets/icons/radio_button_unchecked.svg';
  static const String iconVipCrown2 = 'assets/icons/vip-crown-2-fill.svg';
  static const String iconDog = 'assets/icons/dog.svg';
  static const String iconMaymet = 'assets/icons/maymet.svg';
  static const String iconMoneyDollarBox =
      'assets/icons/money-dollar-box-fill.svg';
  static const String iconPriceTag3 = 'assets/icons/price-tag-3.svg';
  static const String imageIllustration2 = 'assets/images/Illustration2.svg';
  static const String iconsPercent = 'assets/icons/percent-fill.svg';
  static const String iconsCopperDiamondLine =
      'assets/icons/copper-diamond-line.svg';
  static const String iconsUserLocation = 'assets/icons/user-location-fill.svg';
  static const String iconsBroom = 'assets/icons/broom.svg';
  static const String iconsHousekeeping = 'assets/icons/Housekeeping.svg';
  static const String iconsNotificationOff =
      'assets/icons/notification-off.svg';
  static const String iconsShieldStarLine = 'assets/icons/shield-star-line.svg';
  static const String iconsShieldStarFill = 'assets/icons/shield-star-fill.svg';
  static const String iconsStarFill = 'assets/icons/star-fill.svg';
  static const String iconsPhoneFill = 'assets/icons/phone-fill.svg';
  static const String iconsUserStarFill = 'assets/icons/user-star-fill.svg';
  static const String iconsMoneyDollarCircleFill =
      'assets/icons/money-dollar-circle-fill.svg';
  static const String iconsWalletPlusFill = 'assets/icons/wallet-plus-fill.svg';
  static const String iconsMomo = 'assets/icons/momo.png';
  static const String iconsStarHalfFill = 'assets/icons/star-half-fill.svg';
  static const String iconsStarLine = 'assets/icons/star_line.svg';
  static const String iconsErrorWarningFill =
      'assets/icons/error-warning-fill.svg';
  static const String iconsArrowDownLine = 'assets/icons/arrow-down-s-line.svg';
  static const String iconsSendPlaneFill = 'assets/icons/send-plane-fill.svg';
  static const String iconsCamera = 'assets/icons/camera.svg';
  static const String iconsImageFill = 'assets/icons/image_fill.svg';
}
