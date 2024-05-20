import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:flutter/material.dart';
import '../../../../common/util/navigator.dart';
import '../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../../home/exports.dart';
import '../../../widgets/text_field_widget.dart';

class CancelJobWidget extends StatelessWidget {
  final WaitingController controller;
  final PendingInvoices model;
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
          'Bạn được huỷ miễn phí trong 2 trường hợp sau:',
          style: AppTextStyle.textbodyStyle,
        ),
        SizedBox(width: 0.0, height: 8.h),
        Text(
          ' 1. Huỷ khi chưa có ai nhận việc\n\n 2. Huỷ trước giờ làm việc ít nhất 6 tiếng',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray600Color),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Text(
          'Ngoài 2 trường hợp trên, bạn sẽ bị tính phí theo các mức như sau:',
          style: AppTextStyle.textbodyStyle,
        ),
        SizedBox(width: 0.0, height: 8.h),
        Text(
          ' 1. Phí huỷ 20,000đ nếu huỷ trước khi công việc bắt đầu 1 giờ, tức là trước ${controller.formattedNewStartTime}, ${controller.formattedDate}\n\n 2. Phí huỷ 30% giá trị công việc nếu huỷ trong vòng 1 giờ trước khi công việc bắt đầu, tức là sau ${controller.formattedNewStartTime}, ${controller.formattedDate}',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray600Color),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.kRrror100Color,
            borderRadius: BorderRadius.circular(8).r,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.iconErrorWarning,
                width: 24.w,
                height: 24.h,
                color: AppColors.kRrror700Color,
              ),
              SizedBox(width: 8.w, height: 0.h),
              Text(
                'Độ tin cậy của bạn sẽ giảm nếu huỷ nhiều lần.',
                style: AppTextStyle.textxsmallStyle
                    .copyWith(color: AppColors.kRrror700Color),
              ),
            ],
          ).paddingOnly(left: 16),
        ),
        SizedBox(width: 0.0, height: 16.h),
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
                      controller.prepareTheBill(model).then(
                            (value) => {
                              goPresent(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Lý do hủy việc',
                                        style: AppTextStyle.textButtonStyle
                                            .copyWith(
                                                color:
                                                    AppColors.kGray1000Color),
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
                                  Flexible(
                                    child: ListView.separated(
                                      itemCount: controller.itemsLiDo.length,
                                      itemBuilder: (context, index) {
                                        return ButtonWidget(
                                          onTap: () {
                                            controller.textLido.value =
                                                controller.itemsLiDo[index];
                                            Get.back();
                                            if (controller.textLido.value ==
                                                "Lý do khác") {
                                              goPresent(children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Lý do hủy việc',
                                                      style: AppTextStyle
                                                          .textButtonStyle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .kGray1000Color),
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
                                                SizedBox(
                                                    width: 0.0, height: 32.h),
                                                TextFieldWidget(
                                                  controller: controller
                                                      .textEditNoteKhac,
                                                  obsNhapText: false,
                                                  hintText: 'Nhập lý do hủy',
                                                ),
                                                SizedBox(
                                                    width: 0.0, height: 16.h),
                                                ButtonWidget(
                                                  onTap: () {
                                                    if (controller
                                                        .textEditNoteKhac
                                                        .text
                                                        .isEmpty) {
                                                      return Utils.showSnackbar(
                                                          message:
                                                              'Vui lòng nhập lý do trước khi hủy',
                                                          icon: AppImages
                                                              .iconCircleCheck,
                                                          colors: AppColors
                                                              .kRrror600Color);
                                                    } else {
                                                      controller
                                                          .putCancelJobb(model);
                                                    }
                                                  },
                                                  text: 'Đồng ý',
                                                ),
                                              ]);
                                            } else {
                                              controller.putCancelJobb(model);
                                            }
                                          },
                                          widget: Container(
                                            height: 56.h,
                                            padding: const EdgeInsets.all(16).r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12).r,
                                              color: AppColors.white,
                                              border: Border.all(
                                                color: AppColors.kGray300Color,
                                              ),
                                            ),
                                            child: Text(
                                              controller.itemsLiDo[index],
                                              style: AppTextStyle.lableBodyStyle
                                                  .copyWith(
                                                color: AppColors.kGray1000Color,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 0.0, height: 8.h),
                                    ),
                                  ),
                                ],
                              ),
                            },
                          );
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
