import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/util/exports.dart';
import '../../../../../../common/util/navigator.dart';
import '../../../../../../data/models/periodic_models/Periodic.dart';
import '../../../../../widgets/text_field_widget.dart';

class CancelJobWidget extends StatelessWidget {
  final WaitingController controller;
  final Periodic model;
  const CancelJobWidget(
      {Key? key, required this.controller, required this.model})
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
              'Huỷ công việc',
              style: AppTextStyle.textButtonStyle
                  .copyWith(color: AppColors.kGray1000Color),
            ),
            ButtonWidget(
              onTap: () {
                Get.back();
              },
              widget: SvgPicture.asset(
                AppImages.iconClose,
                width: 24.w,
                height: 24.h,
              ),
              boder: false.obs,
            )
          ],
        ),
        SizedBox(width: 0.0, height: 16.h),
        Text(
          'Quy định huỷ gói đã thanh toán - hoàn tiền theo một trong hai hình thức sau:',
          style: AppTextStyle.textbodyStyle,
        ),
        SizedBox(width: 0.0, height: 8.h),
        Text(
          ' 1. Hoàn tiền qua 3CleanPay: 3Clean hoàn lại tổng số tiền cho những buổi chưa sử dụng.',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray600Color),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Text(
          ' 2. Hoàn tiền qua chuyển khoản ngân hàng: 3Clean sẽ hoàn lại tổng số tiền các buổi chưa sử dụng trừ đi 20% giá trị ban đầu.',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray600Color),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Row(
          children: [
            Expanded(
              child: ButtonWidget(
                onTap: () {
                  Get.back();
                },
                colorBackGroud: Colors.white,
                text: 'Quay lại',
                boder: true.obs,
                textStyle: AppTextStyle.textButtonStyle
                    .copyWith(color: AppColors.kGray1000Color),
              ),
            ),
            SizedBox(width: 16.w, height: 0.0),
            Expanded(
              child: Column(
                children: [
                  ButtonWidget(
                    onTap: () {
                      controller.periodicallyCancel(model);
                    },
                    text: 'Đồng ý hủy',
                    boder: false.obs,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
