import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../../common/util/exports.dart';
import '../../../../../chat/view/chat_view.dart';
import '../../../../../widgets/button_widget.dart';
import '../../../../controllers/waiting_controller.dart';
import '../../../widgets/order_status.dart';
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
  final String phonenumberPT;
  final int oderStatus;
  final WaitingController controller;
  const JobAcceptanceStatus(
      {Key? key,
      required this.id,
      required this.name,
      required this.oneStar,
      required this.twoStar,
      required this.threeStar,
      required this.fourStar,
      required this.phonenumberPT,
      required this.fiveStar,
      required this.image,
      required this.controller,
      required this.oderStatus})
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
                        name,
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
                            '${Utils.averageRating(int.parse(oneStar.toString()), int.parse(twoStar.toString()), int.parse(threeStar.toString()), int.parse(fourStar.toString()), int.parse(fiveStar.toString()))}',
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
                            onTap: () {
                              controller.gettPartnerInformation(id);
                            },
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
            Column(
              children: [
                if (oderStatus != 5 && oderStatus != 6 && oderStatus != 0)
                  Row(
                    children: [
                      ButtonCircleWidge(
                        onTap: () {
                          controller
                              .postCreateChatt(id.toString())
                              .then((value) => Get.to(
                                    () => controller.idPC == ""
                                        ? const SizedBox.shrink()
                                        : ChatView(
                                            idPC: controller.idPC,
                                            name: name.toString(),
                                            image: image.toString(),
                                            id: id.toString(),
                                            numberPhone:
                                                phonenumberPT.toString(),
                                            oneStar: oneStar,
                                            twoStar: twoStar,
                                            threeStar: threeStar,
                                            fourStar: fourStar,
                                            fiveStar: fiveStar,
                                          ),
                                  ));
                        },
                        images: AppImages.iconNote,
                      ),
                      SizedBox(width: 16.w, height: 0.0),
                      ButtonCircleWidge(
                        onTap: () {
                          Utils.makePhoneCall(phonenumberPT);
                          // Utils.makePhoneCall('0876954462');
                        },
                        images: AppImages.iconsPhoneFill,
                      ),
                    ],
                  ),
                if (oderStatus == 0)
                  OrderStatus(
                    status: oderStatus,
                  ),
              ],
            )
        ],
      ),
    );
  }
}
