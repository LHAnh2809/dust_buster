import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLocationWidget extends StatelessWidget {
  final Location? model;
  final LocationController controller;
  const CustomLocationWidget({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model!.defaultt == 1
                  ? Strings.defaultAddresss
                  : Strings.saveaddres,
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
        if (model!.defaultt != 1)
          ButtonWidget(
            boder: false.obs,
            onTap: () {
              controller.putLocation(model!.id,model!.idUsers);
            },
            widget: const ButtonPresent(
              text: Strings.setDefault,
              icon: AppImages.iconLocation,
            ),
          ),
        ButtonWidget(
          boder: false.obs,
          onTap: () {
            goPresent(children: [
              DeleteLocationWidget(controller: controller, model: model),  SizedBox(width: 0.0, height: 16.h),
            ]);
          },
          widget: const ButtonPresent(
            text: Strings.deleteLocation,
            icon: AppImages.iconClean,
            color: AppColors.kRrror600Color,
          ),
        )
      ],
    );
  }
}
