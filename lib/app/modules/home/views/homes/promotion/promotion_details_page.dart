import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PromotionDetailsPage extends GetView<PromotionDetailsController> {
  const PromotionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final Map<String, dynamic> data = Get.arguments;

    // Truy cập các giá trị từ arguments
    final String? id = data['id'];
    final String? name = data['name'];
    final String? code = data['code'];
    final String? startDay = data['start_day'];
    final String? endDay = data['end_day'];
    final String? content = data['content'];
    final int? label = data['label'];
    final int? discount = data['discount'];
    final int? point = data['point'];
    List<String> parts = startDay!.split('/');
    String formattedDate = '${parts[0]}/${parts[1]}';
    controller.posttCheckPromotions(id!);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: Icon(
            Ionicons.arrow_back_outline,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Chi tiết khuyến mãi',
          style: AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160.h,
                    color: Color(controller.currentColor.value),
                  ),
                  Positioned(
                    left: 24.w,
                    top: 21.h,
                    child: SizedBox(
                      width: 345.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 52.h,
                                child: Text(
                                  label == 1
                                      ? Utils.formatNumberK(discount!)
                                      : '${discount.toString()}%',
                                  style: AppTextStyle.titleBodyStyle44.copyWith(
                                    color: AppColors.white,
                                    fontFamily: "SFProDisplay",
                                  ),
                                ),
                              ),
                              Text(
                                'OFF',
                                style: AppTextStyle.largeBodyStyle.copyWith(
                                  color: AppColors.white,
                                  fontFamily: "SFProDisplay",
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            AppImages.imageIllustration2,
                            width: 191.w,
                            height: 120.h,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.h,
                          padding: const EdgeInsets.all(16).r,
                          decoration: BoxDecoration(
                            color: Color(controller.currentColor.value),
                            borderRadius: BorderRadius.circular(48).r,
                          ),
                          child: SvgPicture.asset(
                            AppImages.iconsPercent,
                            width: 32.w,
                            height: 32.h,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 12.w, height: 0.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name!,
                              style: AppTextStyle.textbodyStyle,
                            ),
                            SizedBox(width: 0.0, height: 2.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.iconsCopperDiamondLine,
                                ),
                                SizedBox(width: 8.w, height: 0.0),
                                Text(
                                  '${point.toString()} điểm',
                                  style: AppTextStyle.textxsmallStyle40010
                                      .copyWith(
                                    fontFamily: "PlusJakartaSans",
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 0.0, height: 4.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.iconTimeLine,
                                ),
                                SizedBox(width: 8.w, height: 0.0),
                                Text(
                                  '$formattedDate - $endDay',
                                  style: AppTextStyle.textxsmallStyle40010
                                      .copyWith(
                                    fontFamily: "PlusJakartaSans",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 0, height: 8.h),
                    Container(
                      height: 340.h,
                      width: 343.w,
                      padding: const EdgeInsets.only(top: 16, bottom: 16).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chi tiết',
                            style: AppTextStyle.textbodyStyle,
                          ),
                          SizedBox(width: 0.0, height: 16.h),
                          Text(
                            'Mã khuyến mãi: $code',
                            style: AppTextStyle.textButtonStyle
                                .copyWith(color: AppColors.kBrightPurpleColor),
                          ),
                          Flexible(
                            child: Text(
                              content!,
                              style: AppTextStyle.textsmallStyle
                                  .copyWith(color: AppColors.kGray600Color),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Obx(
            () => Container(
              height: 106.h,
              padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 40)
                  .r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(
                  top: BorderSide(
                    color: AppColors.kGray100Color,
                  ),
                ),
              ),
              child: Column(
                children: [
                  if (controller.isLoadingPermission == false)
                    ButtonWidget(
                      colorBackGroud: controller.isCheckKM != true
                          ? AppColors.kButtonColor.withOpacity(0.8)
                          : AppColors.kGray500Color,
                      onTap: () {
                        // ignore: unrelated_type_equality_checks
                        if (controller.isCheckKM != true) {
                          controller.gettCustomerPromotions(id);
                          homeController.getHomePage();
                          Future.delayed(const Duration(seconds: 2), () {
                            controller.posttCheckPromotions(id);
                          });
                        }
                      },
                      // ignore: unrelated_type_equality_checks
                      text: controller.isCheckKM != true ? 'Lưu mã' : 'Đã lưu',
                    ),
                  // ignore: unrelated_type_equality_checks
                  if (controller.isLoadingPermission == true)
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
