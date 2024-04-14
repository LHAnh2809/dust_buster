import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dust_buster/app/common/util/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  const Utils._();
  static String getHourStart(String time) {
    List<String> parts = time.split(',');

    String hourPart = parts[1].trim();
    return hourPart;
  }

  static void makePhoneCall(String phoneNumber) async {
    String telScheme = 'tel:$phoneNumber';
    if (await canLaunch(telScheme)) {
      await launch(telScheme);
    } else {
      throw 'Could not launch $telScheme';
    }
  }

  static Future<void> getLaunchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  static String formatDateTimeString(String dateTimeString) {
    // Chuyển đổi chuỗi sang đối tượng DateTime
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Định dạng lại theo yêu cầu
    // ignore: unnecessary_string_interpolations
    String formattedDateTime = "${_formatTime(dateTime)}";

    return formattedDateTime;
  }

  static double averageRating(
      int oneStar, int twoStar, int threeStar, int fourStar, int fiveStar) {
    int totalReviews = oneStar + twoStar + threeStar + fourStar + fiveStar;
    int totalScore = (1 * oneStar) +
        (2 * twoStar) +
        (3 * threeStar) +
        (4 * fourStar) +
        (5 * fiveStar);
    if (totalReviews == 0) {
      return 0.0;
    } else {
      return totalScore / totalReviews;
    }
  }

  static String getLableStatus(int label) {
    if (label == 0) {
      return "Đã huỷ";
    } else if (label == 1) {
      return "Chờ nhận việc";
    } else if (label == 2) {
      return "Chờ xác nhận";
    } else if (label == 3) {
      return "Đã nhận";
    } else if (label == 4) {
      return "Hoàn thành";
    } else if (label == 5) {
      return "Hoàn thành";
    } else if (label == 6) {
      return "Hoàn thành";
    }
    return "Unknown label";
  }

  static Color getColorStatus(int label) {
    if (label == 0) {
      return AppColors.kRrror600Color;
    } else if (label == 1) {
      return AppColors.kGray500Color;
    } else if (label == 2) {
      return AppColors.kWarning700Color;
    } else if (label == 3) {
      return AppColors.kWarning700Color;
    } else if (label == 4) {
      return AppColors.kSuccess600Color;
    } else if (label == 5) {
      return AppColors.kSuccess600Color;
    } else if (label == 6) {
      return AppColors.kSuccess600Color;
    }
    return AppColors.kGray500Color;
  }

  static Color getColorBackGroudStatus(int label) {
    if (label == 0) {
      return AppColors.kRrror100Color;
    } else if (label == 1) {
      return AppColors.kGray100Color;
    } else if (label == 2) {
      return AppColors.kWarning100Color;
    } else if (label == 3) {
      return AppColors.kWarning100Color;
    } else if (label == 4) {
      return AppColors.kSuccess100Color;
    } else if (label == 5) {
      return AppColors.kSuccess100Color;
    } else if (label == 6) {
      return AppColors.kSuccess100Color;
    }
    return AppColors.kGray500Color;
  }

  static widgetStar(BuildContext context, double star) {
    if (star == 0.5) {
      return _svgStar(
        AppImages.iconsStarHalfFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 1.0) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 1.5) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarHalfFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 2.0) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 2.5) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarHalfFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 3.0) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarLine,
        AppImages.iconsStarLine,
      );
    } else if (star == 3.5) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarHalfFill,
        AppImages.iconsStarLine,
      );
    } else if (star == 4.0) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarLine,
      );
    } else if (star == 4.5) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarHalfFill,
      );
    } else if (star == 5.0) {
      return _svgStar(
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
        AppImages.iconsStarFill,
      );
    }
    return _svgStar(
      AppImages.iconsStarLine,
      AppImages.iconsStarLine,
      AppImages.iconsStarLine,
      AppImages.iconsStarLine,
      AppImages.iconsStarLine,
    );
  }

  static Row _svgStar(image1, image2, image3, image4, image5) {
    return Row(
      children: [
        SvgPicture.asset(
          image1,
          color: AppColors.kPurplePurpleColor,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 4.w, height: 0.0),
        SvgPicture.asset(
          image2,
          color: AppColors.kPurplePurpleColor,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 4.w, height: 0.0),
        SvgPicture.asset(
          image3,
          color: AppColors.kPurplePurpleColor,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 4.w, height: 0.0),
        SvgPicture.asset(
          image4,
          color: AppColors.kPurplePurpleColor,
          width: 16.w,
          height: 16.h,
        ),
        SizedBox(width: 4.w, height: 0.0),
        SvgPicture.asset(
          image5,
          color: AppColors.kPurplePurpleColor,
          width: 16.w,
          height: 16.h,
        ),
      ],
    );
  }

  static String _formatTime(DateTime dateTime) {
    // Lấy giờ và phút từ DateTime
    String day = _addLeadingZero(dateTime.day);
    String month = _addLeadingZero(dateTime.month);
    String hour = _addLeadingZero(dateTime.hour);
    String minute = _addLeadingZero(dateTime.minute);

    return "$day/$month/${dateTime.year} - $hour:$minute";
  }

  static String _addLeadingZero(int number) {
    // Thêm số 0 đằng trước nếu số nhỏ hơn 10
    return number < 10 ? "0$number" : "$number";
  }

  static void showIconDialog(
    String title,
    String message, {
    Widget? imageWidget,
    VoidCallback? onTap,
  }) =>
      Get.dialog(
        AlertDialog(
          title:
              imageWidget ?? const Icon(Icons.done), //add your icon/image here
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.semiBoldStyle.copyWith(
                  color: Colors.black,
                  fontSize: Dimens.fontSize24,
                ),
              ),
              SizedBox(height: 10.w),
              Text(message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regularStyle.copyWith(
                    color: AppColors.mineShaft,
                    fontSize: Dimens.fontSize16,
                  )),
              SizedBox(height: 20.w),
            ],
          ),
        ),
        barrierDismissible: false,
      );

  static void timePicker(
    Function(String time) onSelectTime, {
    TimeOfDay? initialTime,
  }) {
    showTimePicker(
      context: Get.overlayContext!,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      if (v != null) {
        final _now = DateTime.now();
        final _dateTime = DateTime(
          _now.year,
          _now.month,
          _now.day,
          v.hour,
          v.minute,
        );

        onSelectTime(_dateTime.formatedDate(dateFormat: 'hh:mm aa'));
      }
    });
  }

  static String getRandomString(
    int length, {
    bool isNumber = true,
  }) {
    final _chars = isNumber ? '1234567890' : 'abcdefghijklmnopqrstuvwxyz';
    final _rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(
            _chars.length,
          ),
        ),
      ),
    );
  }

  static String formatTimeAgo(String time) {
    DateTime dateTime = DateTime.parse(time);

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} giây trước';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 5) {
      return '${difference.inDays} ngày trước';
    } else {
      // Format the DateTime object using intl library
      final formatter = DateFormat('dd/MM/yyyy HH:mm');
      return formatter.format(dateTime);
    }
  }

  static String getDaySign(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return 'Thứ 2';
      case DateTime.tuesday:
        return 'Thứ 3';
      case DateTime.wednesday:
        return 'Thứ 4';
      case DateTime.thursday:
        return 'Thứ 5';
      case DateTime.friday:
        return 'Thứ 6';
      case DateTime.saturday:
        return 'Thứ 7';
      case DateTime.sunday:
        return 'CN';
      default:
        return '';
    }
  }

  static String getLabel(int label) {
    if (label == 1) {
      return "Dọn dẹp nhà theo giờ";
    } else if (label == 2) {
    } else if (label == 3) {
    } else if (label == 4) {
    } else if (label == 5) {
    } else if (label == 6) {
    } else if (label == 7) {}
    return "Unknown label";
  }

  static String replaceTodayWithDayOfWeek(String selectedDateStr) {
    final DateTime now = DateTime.now();
    final String todayStr = DateFormat('dd/MM/yyyy').format(now);
    final String todayDayOfWeek = getDaySign(now.weekday);

    if (selectedDateStr.contains('Hôm nay')) {
      return selectedDateStr.replaceFirst('Hôm nay', todayDayOfWeek);
    } else if (selectedDateStr.contains(todayStr)) {
      return selectedDateStr.replaceFirst(
          todayStr, '$todayDayOfWeek, $todayStr');
    }

    return selectedDateStr;
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      Center(
        child: Container(
          padding: EdgeInsets.all(22.w),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: 10.borderRadius),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(
    String? message,
    String? icon,
    Color? colors,
  ) {
    closeSnackbar();

    Get.rawSnackbar(
        icon: icon != null
            ? SvgPicture.asset(
                icon,
                width: 18.w,
                height: 18.h,
                color: colors ?? null,
              )
            : null,
        boxShadows: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 6.r,
            spreadRadius: -2,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 15.r,
            spreadRadius: -3,
            offset: const Offset(0, 4),
          ),
        ],
        backgroundColor: AppColors.white,
        messageText: Text(
          message!,
          style: AppTextStyle.textsmallStyle,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 50).r,
        borderRadius: 9.r);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => route.settings.name == routeName,
    );
  }

  static Future<void> showImagePicker({
    required Function(File image) onGetImage,
  }) {
    return showModalBottomSheet<void>(
      context: Get.context!,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage(source: 2).then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.image,
                        size: 60.w,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        Strings.gallery,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semiBoldStyle.copyWith(
                          color: AppColors.mineShaft,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage().then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera,
                        size: 60.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.camera,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semiBoldStyle.copyWith(
                          color: AppColors.mineShaft,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  static Future<File?> getImage({int source = 1}) async {
    // File? croppedFile;
    // final picker = ImagePicker();

    // final pickedFile = await picker.pickImage(
    //   source: source == 1 ? ImageSource.camera : ImageSource.gallery,
    //   imageQuality: 60,
    // );

    // if (pickedFile != null) {
    //   final image = File(pickedFile.path);

    //   croppedFile = await ImageCropper().cropImage(
    //     compressQuality: 50,
    //     sourcePath: image.path,
    //     aspectRatioPresets: [
    //       CropAspectRatioPreset.square,
    //       CropAspectRatioPreset.ratio3x2,
    //       CropAspectRatioPreset.original,
    //       CropAspectRatioPreset.ratio4x3,
    //       CropAspectRatioPreset.ratio16x9
    //     ],
    //     androidUiSettings: const AndroidUiSettings(
    //       toolbarColor: Colors.transparent,
    //       toolbarWidgetColor: Colors.transparent,
    //       initAspectRatio: CropAspectRatioPreset.original,
    //       lockAspectRatio: false,
    //     ),
    //     iosUiSettings: const IOSUiSettings(
    //       minimumAspectRatio: 0.1,
    //       aspectRatioLockDimensionSwapEnabled: true,
    //     ),
    //   );
    // }

    return File("");
  }

  static String? birthDateValidator(String? value) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy');
    final String formatted = formatter.format(now);
    if (value != null) {
      String str1 = value;
      List<String> str2 = str1.split('/');
      String month = str2.isNotEmpty ? str2[0] : '';
      String day = str2.length > 1 ? str2[1] : '';
      String year = str2.length > 2 ? str2[2] : '';
      if (value.isEmpty) {
        return 'BirthDate is Empty';
      } else if (int.parse(month) > 13) {
        return 'Month is invalid';
      } else if (int.parse(day) > 32) {
        return 'Day is invalid';
      } else if ((int.parse(year) > int.parse(formatted))) {
        return 'Year is invalid';
      } else if ((int.parse(year) < 1920)) {
        return 'Year is invalid';
      }
    }
    return null;
  }

  static String shortenName(String? nameRaw,
      {int nameLimit = 2, bool addDots = false}) {
    //* Limiting val should not be gt input length (.substring range issue)

    if (nameRaw != null) {
      final max = nameLimit < nameRaw.length ? nameLimit : nameRaw.length;
      //* Get short name
      final name = nameRaw.substring(0, max);
      //* Return with '..' if input string was sliced
      if (addDots && nameRaw.length > max) return name.toUpperCase();
      return name.toUpperCase();
    }
    return "_";
  }

  static String formatNumber(int number) {
    String formattedNumber = number.toString();
    if (formattedNumber.length > 3) {
      for (int i = formattedNumber.length - 3; i > 0; i -= 3) {
        formattedNumber =
            '${formattedNumber.substring(0, i)},${formattedNumber.substring(i)}';
      }
    }
    return formattedNumber;
  }

  static String formatNumberK(dynamic number) {
    if (number is int) {
      if (number >= 1000 && number < 1000000) {
        return '${(number / 1000).toStringAsFixed(0)}k';
      } else if (number >= 1000000) {
        return '${(number / 1000000).toStringAsFixed(0)}M';
      } else {
        return number.toString();
      }
    } else if (number is double) {
      if (number >= 1000 && number < 1000000) {
        return '${(number / 1000).toStringAsFixed(1)}k';
      } else if (number >= 1000000) {
        return '${(number / 1000000).toStringAsFixed(1)}M';
      } else {
        return number.toString();
      }
    }
    return number.toString();
  }
}
