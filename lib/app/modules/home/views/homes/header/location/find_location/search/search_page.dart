import 'package:dust_buster/app/modules/home/controllers/find_location_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../common/util/exports.dart';
import '../../../../../home_view.dart';

class SearchPage extends StatelessWidget {
  final FindLocationController controller;
  const SearchPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      child: Container(
        height: 48.h,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 9, right: 12).r,
        decoration: BoxDecoration(
          color: AppColors.white,
          // color: AppColors.amaranth,
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(width: 1.w, color: AppColors.kGray100Color),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              offset: const Offset(0, 4),
              blurRadius: 6.r,
              spreadRadius: -2.r,
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              offset: const Offset(0, 4),
              blurRadius: 15.r,
              spreadRadius: -3.r,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextFormField(
              controller: controller.textLocationController,
              keyboardType: TextInputType.text,
              obscureText: false,
              onChanged: (value) {
                controller.getAutoComplete(value);
                debugPrint(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  AppImages.iconSearchLine,
                  color: AppColors.kGray500Color,
                  width: 20.w,
                  height: 20.h,
                ),
                hintText: "Tìm kiếm",
                hintStyle: AppTextStyle.textsmallStyle
                    .copyWith(color: AppColors.kGrayTextFormColor),
                filled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
