import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/modules/home/controllers/home_controller.dart';
import 'package:dust_buster/app/modules/widgets/button_text_widget.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/util/exports.dart';

class BlogWidget extends StatelessWidget {
  final String name;
  final HomeModel? model;
  final HomeController controller;
  final VoidCallback onTapSeeMore;
  const BlogWidget({
    Key? key,
    required this.name,
    required this.onTapSeeMore,
    this.model,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppTextStyle.largeBodyStyle,
                ),
                ButtonTextWidget(
                  onTap: onTapSeeMore,
                  text: Strings.seeMore,
                  textStyle: AppTextStyle.textbodyStyle.copyWith(
                    color: AppColors.kPurplePurpleColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 0.0, height: 8.h),
          SizedBox(
            height: 195.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model!.blog?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ButtonWidget(
                    boder: false.obs,
                    onTap: () {
                      Utils.getLaunchUrl(
                          model!.blog![index].newsUrl.toString());
                    },
                    widget: SizedBox(
                      width: 260.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.kDarkyellowColor,
                                      AppColors.kBrightyellowColor,
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 128.h,
                                      child: Center(
                                          child: Image.network(
                                        model!.blog![index].imageUrl.toString(),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 0.0, height: 8.h),
                          Text(
                            model!.blog![index].title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textbodyStyle,
                          ),
                          SizedBox(width: 0.0, height: 4.h),
                          Expanded(
                            child: Text(
                              model!.blog![index].content.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textsmallStyle.copyWith(
                                fontSize: 10.sp,
                                color: AppColors.kGrayTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
