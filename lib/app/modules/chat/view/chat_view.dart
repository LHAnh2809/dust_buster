import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/util/exports.dart';
import '../../widgets/custom_appbar_widget.dart';
import '../../widgets/custom_svg.dart';
import '../../widgets/text_field_widget.dart';
import 'controllers/chat_controller.dart';

class ChatView extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  final String numberPhone;
  const ChatView(
      {Key? key,
      required this.name,
      required this.image,
      required this.id,
      required this.numberPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppbarWidget(
          centerTitle: false,
          titleWidget: Row(
            children: [
              if (image.isEmpty)
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: NetworkImage(image),
                ),
              if (image.isNotEmpty)
                Stack(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: AppColors.kGray200Color,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3),
                      ),
                      child: SvgPicture.asset(
                        AppImages.iconAvtUser,
                        fit: BoxFit.cover,
                        width: 41.w,
                        height: 41.h,
                      ),
                    ),
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3, color: AppColors.kGray200Color),
                      ),
                    ),
                  ],
                ),
              SizedBox(width: 8.w, height: 0.0),
              Text(
                name,
                style: AppTextStyle.textsmallStyle12,
              )
            ],
          ),
          actions: [
            ButtonWidget(
              onTap: () {
                Utils.makePhoneCall(numberPhone);
              },
              widget: Container(
                width: 32.w,
                height: 32.h,
                padding: const EdgeInsets.all(8).r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.kBrightPurpleColor,
                      AppColors.kDarkPurpleColor,
                    ],
                  ),
                ),
                child: const CustomSvg(
                  image: AppImages.iconsPhoneFill,
                  color: AppColors.white,
                ),
              ),
            ).paddingOnly(right: 10.w),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Hôm nay, 9:30',
                      style: AppTextStyle.textxsmallStyle.copyWith(
                        color: AppColors.kGray500Color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8),
                            padding: const EdgeInsets.all(8).r,
                            decoration: BoxDecoration(
                              color: AppColors.kPurple050Color,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(8).r,
                                topRight: const Radius.circular(8).r,
                                bottomRight: const Radius.circular(8).r,
                              ),
                            ),
                            child: Text(
                              'Xin chào, tôi đd',
                              style: AppTextStyle.textsmallStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(8).r,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kGray100Color,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(8).r,
                                bottomRight: const Radius.circular(8).r,
                                bottomLeft: const Radius.circular(8).r,
                              ),
                            ),
                            child: Text(
                              'Xin chào, tôi đã đến địa điểm làm việc',
                              style: AppTextStyle.textsmallStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: controller.chat,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45).r,
                        borderSide: const BorderSide(
                          color: AppColors.kGray200Color,
                        ),
                      ),
                      obsNhapText: false,
                      hintText: 'Aa',
                      onChanged: (value) {
                        controller.textChat.value = value;
                      },
                    ),
                  ),
                  Obx(() => controller.textChat.value != ""
                      ? ButtonWidget(
                          onTap: () {
                            controller.sendMessage();
                          },
                          widget: Container(
                            width: 32.w,
                            height: 32.h,
                            padding: const EdgeInsets.all(6).r,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  AppColors.kBrightPurpleColor,
                                  AppColors.kDarkPurpleColor,
                                ],
                              ),
                            ),
                            child: CustomSvg(
                              image: AppImages.iconsSendPlaneFill,
                              color: AppColors.white,
                            ),
                          ),
                        ).paddingOnly(left: 10.w)
                      : const SizedBox.shrink())
                ],
              )
            ],
          ),
        ));
  }
}
