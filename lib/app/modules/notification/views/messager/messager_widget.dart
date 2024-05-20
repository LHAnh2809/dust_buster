import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/util/exports.dart';
import '../../../../data/models/phong_chat_models/phong_chat_model.dart';
import '../../../chat/view/chat_view.dart';
import '../../../widgets/button_widget.dart';

class MessagerWidget extends StatelessWidget {
  final PhongChat model;
  const MessagerWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: () {
        Get.to(
          () => ChatView(
            idPC: model.idPC.toString(),
            name: model.nameU.toString(),
            image: model.image.toString(),
            id: model.idU.toString(),
            numberPhone: model.phonenumber.toString(),
            twoStar: int.parse(model.twoStar.toString()),
            oneStar: int.parse(model.oneStar.toString()),
            threeStar: int.parse(model.threeStar.toString()),
            fourStar: int.parse(model.fourStar.toString()),
            fiveStar: int.parse(model.fiveStar.toString()),
          ),
        );
      },
      widget: Container(
        color: Colors.white,
        height: 48.h,
        width: 343.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (model!.image == "")
              Stack(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.kGray200Color,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3),
                    ),
                    child: SvgPicture.asset(
                      AppImages.iconAvtUser,
                      fit: BoxFit.cover,
                      width: 48.w,
                      height: 48.h,
                    ),
                  ),
                  Container(
                    width: 48.w,
                    height: 48.h,
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
            if (model.image != "")
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.kGray200Color,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      model.image.toString(),
                    ),
                  ),
                ),
              ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 287.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.nameU ?? '',
                        style: AppTextStyle.lableBodyStyle,
                      ),
                      Text(
                        Utils.formatTimeAgos(model.tGNT ?? ''),
                        style: AppTextStyle.textsmallStyle12.copyWith(
                          color: AppColors.kGray400Color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 251.w,
                          child: Text(
                            model.tinNhanCuoiCung ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textsmallStyle,
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 66.w,
                      //   height: 20.h,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(16).r,
                      //     color: AppColors.kGray100Color,
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       Strings.closed,
                      //       style: AppTextStyle.textsmallStyle12.copyWith(
                      //         color: AppColors.kGray500Color,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ).paddingOnly(left: 16.h),
    );
  }
}
