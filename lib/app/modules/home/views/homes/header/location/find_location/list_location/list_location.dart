import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/viet_map_models/auto_complete/auto_complete_model.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/homes/header/location/find_location/widgets/button_add_location.dart';
import 'package:flutter_svg/svg.dart';

class ListLocation extends StatelessWidget {
  final AutoCompleteModel? model;
  final FindLocationController controller;
  const ListLocation({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      boder: false.obs,
      onTap: () {
        goPresent(
          children: [
            ButtonAddLocation(controller: controller, model: model),
            SizedBox(width: 0.0, height: 16.h),
          ],
        );
      },
      widget: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            SvgPicture.asset(
              AppImages.iconMapPin,
              height: 24.h,
              width: 24.w,
              color: AppColors.kGrayTextFormColor,
            ),
            SizedBox(width: 8.w, height: 0.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 300.w,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model!.address,
                      style: AppTextStyle.textsmallStyle.copyWith(
                        color: AppColors.kGray1000Color,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 300.w,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model!.name,
                      style: AppTextStyle.textxsmallStyle40010.copyWith(
                        color: AppColors.kGray500Color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
