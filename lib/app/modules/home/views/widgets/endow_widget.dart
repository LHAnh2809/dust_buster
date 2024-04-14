import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/modules/home/controllers/home_controller.dart';
import 'package:dust_buster/app/modules/widgets/button_text_widget.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/util/exports.dart';

class EndowWidget extends StatelessWidget {
  final String name;
  final HomeModel? model;
  final HomeController controller;
  final VoidCallback onTapSeeMore;
  const EndowWidget(
      {Key? key,
      required this.name,
      required this.onTapSeeMore,
      this.model,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.h,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppTextStyle.largeBodyStyle,
                ),
                ButtonTextWidget(
                  onTap: onTapSeeMore,
                  text: Strings.seeMore,
                  textStyle: AppTextStyle.textbodyStyle.copyWith(
                    color: AppColors.kPurplePurpleColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 0.0, height: 8.h),
          SizedBox(
            height: 185.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.promotion?.length,
              itemBuilder: (context, index) {
                String startDateString =
                    model!.promotion![index].startDP.toString();
                String endDateString =
                    model!.promotion![index].endDP.toString();
                // Chuyển đổi từ String sang DateTime
                DateTime startDate =
                    DateFormat('dd/MM/yyyy').parse(startDateString);
                DateTime endDate =
                    DateFormat('dd/MM/yyyy').parse(endDateString);
                DateTime today = DateTime.now();
                if (startDate.isBefore(today) && endDate.isAfter(today)) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16).r,
                    child: ButtonWidget(
                      boder: false.obs,
                      onTap: () {
                        Get.toNamed(Routes.promotionDetails, arguments: {
                          "id": model!.promotion![index].id.toString(),
                          "name": model!.promotion![index].nameP.toString(),
                          "code": model!.promotion![index].codeP.toString(),
                          "start_day":
                              model!.promotion![index].startDP.toString(),
                          "end_day": model!.promotion![index].endDP.toString(),
                          "content":
                              model!.promotion![index].contentP.toString(),
                          "label": model!.promotion![index].labelP,
                          "discount": model!.promotion![index].discountP,
                          "point": model!.promotion![index].pointP,
                        });
                      },
                      widget: SizedBox(
                        width: 260.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors:
                                          model!.promotion![index].labelP == 1
                                              ? [
                                                  AppColors.kButtonColor,
                                                  AppColors.kButtonsColor,
                                                ]
                                              : [
                                                  AppColors.kDarkyellowColor,
                                                  AppColors.kBrightyellowColor,
                                                ],
                                      stops: const [0.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                ),
                                Positioned(
                                  top: 18.h,
                                  left: 16.w,
                                  child: SizedBox(
                                    width: 155.w,
                                    height: 150.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model!.promotion![index].labelP == 1
                                              ? 'Giảm giá'
                                              : 'Tặng voucher',
                                          style:
                                              model!.promotion![index].labelP ==
                                                      1
                                                  ? AppTextStyle.textbodyStyle
                                                      .copyWith(
                                                      color: AppColors
                                                          .kBrightyellowColor,
                                                      fontSize: 14.sp,
                                                    )
                                                  : AppTextStyle.textbodyStyle
                                                      .copyWith(
                                                      color: AppColors.white,
                                                      fontSize: 14.sp,
                                                    ),
                                        ),
                                        Text(
                                            model!.promotion![index].labelP == 1
                                                ? Utils.formatNumberK(model!
                                                    .promotion![index]
                                                    .discountP)
                                                : '${model!.promotion![index].discountP}%',
                                            style: model!.promotion![index]
                                                        .labelP ==
                                                    1
                                                ? AppTextStyle.textbodyStyle
                                                    .copyWith(
                                                    color: AppColors
                                                        .kBrightyellowColor,
                                                    fontSize: 36.sp,
                                                    fontFamily: "SFProDisplay",
                                                  )
                                                : AppTextStyle.textbodyStyle
                                                    .copyWith(
                                                    color: AppColors.white,
                                                    fontSize: 36.sp,
                                                    fontFamily: "SFProDisplay",
                                                  )),
                                        Text(
                                          maxLines: 2,
                                          model!.promotion![index].labelP == 1
                                              ? 'Khi đặt dịch vụ'
                                              : 'Chot tất cả các dịch vụ\ntừ 21/6/30/6/2024',
                                          style:
                                              model!.promotion![index].labelP ==
                                                      1
                                                  ? AppTextStyle.textbodyStyle
                                                      .copyWith(
                                                      color: AppColors
                                                          .kBrightyellowColor,
                                                      fontSize: 10.sp,
                                                    )
                                                  : AppTextStyle.textbodyStyle
                                                      .copyWith(
                                                      color: AppColors.white,
                                                      fontSize: 10.sp,
                                                    ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 7.h,
                                  left: 93.w,
                                  child: SizedBox(
                                    width: 144.w,
                                    height: 136.h,
                                    child: model!.promotion![index].labelP == 1
                                        ? Image.asset(
                                            AppImages.iconCleaning,
                                            width: 144.w,
                                            height: 144.h,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            width: 144.w,
                                            height: 144.h,
                                            AppImages.iconCleaning_1,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 0.0, height: 8.h),
                            Text(
                              model!.promotion![index].nameP.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textbodyStyle,
                            ),
                            SizedBox(width: 0.0, height: 4.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.iconCopperDiamond,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                                SizedBox(width: 2.w, height: 0),
                                Text(
                                  "${model!.promotion![index].pointP.toString()} điểm",
                                  style: AppTextStyle.textsmallStyle.copyWith(
                                    fontSize: 10.sp,
                                    fontFamily: "PlusJakartaSansRegular",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  // Nếu không nằm trong khoảng thời gian mong muốn, trả về một widget trống
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
