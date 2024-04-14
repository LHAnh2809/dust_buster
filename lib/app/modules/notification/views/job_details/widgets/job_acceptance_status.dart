import 'package:flutter_svg/flutter_svg.dart';

import '../../../../home/exports.dart';
import 'button_circle_widge.dart';
import 'partner_information.dart';

class JobAcceptanceStatus extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;
  const JobAcceptanceStatus(
      {Key? key,
      required this.id,
      required this.name,
      required this.oneStar,
      required this.twoStar,
      required this.threeStar,
      required this.fourStar,
      required this.fiveStar,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PartnerInformation(
                id: id,
                image: image,
              ),
              SizedBox(width: 12.w, height: 0.0),
              if (id == "")
                Text(
                  "Đang chờ nhận việc...",
                  style: AppTextStyle.textbodyStyle
                      .copyWith(color: AppColors.kPurplePurpleColor),
                ),
              if (id != "")
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
                                            color:
                                                AppColors.kPurplePurpleColor),
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
          if (id != "")
            Row(
              children: [
                ButtonCircleWidge(
                  onTap: () {},
                  images: AppImages.iconNote,
                ),
                SizedBox(width: 16.w, height: 0.0),
                ButtonCircleWidge(
                  onTap: () {},
                  images: AppImages.iconsPhoneFill,
                ),
              ],
            )
        ],
      ),
    );
  }
}
