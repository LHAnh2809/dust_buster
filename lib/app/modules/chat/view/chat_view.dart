import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/common/util/utils.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:dust_buster/app/modules/widgets/text_field_widget.dart';

import '../../widgets/custom_svg.dart';
import 'controllers/chat_controller.dart';

class ChatView extends StatefulWidget {
  final String name;
  final String image;
  final String id;
  final String numberPhone;
  final String idPC;
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;
  const ChatView(
      {Key? key,
      required this.name,
      required this.image,
      required this.id,
      required this.numberPhone,
      required this.idPC,
      required this.oneStar,
      required this.twoStar,
      required this.threeStar,
      required this.fourStar,
      required this.fiveStar})
      : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ChatController controller = Get.put(ChatController());
  @override
  void initState() {
    controller.connect(widget.idPC);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppbarWidget(
          centerTitle: false,
          titleWidget: Row(
            children: [
              if (widget.image != "")
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: NetworkImage(widget.image),
                ),
              if (widget.image == "")
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
                          width: 3,
                          color: AppColors.kGray200Color,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(width: 8.w, height: 0.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: AppTextStyle.textsmallStyle12,
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
                        '${Utils.averageRating(int.parse(widget.oneStar.toString()), int.parse(widget.twoStar.toString()), int.parse(widget.threeStar.toString()), int.parse(widget.fourStar.toString()), int.parse(widget.fiveStar.toString()))}',
                        style: AppTextStyle.textsmallStyle10
                            .copyWith(color: AppColors.kGray500Color),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ButtonWidget(
              onTap: () {
                Utils.makePhoneCall(widget.numberPhone);
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
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    controller: controller.scrollController,
                    reverse: true,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller
                          .messages[controller.messages.length - 1 - index];
                      return Column(
                        crossAxisAlignment:
                            controller.idUser == message.idNguoiGui
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => controller.selectedMessageId.value ==
                                    message.id
                                ? Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          Utils.formattedTime(message.thoiGian),
                                          style: AppTextStyle.textxsmallStyle
                                              .copyWith(
                                            color: AppColors.kGray400Color,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 0.0, height: 4.h),
                                    ],
                                  )
                                : SizedBox.shrink(),
                          ),
                          Row(
                            mainAxisAlignment:
                                controller.idUser == message.idNguoiGui
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            children: [
                              ButtonWidget(
                                onTap: () {
                                  controller.selectMessage(message.id);
                                },
                                widget: Container(
                                  padding: const EdgeInsets.all(8).r,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  decoration: controller.idUser ==
                                          message.idNguoiGui
                                      ? BoxDecoration(
                                          color: AppColors.kGray100Color,
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(8).r,
                                            bottomRight:
                                                const Radius.circular(8).r,
                                            bottomLeft:
                                                const Radius.circular(8).r,
                                          ),
                                        )
                                      : BoxDecoration(
                                          color: AppColors.kPurple050Color,
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(8).r,
                                            topRight:
                                                const Radius.circular(8).r,
                                            bottomRight:
                                                const Radius.circular(8).r,
                                          ),
                                        ),
                                  child: Text(
                                    message.noiDung,
                                    style: AppTextStyle.textsmallStyle,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 0.0, height: 16.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: controller.chat,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15).r,
                        borderSide: const BorderSide(
                          color: AppColors.kGray200Color,
                        ),
                      ),
                      obsNhapText: false,
                      hintText: 'Soạn tin nhắn...',
                      onChanged: (value) {
                        controller.textChat.value = value;
                      },
                    ),
                  ),
                  Obx(
                    () => controller.textChat.value != ""
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
                              child: const CustomSvg(
                                image: AppImages.iconsSendPlaneFill,
                                color: AppColors.white,
                              ),
                            ),
                          ).paddingOnly(left: 10.w)
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
