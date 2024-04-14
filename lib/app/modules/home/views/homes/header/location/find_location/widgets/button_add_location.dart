import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../../../data/models/viet_map_models/auto_complete/auto_complete_model.dart';
import '../../../../../../../login/exports.dart';
import '../../../../../../exports.dart';

class ButtonAddLocation extends StatelessWidget {
  final AutoCompleteModel? model;
  final String? address;
  final String? name;
  final String? lat;
  final String? lng;
  final int? ma;
  final FindLocationController controller;
  const ButtonAddLocation(
      {Key? key,
      this.model,
      required this.controller,
      this.address,
      this.name,
      this.lat,
      this.lng,
      this.ma})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.addLocation,
              style:
                  AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
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
        SizedBox(width: 0.0, height: 32.h),
        Container(
          padding:
              const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              border: Border.all(color: AppColors.kGray100Color)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.iconMapPin,
                height: 24.h,
                width: 24.w,
                color: AppColors.kGrayTextFormColor,
              ),
              SizedBox(width: 10.w, height: 0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      address ?? model!.address,
                      style: AppTextStyle.textxsmallStyle,
                    ),
                    SizedBox(width: 5.w, height: 0.0),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      name ?? model!.name,
                      style: AppTextStyle.textxsmallStyle40010.copyWith(
                        color: AppColors.kGray500Color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
        TextFormWidget(
          controller: controller.textStreetLocationController,
          hintText: Strings.nameStreet,
          textInputType: TextInputType.text,
          obscureText: false.obs,
          togglePasswordVisibility: () {},
          showButton: false,
          onChanged: (value) {
            controller.checkNullAddLocation(value);
          },
        ),
        SizedBox(width: 0.0, height: 16.h),
        ButtonWidget(
          boder: false.obs,
          onTap: () {
            String lats = "1";
            String lngs = "1";
            int mas = 2;
            if (controller.isaddLocation.value == true) {
              controller.postLocationCreate(
                address ?? model!.address,
                controller.textStreetLocationController.value.text,
                name ?? model!.refId,
                lat ?? lats,
                lng ?? lngs,
                ma ?? mas,
              );
            }
          },
          widget: Obx(() => Column(
                children: [
                  if (controller.isLoadingAddLocation.value == true)
                    Container(
                        alignment: Alignment.center,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: AppColors.kButtonColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8).r,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kButtonColor.withOpacity(0.2),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: AppColors.white, size: 30.r)),
                  if (controller.isLoadingAddLocation.value == false)
                    Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: AppColors.kButtonColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8).r,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kButtonColor.withOpacity(0.2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Text(
                        Strings.complete,
                        style: AppTextStyle.buttonTextStyle.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                ],
              )),
        )
      ],
    );
  }
}
