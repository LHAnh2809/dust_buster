import 'package:dust_buster/app/data/models/clean_wallet_models/clean_wallet.dart';

import '../../../../../../common/util/navigator.dart';
import '../../../../../login/exports.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../work/exports.dart';
import '../../../../controllers/wallet_controller.dart';
import '../../../../exports.dart';
import '../empty/wallet_empty.dart';
import '../transaction_history/transaction_history.dart';
import '../widgets/load_authentication.dart';

class RechargePage extends StatelessWidget {
  final WalletController controller;
  final CleanWallet model;
  const RechargePage({Key? key, required this.controller, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 308.h,
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity, // Đặt chiều rộng của Container
                      height: 208.h, // Đặt chiều cao của Container
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.kDarkPurpleColor,
                            AppColors.kBrightPurpleColor,
                          ],
                          begin:
                              Alignment.bottomLeft, // Điểm bắt đầu của gradient
                          end: Alignment.topRight, // Điểm kết thúc của gradient
                        ),
                      ),
                    ),
                    SizedBox(width: double.infinity, height: 100.h),
                  ],
                ),
              ),
              Positioned(
                top: 36.w,
                left: 197.h,
                child: CustomSvg(
                  image: AppImages.iconsMoneyDollarCircleFill,
                  color: AppColors.white.withOpacity(0.1),
                  width: 221.w,
                  height: 221.h,
                ),
              ),
              Positioned(
                left: 20.w,
                top: 56.h,
                child: ButtonWidget(
                  onTap: () {
                    Get.back();
                  },
                  widget: const CustomSvg(
                    image: AppImages.iconActionLeft,
                    color: AppColors.white,
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                top: 100.h,
                child: Text(
                  'Ví 3CleanPay',
                  style: AppTextStyle.titleBodyStyle
                      .copyWith(color: AppColors.white),
                ),
              ),
              Positioned(
                left: 16.w,
                top: 156.h,
                child: Container(
                  width: 343.w,
                  height: 136.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12).r,
                    border: Border.all(color: AppColors.kGray100Color),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16).r,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 223.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ví 3CleanPay',
                                    style: AppTextStyle.textsmallStyle12
                                        .copyWith(
                                            color: AppColors.kGray500Color),
                                  ),
                                  Text(
                                      '${Utils.formatNumber(int.parse(model.moneyU.toString()))}đ',
                                      style: AppTextStyle.titleBodyStyle28),
                                ],
                              ),
                            ),
                            ButtonWidget(
                              onTap: () {
                                goPresent(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Chọn số tiền',
                                        style: AppTextStyle.textButtonStyle
                                            .copyWith(color: AppColors.black),
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
                                  SizedBox(width: 0.0, height: 24.h),
                                  Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.optionFirstDay.length,
                                        (index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                    bottom: 16)
                                                .r,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.textMoneyController
                                                    .value = TextEditingValue(
                                                  text: controller
                                                      .optionFirstDay[index],
                                                );
                                                Get.back();
                                                goPresent(
                                                  children: [
                                                    LoadAuthentication(
                                                        controller: controller)
                                                  ],
                                                );
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 343.w,
                                                height: 56.h,
                                                padding:
                                                    const EdgeInsets.all(16).r,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? AppColors.kGray1000Color
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(12)
                                                          .r,
                                                  border: Border.all(
                                                      color: AppColors
                                                          .kGray300Color),
                                                ),
                                                child: Text(
                                                  '${Utils.formatNumber(int.parse(controller.optionFirstDay[index]))}đ',
                                                  style: AppTextStyle
                                                      .lableBodyStyle
                                                      .copyWith(
                                                    color: controller
                                                                .selectedIndex
                                                                .value ==
                                                            index
                                                        ? Colors.white
                                                        : AppColors
                                                            .kGray1000Color,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      goPresent(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Nhập số tiền',
                                              style: AppTextStyle
                                                  .textButtonStyle
                                                  .copyWith(
                                                      color: AppColors
                                                          .kGray1000Color),
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
                                        SizedBox(width: 0.0, height: 24.h),
                                        Text(
                                          'Số tiền nạp vào tối thiểu là 200,000đ',
                                          style: AppTextStyle.textsmallStyle,
                                        ),
                                        SizedBox(width: 0.0, height: 16.h),
                                        TextFormWidget(
                                          controller:
                                              controller.textMoneyController,
                                          hintText:
                                              '${Utils.formatNumber(200000)}đ',
                                          textInputType: TextInputType.number,
                                          obscureText: false.obs,
                                          togglePasswordVisibility: () {},
                                          showButton: false,
                                          onChanged: (value) {},
                                        ),
                                        Obx(
                                          () => Column(
                                            children: [
                                              if (controller.isMoney.value ==
                                                  true)
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                        width: 0.0,
                                                        height: 4.h),
                                                    Text(
                                                      'Số tiền nạp không thể nhỏ hơn 200,000đ',
                                                      style: AppTextStyle
                                                          .textsmallStyle
                                                          .copyWith(
                                                              color: Colors.red,
                                                              fontSize: 12.sp),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 0.0, height: 16.h),
                                        ButtonWidget(
                                          onTap: () {
                                            if (int.parse(controller
                                                    .textMoneyController.text
                                                    .toString()) >=
                                                200000) {
                                              Get.back();
                                              goPresent(
                                                children: [
                                                  LoadAuthentication(
                                                      controller: controller)
                                                ],
                                              );
                                            } else {
                                              controller.isMoney.value = true;
                                            }
                                          },
                                          text: 'Tiếp',
                                        )
                                      ]);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 343.w,
                                      height: 56.h,
                                      padding: const EdgeInsets.all(16).r,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12).r,
                                        border: Border.all(
                                            color: AppColors.kGray300Color),
                                      ),
                                      child: Text(
                                        'Nhập số tiền',
                                        style: AppTextStyle.lableBodyStyle
                                            .copyWith(
                                          color: AppColors.kGray1000Color,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                              widget: Container(
                                alignment: Alignment.center,
                                width: 86.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kButtonColor,
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomSvg(
                                      image: AppImages.iconWallet,
                                      width: 16.w,
                                      height: 16.h,
                                      color: AppColors.white,
                                    ),
                                    Text(
                                      "Nạp tiền",
                                      style: AppTextStyle.textsmallStyle12
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.h,
                        color: AppColors.kGray100Color,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16)
                            .r,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.kDarkPurpleColor,
                                          AppColors.kBrightPurpleColor,
                                        ],
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode.srcIn,
                                    child: const CustomSvg(
                                      image: AppImages.iconWallet,
                                    ),
                                  ),
                                  SizedBox(width: 8.w, height: 0.0),
                                  Text(
                                    'Thêm Thẻ thanh toán',
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
                                    color: AppColors.kGray400Color,
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
              ),
            ],
          ),
        ),
        SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lịch Sử giao dịch',
                      style: AppTextStyle.largeBodyStyle,
                    ),
                    ButtonWidget(
                      onTap: () {
                        Get.to(() => const TransactionHistory(),
                            arguments: model);
                      },
                      widget: Container(
                        width: 40.w,
                        height: 40.h,
                        padding: const EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                          color: AppColors.kWarning050Color,
                          borderRadius: BorderRadius.circular(40).r,
                        ),
                        child: const CustomSvg(
                          image: AppImages.iconArrowright,
                          fit: BoxFit.fitHeight,
                          color: AppColors.kPurplePurpleColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (model.wallet!.isNotEmpty)
                SingleChildScrollView(
                  child: SizedBox(
                    height: 400.h,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.wallet!.length,
                      itemBuilder: (context, index) {
                        final models = model.wallet![index];
                        return Padding(
                          padding: const EdgeInsets.all(16).r,
                          child: Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 24.h,
                                padding: const EdgeInsets.all(4).r,
                                decoration: BoxDecoration(
                                  color: models.status == 0
                                      ? AppColors.kGray500Color
                                      : models.status == 1
                                          ? AppColors.kRrror600Color
                                          : AppColors.kSuccess600Color,
                                  borderRadius: BorderRadius.circular(24).r,
                                ),
                                child: CustomSvg(
                                  image: models.status == 0
                                      ? AppImages.iconMoneyDollarBox
                                      : models.status == 1
                                          ? AppImages.iconsMoneyDollarCircleFill
                                          : AppImages.iconsWalletPlusFill,
                                  fit: BoxFit.fitHeight,
                                  color: AppColors.white,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              ),
                              SizedBox(width: 8.w, height: 0.0),
                              SizedBox(
                                width: 199.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      models.note.toString(),
                                      style: AppTextStyle.textsmallStyle,
                                    ),
                                    SizedBox(width: 4.w, height: 0.0),
                                    Text(
                                      Utils.formatDateTimeString(
                                          models.date.toString()),
                                      style: AppTextStyle.textxsmallStyle
                                          .copyWith(
                                              color: AppColors.kGray500Color),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 104.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      models.status == 0 || models == 1
                                          ? '-${Utils.formatNumber(int.parse(models.moneyBF.toString()))}đ'
                                          : '+${Utils.formatNumber(int.parse(models.moneyBF.toString()))}đ',
                                      style: AppTextStyle.textbodyStyle,
                                    ),
                                    SizedBox(width: 4.w, height: 0.0),
                                    Text(
                                      models.wallet.toString(),
                                      style: AppTextStyle.textxsmallStyle
                                          .copyWith(
                                              color: AppColors.kGray500Color),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Container(
                        height: 1.h,
                        color: AppColors.kGray100Color,
                      ),
                    ),
                  ),
                ),
              if (model.wallet!.isEmpty)
                SizedBox(
                  height: 400.h,
                  child: const WalletEmpty(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
