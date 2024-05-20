import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../../../../../common/util/exports.dart';

import '../../../../../data/models/pending_invoices_models/pending_invoices.dart';

class PaymentMethods extends StatelessWidget {
  final PendingInvoices model;
  const PaymentMethods({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phương thức thanh toán',
            style: AppTextStyle.textbodyStyle,
          ),
          SizedBox(width: 0.0, height: 16.h),
          if (model.label == 2)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng cộng',
                      style: AppTextStyle.textsmallStyle,
                    ),
                    Text(
                      '${Utils.formatNumber(int.parse(model.price.toString()) * int.parse(model.numberSessions.toString()))}đ',
                      style: AppTextStyle.textbodyStyle,
                    )
                  ],
                ),
                SizedBox(width: 0.0, height: 4.h),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.label == 2 ? 'Giá từng buổi' : 'Tổng cộng',
                style: AppTextStyle.textsmallStyle,
              ),
              Text(
                '${Utils.formatNumber(int.parse(model.price.toString()))}đ',
                style: AppTextStyle.textbodyStyle,
              )
            ],
          ),
          SizedBox(width: 0.0, height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                int.parse(model.paymentMethods.toString()) != 2
                    ? 'Tiền mặt'
                    : "Ví 3CleanPay",
                style: AppTextStyle.textsmallStyle
                    .copyWith(color: AppColors.kGray500Color),
              ),
              SizedBox(width: 4.w, height: 0.0),
              Container(
                width: 24.w,
                height: 24.h,
                padding: const EdgeInsets.all(2).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.kBrightPurpleColor,
                      AppColors.kDarkPurpleColor,
                    ], // Mặc định gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomSvg(
                  image: int.parse(model.paymentMethods.toString()) == 2
                      ? AppImages.iconWallet
                      : AppImages.iconMoneyDollarBox,
                  width: 15.w,
                  color: AppColors.white,
                  height: 15.h,
                ),
              ),
            ],
          ),
          if (model.label != 2)
            if (model.orderStatus == 0)
              Column(
                children: [
                  SizedBox(width: 0.0, height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phí hủy',
                        style: AppTextStyle.textsmallStyle
                            .copyWith(color: AppColors.kRrror400Color),
                      ),
                      Text(
                        '${Utils.formatNumber(int.parse(model.cancellationFee.toString()))} đ',
                        style: AppTextStyle.textbodyStyle
                            .copyWith(color: AppColors.kRrror400Color),
                      )
                    ],
                  )
                ],
              ),
          if (model.label == 2)
            if (model.orderStatus == 0)
              Column(
                children: [
                  SizedBox(width: 0.0, height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phí hủy',
                        style: AppTextStyle.textsmallStyle
                            .copyWith(color: AppColors.kRrror400Color),
                      ),
                      Text(
                        '${Utils.formatNumber(int.parse(model.price.toString()) - int.parse(model.cancellationFee.toString()))} đ',
                        style: AppTextStyle.textbodyStyle
                            .copyWith(color: AppColors.kRrror400Color),
                      )
                    ],
                  )
                ],
              )
        ],
      ),
    );
  }
}
