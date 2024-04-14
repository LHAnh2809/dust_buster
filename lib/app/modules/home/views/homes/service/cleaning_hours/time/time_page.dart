import 'package:flutter/material.dart';

import '../../../../../../../common/util/exports.dart';
import '../../../../../exports.dart';

class TimePage extends StatelessWidget {
  final CleaningController controller;
  const TimePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 0.0, height: 24.h),
        Text(
          'Thời lượng',
          style: AppTextStyle.lableBodyStyle,
        ),
        SizedBox(width: 0.0, height: 4.h),
        Text(
          'Vui lòng chọn ước tính chính xác diện tính cần dọn dẹp',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray500Color),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Obx(
          () => Wrap(
            spacing: 8.w, // Khoảng cách giữa các hình ảnh
            runSpacing: 8.h, // Khoảng cách giữa các dòng
            children: List.generate(
              controller.listServiceDuration.length,
              (index) {
                final serviceDuration = controller.listServiceDuration[index];
                final isSelect = controller.selectedTimeOption.value == index;
                return ButtonWidget(
                  onTap: () {
                    controller.textRoomNumber.value =
                        serviceDuration.room.toString();
                    controller.textAcreage.value =
                        serviceDuration.acreage.toString();
                    controller.textRoomCharge.value = serviceDuration.money!;
                    controller.totalAmount.value = serviceDuration.money!;
                    controller.finalMoney.value = controller.totalAmount.value;
                    controller.originalAmount.value =
                        controller.totalAmount.value;
                    controller.textTimeRequest.value = serviceDuration.time!;
                    controller.selectTimeOption(index);
                    controller.updatePrimium();
                  },
                  widget: Container(
                    width: 167.w,
                    height: 48.h,
                    padding: const EdgeInsets.all(6).r,
                    decoration: BoxDecoration(
                      color: isSelect
                          ? AppColors.kGray1000Color
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12).r,
                      border: Border.all(color: AppColors.kGray300Color),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${serviceDuration.time.toString()} Giờ',
                          style: AppTextStyle.textbodyStyle.copyWith(
                              color:
                                  isSelect ? AppColors.white : AppColors.black),
                        ),
                        Expanded(
                          child: Text(
                            '${serviceDuration.acreage.toString()} m2 / ${serviceDuration.room.toString()} phòng',
                            style: AppTextStyle.textsmallStyle10.copyWith(
                                color: isSelect
                                    ? AppColors.white
                                    : AppColors.kGray500Color),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
