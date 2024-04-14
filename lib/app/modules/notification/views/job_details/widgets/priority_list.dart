import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data/models/job_details_models/partner.dart';
import '../../../../home/exports.dart';
import 'partner_information.dart';

class PriorityList extends StatelessWidget {
  final List<Partner> model;
  const PriorityList({Key? key, required this.model}) : super(key: key);

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
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PartnerInformation(
                      id: model[index].idP.toString(),
                      image: '',
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
                            'Ngô Thị Thuỷ Tiên',
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
                                '4.95',
                                style: AppTextStyle.textsmallStyle10
                                    .copyWith(color: AppColors.kGray500Color),
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
                                onTap: () {},
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
                      onTap: () {},
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
            ),
          ),
        ],
      ),
    );
  }
}
