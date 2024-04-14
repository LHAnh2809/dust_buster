import 'package:dust_buster/app/modules/promotion/controllers/promotion_controller.dart';
import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class YourOfferWidget extends StatelessWidget {
  final PromotionController controller;
  const YourOfferWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) {
          return InkWell(
            onTap: () {
              debugPrint("Click $index");
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
              child: Row(
                children: [
                  Container(
                    width: 75.w,
                    height: 75.h,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                            .r,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kBlackLight2.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.imageHinhAnh,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 75.h,
                      padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 9, right: 20)
                          .r,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10).r,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kBlackLight2.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ECOLIFE GIẢM 70K CHO ĐƠN TỪ 500K',
                            style: AppTextStyle.semiBoldMediumStyle.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            'HSD: 10/04/2024',
                            style: AppTextStyle.semiBoldMediumStyle.copyWith(
                              color: AppColors.doveGray,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
