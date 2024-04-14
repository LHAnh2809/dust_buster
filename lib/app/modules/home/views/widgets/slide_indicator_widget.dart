import 'package:cached_network_image/cached_network_image.dart';
import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../exports.dart';

class SlideWithIndicator extends StatelessWidget {
  final HomeController controller;

  final HomeModel? model;

  const SlideWithIndicator({
    Key? key,
    this.model,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: model!.slides!
              .map((item) => InkWell(
                    onTap: () async {
                      Utils.getLaunchUrl(item.newsUrl.toString());
                    },
                    child: Container(
                      // color: AppColors.amaranth,
                      margin: const EdgeInsets.symmetric(vertical: 14).r,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10.0).r),
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: item.imageUrl!,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey.shade300,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0).r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(10.0).r),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            enlargeFactor: 0.23,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 20 / 9,
            viewportFraction: 0.83,
            onPageChanged: (index, reason) {
              controller.onPageChanged(index);
            },
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: model!.slides!.asMap().entries.map(
              (entry) {
                int index = entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 8.w,
                  height: 8.h,
                  margin: const EdgeInsets.symmetric(horizontal: 4).r,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0).r,
                    color: controller.currentIndex.value == index
                        ? AppColors.kPurplePurpleColor
                        : AppColors.kWarningColor,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
