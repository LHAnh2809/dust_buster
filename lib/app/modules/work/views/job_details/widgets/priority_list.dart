import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../common/util/exports.dart';
import '../../../../../common/util/navigator.dart';
import '../../../../../data/models/pending_invoices_models/partner.dart';
import '../../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../../../widgets/custom_svg.dart';

class PriorityList extends StatelessWidget {
  final PendingInvoices models;
  final List<Partner> model;
  final WaitingController controller;
  const PriorityList(
      {Key? key,
      required this.model,
      required this.controller,
      required this.models})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Danh sách nhân viên nhận việc',
            style: AppTextStyle.textbodyStyle,
          ),
          SizedBox(width: 0.0, height: 16.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.length,
              separatorBuilder: (context, index) => SizedBox(
                    width: 0.0,
                    height: 16.h,
                  ),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        PartnerInformation(
                          id: model[index].idP.toString(),
                          image: model[index].imageP.toString(),
                        ),
                        SizedBox(width: 12.w, height: 0.0),
                        // Text(
                        //   "Đang chờ nhận việc...",
                        //   style: AppTextStyle.textbodyStyle
                        //       .copyWith(color: AppColors.kPurplePurpleColor),
                        // )
                        SizedBox(
                          width: 175.w,
                          height: 48.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                model[index].nameP.toString(),
                                style: AppTextStyle.textbodyStyle,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.kBrightPurpleColor,
                                            AppColors.kDarkPurpleColor,
                                          ],
                                        ).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcIn,
                                      child: SvgPicture.asset(
                                        AppImages.iconsStarFill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w, height: 0.0),
                                  Text(
                                    '${Utils.averageRating(int.parse(model[index].oneStar.toString()), int.parse(model[index].twoStar.toString()), int.parse(model[index].threeStar.toString()), int.parse(model[index].fourStar.toString()), int.parse(model[index].fiveStar.toString()))}',
                                    style: AppTextStyle.textsmallStyle10
                                        .copyWith(
                                            color: AppColors.kGray500Color),
                                  ),
                                  SizedBox(width: 8.w, height: 0.0),
                                  Container(
                                    width: 4.w,
                                    height: 4.h,
                                    decoration: const BoxDecoration(
                                      color: AppColors.kGray500Color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 8.w, height: 0.0),
                                  ButtonWidget(
                                    onTap: () {
                                      controller.gettPartnerInformation(
                                          model[index].idP.toString());
                                    },
                                    widget: SizedBox(
                                      width: 76.w,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Xem thêm',
                                            style: AppTextStyle.textsmallStyle12
                                                .copyWith(
                                                    color: AppColors
                                                        .kPurplePurpleColor),
                                          ),
                                          SizedBox(width: 2.w, height: 0.0),
                                          Icon(
                                            Ionicons.chevron_forward_outline,
                                            size: 14.sp,
                                            color: AppColors.kPurplePurpleColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ButtonWidget(
                          onTap: () {
                            goPresent(
                              isDismissibles: false,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Xác nhận',
                                      style: AppTextStyle.textButtonStyle
                                          .copyWith(color: AppColors.black),
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
                                SizedBox(width: 0.0, height: 16.h),
                                CustomSvg(
                                  image: AppImages.iconsErrorWarningFill,
                                  color: AppColors.kPurplePurpleColor,
                                  width: 48.w,
                                  height: 48.h,
                                ),
                                SizedBox(width: 0.0, height: 8.h),
                                Text(
                                  'Vui lòng xác nhận chọn người làm ${model[index].nameP.toString()}. Bạn sẽ không thay đổi được lựa chọn sau khi đã xác nhận.',
                                  style: AppTextStyle.textsmallStyle,
                                ),
                                SizedBox(width: 0.0, height: 16.h),
                                ButtonWidget(
                                  onTap: () {
                                    Get.back();
                                    controller.putAcceptJobb(
                                        model[index].idP.toString(),
                                        models.idID.toString());
                                  },
                                  text: "Xác Nhận",
                                ),
                              ],
                            );
                          },
                          widget: Container(
                            height: 24.h,
                            width: 55.w,
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4)
                                .r,
                            decoration: BoxDecoration(
                              color: AppColors.kButtonColor,
                              borderRadius: BorderRadius.circular(32).r,
                            ),
                            child: Text(
                              "Chọn",
                              style: AppTextStyle.textsmallStyle12.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
