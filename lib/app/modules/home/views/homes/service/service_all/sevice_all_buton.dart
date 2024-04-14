import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../common/util/exports.dart';
import '../../../../exports.dart';

class SeviceAllButon extends StatelessWidget {
  final HomeModel? model;
  final HomeController controller;
  const SeviceAllButon({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.allServices,
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
        SizedBox(width: 0.0, height: 33.h),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Wrap(
            spacing: 22.w, // Khoảng cách giữa các hình ảnh
            runSpacing: 16.h, // Khoảng cách giữa các dòng
            children: List.generate(
                model!.service!
                    .length, // Số lượng hình ảnh, bao gồm cả hình ảnh cuối cùng
                (index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  controller.navigateToNextScreen(
                    model!.service![index].label,
                    model!.id,
                    model!.idL,
                    model!.location2,
                    model!.service![index].name.toString(),
                  );
                },
                child: SizedBox(
                  width: 68.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 64.h,
                        width: 64.w,
                        padding: const EdgeInsets.all(12).r,
                        decoration: BoxDecoration(
                          color: AppColors.kGrayBackgroudColor,
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(
                            color: AppColors.kGrayBodyColor,
                          ),
                        ),
                        child: ClipRRect(
                          child: SvgPicture.network(
                            model!.service![index].icon.toString(),
                            color: AppColors.kPurpleButtonColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.0, height: 4.h),
                      Text(
                        textAlign: TextAlign.center,
                        model!.service![index].name.toString(),
                        style: AppTextStyle.textbodyStyle.copyWith(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(width: 0.0, height: 16.h),
      ],
    );
  }
}
