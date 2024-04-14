import 'package:dust_buster/app/modules/promotion/controllers/promotion_controller.dart';
import 'package:dust_buster/app/modules/widgets/button_all_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class DiscountBustBuster extends StatelessWidget {
  final PromotionController controller;
  const DiscountBustBuster({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
          child: ButtonAllWidget(
            onTap: () {},
            color: AppColors.kGreyChart,
            text: Strings.fromPartner,
            fontSize: 14.5.sp,
            colorText: Colors.black,
          ),
        ),
        Column(
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                debugPrint("Click $index");
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(bottom: 13),
                width: double.infinity,
                color: AppColors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Image.asset(
                          AppImages.imageHinhAnh,
                          height: 60.h,
                          width: 60.h,
                        ),
                        SizedBox(width: 8.w, height: 0.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "GO2JOY",
                              style: AppTextStyle.semiBoldMediumStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(width: 0.0, height: 5.h),
                            Text(
                              'Giảm 50% khi đặt khách sạn',
                              style: AppTextStyle.semiBoldMediumStyle.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 20.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(97, 187, 0, 255),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          child: Text(
                            "40",
                            style: AppTextStyle.semiBoldMediumStyle.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.7.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 0.0, height: 5.h),
                        Text(
                          Strings.gCoins,
                          style: AppTextStyle.semiBoldMediumStyle.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.7.sp,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
