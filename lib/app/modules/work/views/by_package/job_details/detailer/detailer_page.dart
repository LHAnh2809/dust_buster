import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../widgets/custom_empty_widget.dart';
import '../../../../controllers/waiting_controller.dart';

class DetailerPage extends GetView<WaitingController> {
  const DetailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = controller.partnerInformationList[0];
    print(model.user);
    final star = Utils.averageRating(
        int.parse(model.oneStar.toString()),
        int.parse(model.twoStar.toString()),
        int.parse(model.threeStar.toString()),
        int.parse(model.fourStar.toString()),
        int.parse(model.fiveStar.toString()));
    return Scaffold(
      backgroundColor: AppColors.kGray050Color,
      appBar: CustomAppbarWidget(
        title: 'Thông tin người làm',

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 375.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 90.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: AppColors.kGray200Color,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(model.imageP.toString()),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50.h,
                            left: 50.w,
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              padding: const EdgeInsets.all(1).r,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x0a000000)
                                          .withOpacity(0.06),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4.r,
                                      spreadRadius: -1.r,
                                    ),
                                    BoxShadow(
                                      color: const Color(0x0a000000)
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 4),
                                      blurRadius: 6.r,
                                      spreadRadius: -1.r,
                                    ),
                                  ]),
                              child: SvgPicture.asset(
                                AppImages.iconsShieldStarFill,
                                fit: BoxFit.cover,
                                color: AppColors.kSuccess600Color,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      model.nameP.toString(),
                      style: AppTextStyle.largeBodyStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.widgetStar(context, star),
                        SizedBox(width: 4.w, height: 0.0),
                        Text(star.toString(),
                            style: AppTextStyle.lableBodyStyle),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 0.0, height: 32.h),
              Text('Nhận xét', style: AppTextStyle.lableBodyStyle),
              SizedBox(width: 0.0, height: 16.h),
              if (model.user!.isNotEmpty)
                SizedBox(
                  width: 343.w,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 343.w,
                        padding: const EdgeInsets.all(12).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12).r,
                          border: Border.all(color: AppColors.kGray200Color),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (model.user![index].imageU.toString() != "")
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: NetworkImage(
                                        model.user![index].imageU.toString()),
                                  ),
                                if (model.user![index].imageU.toString() == "")
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
                                          width: 41.w,
                                          height: 41.h,
                                        ),
                                      ),
                                      Container(
                                        width: 48.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3,
                                              color: AppColors.kGray200Color),
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(width: 8.w, height: 0.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          model.user![index].nameU.toString(),
                                          style: AppTextStyle.lableBodyStyle,
                                        ),
                                        SizedBox(width: 5.w, height: 0.0),
                                        Utils.widgetStar(
                                          context,
                                          double.parse(model.user![index].star
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 4.w, height: 0.0),
                                    Text(
                                      Utils.formatTimeAgo(
                                          model.user![index].date.toString()),
                                      style: AppTextStyle.textsmallStyle10
                                          .copyWith(
                                              color: AppColors.kGray500Color),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 0.0, height: 10.h),
                            Text(
                              model.user![index].content.toString(),
                              style: AppTextStyle.textsmallStyle,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.h,
                    ),
                    itemCount: model.user!.length,
                  ),
                ),
              if (model.user!.isEmpty) const Center(child: CustomEmptyWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
