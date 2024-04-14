import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DeleteLocationWidget extends StatelessWidget {
  final Location? model;
  final LocationController controller;
  const DeleteLocationWidget({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.deleteLocation,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16).r,
          child: Text(
            Strings.locationDeletionWarning,
            style: AppTextStyle.textsmallStyle
                .copyWith(color: AppColors.kGray1000Color),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ButtonWidget(
                onTap: () {
                  Get.back();
                },
                colorBackGroud: Colors.white,
                text: Strings.returnn,
                boder: true.obs,
                textStyle: AppTextStyle.textButtonStyle
                    .copyWith(color: AppColors.kGray1000Color),
              ),
            ),
            SizedBox(width: 16.w, height: 0.0),
            Expanded(
              child: Column(
                children: [
                  if (controller.isLoading.value == false)
                    ButtonWidget(
                      onTap: () {
                        if (model!.defaultt != 1) {
                          controller.dellLocation(model!.id, model!.defaultt);
                        } else {
                          return Utils.showSnackbar(
                              "Không thể xoá địa chỉ mặc định", "",AppColors.amaranth);
                        }
                      },
                      text: Strings.delete,
                      boder: false.obs,
                    ),
                  if (controller.isLoading.value == true)
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
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.white,
                        size: 50.r,
                      ),
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
