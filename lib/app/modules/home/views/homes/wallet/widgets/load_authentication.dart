import 'package:dust_buster/app/modules/home/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/util/exports.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../work/exports.dart';
import '../../../../exports.dart';

class LoadAuthentication extends StatelessWidget {
  final WalletController controller;
  const LoadAuthentication({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Xác nhận nạp tiền',
              style:
                  AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
            ),
            ButtonWidget(
              boder: false.obs,
              onTap: () {
                Get.back();
              },
              widget: SvgPicture.asset(
                AppImages.iconClose,
                width: 24.w,
                height: 24.h,
              ),
            )
          ],
        ),
        SizedBox(width: 0.0, height: 24.h),
        Text(
          'Phương thức thanh toán',
          style: AppTextStyle.textbodyStyle,
        ),
        SizedBox(width: 0.0, height: 4.h),
        ButtonWidget(
          onTap: () {},
          widget: Container(
            height: 48.h,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
            decoration: BoxDecoration(
                color: AppColors.kGray050Color,
                borderRadius: BorderRadius.circular(8).r,
                border: Border.all(color: AppColors.kGray200Color)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      AppImages.iconsMomo,
                      width: 32.w,
                      height: 32.h,
                    ),
                    SizedBox(width: 8.w, height: 0.0),
                    Text(
                      'Momo',
                      style: AppTextStyle.textsmallStyle60016,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10.w, height: 0.0),
                    const CustomSvg(
                      image: AppImages.iconArrowright,
                      fit: BoxFit.fitHeight,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Số tiền',
              style: AppTextStyle.textsmallStyle60016
                  .copyWith(color: AppColors.kGray500Color),
            ),
            Text(
                '${Utils.formatNumber(int.parse(controller.textMoneyController.text.toString()))}đ',
                style: AppTextStyle.lableBodyStyle)
          ],
        ),
        SizedBox(width: 0.0, height: 16.h),
        Container(
          height: 1.h,
          color: AppColors.kGray100Color,
        ),
        SizedBox(width: 0.0, height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phí',
              style: AppTextStyle.textsmallStyle60016
                  .copyWith(color: AppColors.kGray500Color),
            ),
            Text(
              'Miễn phí',
              style: AppTextStyle.lableBodyStyle
                  .copyWith(color: AppColors.kSuccess600Color),
            ),
          ],
        ),
        SizedBox(width: 0.0, height: 16.h),
        Container(
          height: 116.h,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              offset: const Offset(0, -4),
              blurRadius: 8.r,
              spreadRadius: 1.r,
            ),
          ]),
          child: Column(
            children: [
              SizedBox(width: 0.0, height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cổng cộng',
                    style: AppTextStyle.textsmallStyle60016,
                  ),
                  Text(
                      '${Utils.formatNumber(int.parse(controller.textMoneyController.text.toString()))}đ',
                      style: AppTextStyle.largeBodyStyle)
                ],
              ),
              SizedBox(width: 0.0, height: 16.h),
              if (controller.isLoading.value == false)
                ButtonWidget(
                  onTap: () {
                    Get.back();
                    controller.posttWallet();
                  },
                  text: 'Nạp Tiền',
                ),
              if (controller.isLoading.value == true)
                Container(
                  alignment: Alignment.center,
                  height: 45.h,
                  padding: const EdgeInsets.only(top: 4, bottom: 4).r,
                  decoration: BoxDecoration(
                    color: AppColors.kButtonColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8).r,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kButtonColor.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: AppColors.white,
                    size: 50.r,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
