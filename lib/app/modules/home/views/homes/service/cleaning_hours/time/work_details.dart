import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_status_widget.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:flutter_svg/svg.dart';

class WorkDetails extends StatelessWidget {
  final CleaningController controller;
  const WorkDetails({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        color: AppColors.kGray050Color,
        padding: const EdgeInsets.symmetric(vertical: 8).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // height: 144.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vị trí làm việc',
                          style: AppTextStyle.textButtonStyle
                              .copyWith(color: AppColors.kGray1000Color),
                        ),
                        ButtonWidget(
                          onTap: () {
                            goPresent(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chọn địa chỉ làm việc',
                                      style: AppTextStyle.textButtonStyle
                                          .copyWith(
                                              color: AppColors.kGray1000Color),
                                    ),
                                    ButtonWidget(
                                      onTap: () {
                                        Get.back();
                                      },
                                      widget: SvgPicture.asset(
                                        AppImages.iconClose,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      boder: false.obs,
                                    )
                                  ],
                                ),
                                SizedBox(width: 0.0, height: 16.h),
                                Flexible(
                                  child: ListView.separated(
                                    itemCount: controller.locations.length,
                                    itemBuilder: (context, index) {
                                      final location =
                                          controller.locations[index];
                                      final isSelected =
                                          controller.selectedLocation.value ==
                                              index;
                                      final color =
                                          controller.selectedLocation.value ==
                                                  index
                                              ? AppColors.kGray1000Color
                                              : AppColors.kGray500Color;
                                      return ButtonWidget(
                                        onTap: () {
                                          controller.selectLocation(index);
                                          controller.textLocation.value =
                                              location.location;
                                          controller.textLocation2.value =
                                              location.location2;
                                          controller.textLat.value =
                                              location.lat;
                                          controller.textLng.value =
                                              location.lng;
                                          Get.back();
                                        },
                                        widget: Container(
                                          height: 68.h,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 8)
                                              .r,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8).r,
                                            border: Border.all(
                                              color: isSelected
                                                  ? AppColors.kGray1000Color
                                                  : AppColors.kGray500Color,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  LinearGradient gradient;
                                                  if (location.defaultt == 1) {
                                                    gradient =
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        AppColors
                                                            .kBrightPurpleColor,
                                                        AppColors
                                                            .kDarkPurpleColor,
                                                      ],
                                                    );
                                                  } else {
                                                    gradient =
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        AppColors.kGray400Color,
                                                        AppColors.kGray400Color,
                                                      ],
                                                    );
                                                  }
                                                  return gradient
                                                      .createShader(bounds);
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          location.location2,
                                                          style: AppTextStyle
                                                              .textsmallStyle12,
                                                        ),
                                                        SizedBox(
                                                            width: 8.w,
                                                            height: 0.0),
                                                        if (location.defaultt ==
                                                            1)
                                                          CustomStatusWidget(
                                                            width: 61.w,
                                                            height: 12.h,
                                                            widget: Text(
                                                              Strings.defaultt,
                                                              style: AppTextStyle
                                                                  .textsmallStyle10
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .kGray700Color,
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        width: 0.0,
                                                        height: 4.h),
                                                    Expanded(
                                                      child: Text(
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        location.location,
                                                        style: AppTextStyle
                                                            .textxsmallStyle40010
                                                            .copyWith(
                                                                fontFamily:
                                                                    "PlusJakartaSans"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              CustomSvg(
                                                image: isSelected
                                                    ? AppImages
                                                        .iconRadioButtonChecked
                                                    : AppImages
                                                        .iconRadioButtonUnchecked,
                                                color: color,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 0.0, height: 8.h),
                                  ),
                                ),
                              ],
                            );
                          },
                          widget: Container(
                            height: 24.h,
                            width: 67.w,
                            padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 7)
                                .r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              border:
                                  Border.all(color: AppColors.kGray1000Color),
                            ),
                            child: Text(
                              Strings.change,
                              style: AppTextStyle.textsmallStyle12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  Obx(
                    () => JobDetailsWidget(
                      image: AppImages.iconMapPin,
                      text: controller.textLocation.toString(),
                      color: AppColors.kGrayTextFormColor,
                    ),
                  ),
                  SizedBox(width: 0.0, height: 8.h),
                  JobDetailsWidget(
                    image: AppImages.iconsUserLocation,
                    text:
                        '${controller.textName} - ${controller.textPhoneNumber}',
                    color: AppColors.kGrayTextFormColor,
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian làm việc',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  JobDetailsWidget(
                    image: AppImages.iconDate,
                    color: AppColors.kGray400Color,
                    text: controller.selectedDate.toString(),
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconTime,
                    text: controller.textTimeAll.value,
                    color: AppColors.kGray400Color,
                  ),
                  if (controller.textRepeat.value != "")
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconRepeat,
                          color: AppColors.kGray400Color,
                          text: controller.textRepeat.value,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết công việc',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  JobDetailsWidget(
                    image: AppImages.iconWork,
                    text:
                        '${controller.textAcreage} m2 / ${controller.textRoomNumber} phòng',
                    color: AppColors.kGray400Color,
                  ),
                  if (controller.isPremiumService.value == true)
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 16.h),
                        const JobDetailsWidget(
                          image: AppImages.iconVipCrown2,
                          text: 'Dịch vụ Premium',
                          color: AppColors.kGray400Color,
                        ),
                      ],
                    ),
                  if (controller.isPet.value == true)
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        const JobDetailsWidget(
                          image: AppImages.iconDog,
                          text: 'Nhà có vật nuôi',
                          color: AppColors.kGray400Color,
                        ),
                      ],
                    ),
                  SizedBox(width: 0.0, height: 16.h),
                  const JobDetailsWidget(
                    image: AppImages.iconsBroom,
                    text: 'Đem theo dụng cụ',
                    color: AppColors.kGray400Color,
                  ),
                  if (controller.textPetEditingController.value.text != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text(
                          'Ghi chú vật nuôi',
                          style: AppTextStyle.textbodyStyle,
                        ),
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          color: AppColors.kGray400Color,
                          text: controller.textPetEditingController.value.text,
                        ),
                      ],
                    ),
                  if (controller
                          .textEmployeeNotesEditingController.value.text !=
                      "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text(
                          'Ghi chú người làm',
                          style: AppTextStyle.textbodyStyle,
                        ),
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          color: AppColors.kGray400Color,
                          text: controller
                              .textEmployeeNotesEditingController.value.text,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 1.0,
                      color: AppColors.kGray100Color,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tính tiền',
                      style: AppTextStyle.textButtonStyle
                          .copyWith(color: AppColors.kGray1000Color),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tạm tính',
                          style: AppTextStyle.textsmallStyle
                              .copyWith(color: AppColors.kGray1000Color),
                        ),
                        Text(
                          '${Utils.formatNumber(int.parse(controller.totalAmount.toString()))} đ',
                          style: AppTextStyle.textbodyStyle
                              .copyWith(color: AppColors.kGray1000Color),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    if (controller.isPromotions.value == true &&
                        controller.textlabelKM.value == 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Khuyến mãi',
                            style: AppTextStyle.textsmallStyle
                                .copyWith(color: AppColors.kPurplePurpleColor),
                          ),
                          Text(
                            '- ${Utils.formatNumber(int.parse(controller.textPromotions.toString()))} đ',
                            style: AppTextStyle.textbodyStyle
                                .copyWith(color: AppColors.kPurplePurpleColor),
                          )
                        ],
                      ),
                    if (controller.isPromotions.value == true &&
                        controller.textlabelKM.value == 2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Khuyến mãi',
                            style: AppTextStyle.textsmallStyle
                                .copyWith(color: AppColors.kPurplePurpleColor),
                          ),
                          Text(
                            '- ${controller.textPromotions} %',
                            style: AppTextStyle.textbodyStyle
                                .copyWith(color: AppColors.kPurplePurpleColor),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              height: 175.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phương thức thanh toán',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        goPresent(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chọn phương thức thanh toán',
                                style: AppTextStyle.textButtonStyle
                                    .copyWith(color: AppColors.kGray1000Color),
                              ),
                              ButtonWidget(
                                onTap: () {
                                  Get.back();
                                },
                                widget: SvgPicture.asset(
                                  AppImages.iconClose,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                boder: false.obs,
                              )
                            ],
                          ),
                          SizedBox(width: 0.0, height: 16.h),
                          SizedBox(
                            height: 140.h,
                            child: ListView.separated(
                              itemCount: controller.paymentMethods.length,
                              itemBuilder: (context, index) {
                                final method = controller.paymentMethods[index];

                                Color? color =
                                    controller.selectedPaymentMethod.value ==
                                            method
                                        ? AppColors.kGray1000Color
                                        : AppColors.kGray500Color;
                                String image;

                                switch (method) {
                                  case 'Ví 3CleanPay':
                                    image = AppImages.iconWallet;
                                    break;
                                  case 'Tiền mặt':
                                    image = AppImages.iconMoneyDollarBox;
                                    break;

                                  default:
                                    image = AppImages.iconWallet;
                                }
                                return ButtonWidget(
                                  onTap: () {
                                    if (method == "Ví 3CleanPay") {
                                      if (controller.textMoney >
                                          int.parse(controller.finalMoney
                                              .toString())) {
                                        controller.selectPaymentMethod(method);
                                      } else {
                                        Get.back();
                                        return Utils.showSnackbar(
                                            'Ví 3CleanPay của bạn không đủ số dư vui lòng thanh toán bằng tiền mặt',
                                            '',AppColors.amaranth);
                                      }
                                    } else {
                                      controller.selectPaymentMethod(method);
                                    }

                                    Get.back();
                                  },
                                  widget: Container(
                                    height: 56.h,
                                    padding: const EdgeInsets.all(16).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12).r,
                                      border: Border.all(
                                        color: color,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 24.w,
                                              height: 24.h,
                                              padding:
                                                  const EdgeInsets.all(2).r,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8).r,
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    AppColors
                                                        .kBrightPurpleColor,
                                                    AppColors.kDarkPurpleColor,
                                                  ], // Mặc định gradient
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                              ),
                                              child: CustomSvg(
                                                image: image,
                                                width: 15.w,
                                                color: AppColors.white,
                                                height: 15.h,
                                              ),
                                            ),
                                            SizedBox(width: 10.w, height: 0.0),
                                            Text(
                                              method,
                                              style: AppTextStyle.lableBodyStyle
                                                  .copyWith(
                                                color: color,
                                              ),
                                            ),
                                            SizedBox(width: 5.w, height: 0.0),
                                            if (method == "Ví 3CleanPay")
                                              Text(
                                                '(${Utils.formatNumber(int.parse(controller.textMoney.toString()))} đ)',
                                                style: AppTextStyle
                                                    .textsmallStyle60016
                                                    .copyWith(
                                                  color:
                                                      AppColors.kGray400Color,
                                                ),
                                              ),
                                          ],
                                        ),
                                        CustomSvg(
                                          image: controller
                                                      .selectedPaymentMethod
                                                      .value ==
                                                  method
                                              ? AppImages.iconRadioButtonChecked
                                              : AppImages
                                                  .iconRadioButtonUnchecked,
                                          color: color,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 0.0, height: 8.h),
                            ),
                          ),
                        ]);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.h,
                                  padding: const EdgeInsets.all(2).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8).r,
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppColors.kBrightPurpleColor,
                                        AppColors.kDarkPurpleColor,
                                      ], // Mặc định gradient
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: CustomSvg(
                                    image: controller
                                                .selectedPaymentMethod.value ==
                                            "Ví 3CleanPay"
                                        ? AppImages.iconWallet
                                        : AppImages.iconMoneyDollarBox,
                                    width: 15.w,
                                    color: AppColors.white,
                                    height: 15.h,
                                  ),
                                ),
                                SizedBox(width: 8.w, height: 0.0),
                                Text(
                                  controller.selectedPaymentMethod.value,
                                  style: AppTextStyle.textsmallStyle60016,
                                ),
                                SizedBox(width: 4.w, height: 0.0),
                                Text(
                                  controller.selectedPaymentMethod.value ==
                                          "Ví 3CleanPay"
                                      ? '(${Utils.formatNumber(int.parse(controller.textMoney.toString()))} đ)'
                                      : '',
                                  style: AppTextStyle.textsmallStyle60016,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const SizedBox(width: 0.0, height: 0.0),
                                SizedBox(width: 10.w, height: 0.0),
                                const CustomSvg(
                                  image: AppImages.iconArrowright,
                                  fit: BoxFit.fitHeight,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      goPresent(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chọn khuyến mãi',
                                style: AppTextStyle.textButtonStyle
                                    .copyWith(color: AppColors.kGray1000Color),
                              ),
                              ButtonWidget(
                                onTap: () {
                                  Get.back();
                                },
                                widget: SvgPicture.asset(
                                  AppImages.iconClose,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                boder: false.obs,
                              )
                            ],
                          ),
                          SizedBox(width: 0.0, height: 16.h),
                          Flexible(
                            child: ListView.separated(
                              itemCount: controller.customerPromotions.length,
                              itemBuilder: (context, index) {
                                final customerPromotion =
                                    controller.customerPromotions[index];
                                final isSelected =
                                    controller.selectedPromotions.value ==
                                        index;
                                final color =
                                    controller.selectedPromotions.value == index
                                        ? AppColors.kGray1000Color
                                        : AppColors.kGray500Color;
                                if (controller.customerPromotions.length > 0) {
                                  return ButtonWidget(
                                    onTap: () {
                                      controller.textPromotions.value =
                                          customerPromotion.discount!;
                                      controller.textPoint.value =
                                          customerPromotion.point!;
                                      controller.textCodePromotions.value =
                                          customerPromotion.code!;
                                      controller.textlabelKM.value =
                                          customerPromotion.label!;
                                      controller.textIdPromotions.value =
                                          customerPromotion.id!;
                                      controller.selectePromotions(index);
                                      Get.back();
                                    },
                                    widget: Container(
                                      height: 68.h,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8)
                                          .r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8).r,
                                        border: Border.all(
                                          color: isSelected
                                              ? AppColors.kGray1000Color
                                              : AppColors.kGray500Color,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 40.h,
                                            padding: const EdgeInsets.all(10).r,
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors.kPurplePurpleColor,
                                              borderRadius:
                                                  BorderRadius.circular(48).r,
                                            ),
                                            child: SvgPicture.asset(
                                              AppImages.iconsPercent,
                                              width: 32.w,
                                              height: 32.h,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10.h, height: 0.0),
                                          SizedBox(
                                            width: 250.w,
                                            height: 50.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  customerPromotion.code!,
                                                  style: AppTextStyle
                                                      .textsmallStyle12,
                                                ),
                                                SizedBox(
                                                    width: 0.0, height: 4.h),
                                                Expanded(
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    customerPromotion.name!,
                                                    style: AppTextStyle
                                                        .textxsmallStyle40010
                                                        .copyWith(
                                                      fontFamily:
                                                          "PlusJakartaSans",
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          CustomSvg(
                                            image: isSelected
                                                ? AppImages
                                                    .iconRadioButtonChecked
                                                : AppImages
                                                    .iconRadioButtonUnchecked,
                                            color: color,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Text('text');
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 0.0, height: 8.h),
                            ),
                          ),
                        ],
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 24.h,
                                padding: const EdgeInsets.all(2).r,
                                child: CustomSvg(
                                  image: AppImages.iconPriceTag3,
                                  width: 15.w,
                                  height: 15.h,
                                  color: AppColors.kGray400Color,
                                ),
                              ),
                              SizedBox(width: 8.w, height: 0.0),
                              Text(
                                'Khuyến mãi',
                                style: AppTextStyle.textsmallStyle60016,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Obx(
                                () => Text(
                                  controller.textCodePromotions.toString(),
                                  style: AppTextStyle.textbodyStyle.copyWith(
                                      color: AppColors.kPurplePurpleColor),
                                ),
                              ),
                              // SizedBox(width: 10.w, height: 0.0),
                              SizedBox(width: 10.w, height: 0.0),
                              const CustomSvg(
                                image: AppImages.iconArrowright,
                                fit: BoxFit.fitHeight,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
