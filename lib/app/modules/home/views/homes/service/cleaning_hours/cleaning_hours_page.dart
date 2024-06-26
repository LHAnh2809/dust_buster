import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:dust_buster/app/modules/widgets/text_field_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CleaningHoursPage extends StatelessWidget {
  final String id;
  final String idL;
  final String location2;
  final String nameSV;
  final int lable;
  const CleaningHoursPage(
      {Key? key,
      required this.id,
      required this.idL,
      required this.location2,
      required this.nameSV,
      required this.lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CleaningController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        titleWidget: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.selectedIndex.value != 2)
                Text(
                  'Dọn dẹp nhà theo giờ',
                  style: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
              if (controller.selectedIndex.value == 2)
                Text(
                  'Xác thực và thanh toán',
                  style: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
            ],
          ),
        ),
        actions: [
          Obx(() {
            if (controller.selectedIndex.value != 2) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 16).r,
                    child: ButtonWidget(
                      onTap: () {
                        goPresent(
                          children: [
                            const DescriptionService(),
                          ],
                        );
                      },
                      widget: SvgPicture.asset(
                        AppImages.iconErrorWarning,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Container(
                    padding: const EdgeInsets.all(16).r,
                    child: Column(
                      children: <Widget>[
                        LocationServiceWidget(controller: controller),
                        TimePage(controller: controller),
                        OtherOptionsPage(
                          controller: controller,
                          lable: lable,
                        ),
                        SizedBox(width: 0.0, height: 8.h),
                        Obx(() {
                          if (controller.isPet.value == true) {
                            return TextFieldWidget(
                              controller: controller.textPetEditingController,
                              hintText: 'Nhập ghi chú về vật nuôi...',
                              obsNhapText: false,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        })
                      ],
                    ),
                  ),
                ),
                Time2Page(controller: controller),
                WorkDetails(controller: controller, lable: 1),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              width: 375.w,
              height: controller.selectedIndex.value == 2 ? 121.h : 110.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TabBar(
                      onTap: (index) {
                        controller.selectTab(index);
                      },
                      isScrollable: false,
                      controller: controller.tabController,
                      labelPadding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.zero,
                      unselectedLabelColor: AppColors.kGrayTextColor,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicator: const BoxDecoration(),
                      tabs: [
                        _buildTab(controller.selectedIndex.value, 0),
                        _buildTab(controller.selectedIndex.value, 1),
                        _buildTab(controller.selectedIndex.value, 2),
                      ],
                    ),
                  ),
                  controller.selectedIndex.value == 2
                      ? Container(
                          width: 375.w,
                          height: controller.selectedIndex.value == 2
                              ? 116.h
                              : 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tổng cộng',
                                    style: AppTextStyle.textsmallStyle60016,
                                  ),
                                  Text(
                                    '${Utils.formatNumber(int.parse(controller.finalMoney.toString()))}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                ],
                              ),
                              Obx(
                                () => Column(
                                  children: [
                                    if (controller.isLoading.value == false)
                                      ButtonWidget(
                                        onTap: () {
                                          controller.posttCreateInvoice(lable);
                                        },
                                        text: 'Đăng việc',
                                        height: 48.h,
                                        colorBackGroud: AppColors.kButtonColor,
                                      ),
                                    if (controller.isLoading.value == true)
                                      Container(
                                        alignment: Alignment.center,
                                        height: 45.h,
                                        padding: const EdgeInsets.only(
                                                top: 4, bottom: 4)
                                            .r,
                                        decoration: BoxDecoration(
                                          color: AppColors.kButtonColor
                                              .withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(8).r,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.kButtonColor
                                                  .withOpacity(0.2),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                        child: LoadingAnimationWidget
                                            .threeArchedCircle(
                                          color: AppColors.white,
                                          size: 50.r,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 375.w,
                          height: 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Utils.formatNumber(int.parse(controller.originalAmount.toString()))}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                  Text(
                                    '${controller.textAcreage} m2 / ${controller.textRoomNumber} phòng',
                                    style: AppTextStyle.textsmallStyle.copyWith(
                                        color: AppColors.kGray500Color,
                                        fontFamily: 'PlusJakartaSans'),
                                  ),
                                ],
                              ),
                              ButtonWidget(
                                onTap: () {
                                  showDialogConfirm(
                                    child: Center(
                                      child:
                                          LoadingAnimationWidget.discreteCircle(
                                        color: AppColors.white,
                                        size: 50.r,
                                      ),
                                    ),
                                  );
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    Get.back();
                                    final int nextTabIndex =
                                        (controller.selectedIndex.value + 1) %
                                            3;
                                    controller.selectTab(nextTabIndex);
                                    controller.onTabIndexChanged(nextTabIndex);
                                    int selectedHour =
                                        controller.dateTime.value.hour;
                                    Get.focusScope!.unfocus();
                                    if (controller.selectedIndex.value == 1 &&
                                        selectedHour >= 17 &&
                                        selectedHour <= 20) {
                                      controller.nightMoney(selectedHour, 1);
                                    }
                                  });
                                },
                                text: 'Tiếp tục',
                                width: 120.w,
                                height: 48.h,
                                colorBackGroud: AppColors.kButtonColor,
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(int selectedIndex, int index) {
    return Tab(
      child: selectedIndex >= index
          ? Container(
              width: 123.w,
              height: 4.h,
              color: AppColors.black,
            )
          : Container(
              width: 123.w,
              height: 4.h,
              color: AppColors.kGray200Color,
            ),
    );
  }
}
