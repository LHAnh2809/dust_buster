import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/location_models/location.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/homes/header/location/loading/widget/custom_location_widget.dart';
import 'package:dust_buster/app/modules/widgets/custom_status_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemLocationWidget extends StatelessWidget {
  final Location? model;
  final LocationController controller;
  const ItemLocationWidget({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(
          color: AppColors.kGray200Color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              LinearGradient gradient;
              if (model!.defaultt == 1) {
                gradient = const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.kBrightPurpleColor,
                    AppColors.kDarkPurpleColor,
                  ],
                );
              } else {
                gradient = const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.kGray400Color,
                    AppColors.kGray400Color,
                  ],
                );
              }
              return gradient.createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                AppImages.iconLocation,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 259.w,
            height: 50.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model!.location2,
                      style: AppTextStyle.textsmallStyle12,
                    ),
                    SizedBox(width: 8.w, height: 0.0),
                    if (model!.defaultt == 1)
                      CustomStatusWidget(
                        width: 61.w,
                        height: 12.h,
                        widget: Text(
                          Strings.defaultt,
                          style: AppTextStyle.textsmallStyle10.copyWith(
                            color: AppColors.kGray700Color,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 0.0, height: 4.h),
                Expanded(
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    model!.location,
                    style: AppTextStyle.textxsmallStyle40010
                        .copyWith(fontFamily: "PlusJakartaSans"),
                  ),
                )
              ],
            ),
          ),
          ButtonWidget(
            boder: false.obs,
            onTap: () {
              goPresent(
                children: [
                  CustomLocationWidget(
                    controller: controller,
                    model: model,
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                ],
              );
            },
            widget: SvgPicture.asset(
              AppImages.iconRight,
              width: 24.w,
              height: 24.h,
              color: AppColors.kGray400Color,
            ),
          )
        ],
      ),
    );
  }
}
