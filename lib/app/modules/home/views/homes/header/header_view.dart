import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../exports.dart';

class HeaderView extends StatelessWidget {
  final VoidCallback onTapLocation;
  final VoidCallback onTapPoints;
  final VoidCallback onTapWallet;
  final String name;
  final String money;
  final String point;
  final String location;
  const HeaderView(
      {Key? key,
      required this.onTapLocation,
      required this.onTapPoints,
      required this.onTapWallet,
      required this.name,
      required this.location,
      required this.money,
      required this.point})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 148.h,
              color: AppColors.kButtonColor,
            ),
          ),
          Positioned(
            left: 185.h,
            top: 31.w,
            child: SizedBox(
              width: 216.w,
              height: 139.h,
              child: Image.asset(
                AppImages.imageHeader,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 16.h,
            top: 44.w,
            child: ButtonWidget(
              boder: false.obs,
              onTap: onTapLocation,
              widget: SizedBox(
                width: 343.w,
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${Strings.hi}, $name',
                          style: AppTextStyle.textButtonStyle
                              .copyWith(color: AppColors.white),
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  location,
                                  style: AppTextStyle.largeBodyStyle.copyWith(
                                      color: AppColors.white, fontSize: 10.sp),
                                ),
                              ),
                              SizedBox(width: 3.w, height: 0.0),
                              Icon(
                                Ionicons.chevron_forward_outline,
                                size: 12.5.sp,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 36.w,
                      height: 36.h,
                      padding: const EdgeInsets.all(5).r,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kGrayBodyColor),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: SizedBox(
                        child: SvgPicture.asset(
                          AppImages.iconLocation,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.h,
            top: 103.w,
            child: Container(
              padding: const EdgeInsets.all(12).r,
              width: 342.w,
              height: 81.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kGrayBodyColor),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16).r,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0a000000),
                    offset: const Offset(0, 6),
                    blurRadius: 5.r,
                  ),
                  BoxShadow(
                    color: const Color(0x19000000),
                    offset: const Offset(0, 5),
                    blurRadius: 12.5.r,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WalletWidget(
                    nameWallet: 'Ví 3CleanPay',
                    money: Utils.formatNumber(int.parse(money)),
                    unit: 'đ',
                    image: AppImages.iconWallet,
                    onTap: onTapWallet,
                  ),
                  WalletWidget(
                    nameWallet: 'Điểm 3CleanPoints',
                    money: Utils.formatNumber(int.parse(point)),
                    unit: 'điểm',
                    image: AppImages.iconCopperDiamond,
                    onTap: onTapPoints,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
