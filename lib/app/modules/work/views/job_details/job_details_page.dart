import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/modules/login/exports.dart';
import 'package:dust_buster/app/modules/work/exports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../home/exports.dart';
import '../../../widgets/custom_appbar_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../widgets/cancel_job_widget.dart';

class JobDetailsPage extends GetView<WaitingController> {
  final PendingInvoices model;
  const JobDetailsPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.orderStatuss.value = int.parse(model.orderStatus.toString());
    return Scaffold(
      backgroundColor: AppColors.kGray050Color,
      appBar: CustomAppbarWidget(
        title: Utils.getLabel(int.parse(model.label.toString())),
        onBackPress: () {
          Get.back();
        },
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(width: 0.0, height: 8.h),
          JobAcceptanceStatus(
            id: model.idPT?.toString() ?? '',
            name: model.namePT?.toString() ?? '',
            oneStar: int.tryParse(model.oneStar?.toString() ?? '0') ?? 0,
            twoStar: int.tryParse(model.twoStar?.toString() ?? '0') ?? 0,
            threeStar: int.tryParse(model.threeStar?.toString() ?? '0') ?? 0,
            fourStar: int.tryParse(model.fourStar?.toString() ?? '0') ?? 0,
            fiveStar: int.tryParse(model.fiveStar?.toString() ?? '0') ?? 0,
            image: model.imagePT?.toString() ?? '',
            controller: controller,
            phonenumberPT: model.phonenumberPT?.toString() ?? '',
            oderStatus: int.parse(model.orderStatus.toString()),
          ),
          if (model.partner![0].idP != null)
            Column(
              children: [
                SizedBox(width: 0.0, height: 8.h),
                PriorityList(
                  model: model.partner ?? [],
                  controller: controller,
                  models: model,
                ),
              ],
            ),
          SizedBox(width: 0.0, height: 8.h),
          WorkplaceInformation(model: model),
          SizedBox(width: 0.0, height: 8.h),
          JobDetailss(model: model),
          SizedBox(width: 0.0, height: 8.h),
          PaymentMethods(model: model),
          Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              children: [
                if (controller.orderStatuss == 5)
                  ButtonWidget(
                    onTap: () {
                      goPresent(isDismissibles: true, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Đánh giá',
                              style: AppTextStyle.textButtonStyle
                                  .copyWith(color: AppColors.kGray1000Color),
                            ),
                            ButtonWidget(
                              onTap: () {
                                controller.noiDungdanhgia.clear();
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
                        SizedBox(width: 0.0, height: 32.h),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0).r,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            controller.soSao.value = rating.toInt();
                          },
                        ),
                        SizedBox(width: 0.0, height: 10.h),
                        TextFieldWidget(
                          obsNhapText: false,
                          hintText: 'Nội dung đánh giá',
                          controller: controller.noiDungdanhgia,
                          onChanged: (value) {},
                        ),
                        SizedBox(width: 0.0, height: 16.h),
                        ButtonWidget(
                          onTap: () {
                            controller.postDanhgia(
                                model.idPT.toString(), model.idID.toString());
                          },
                          text: 'Gửi đánh giá',
                          boder: false.obs,
                        ),
                      ]);
                    },
                    text: 'Đánh giá',
                  ),
                if (controller.orderStatuss == 4)
                  ButtonWidget(
                    onTap: () {
                      controller.puttComplete(model);
                    },
                    text: 'Xác nhận hoàn thành',
                  ),
                if (controller.orderStatuss != 4 &&
                    controller.orderStatuss != 5 &&
                    controller.orderStatuss != 6)
                  Column(
                    children: [
                      ButtonWidget(
                        onTap: () {},
                        text: 'Thay đổi yêu cầu',
                        colorBackGroud: AppColors.white,
                        boder: true.obs,
                        textStyle: AppTextStyle.textButtonStyle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 0.0, height: 8.h),
                      ButtonWidget(
                        onTap: () {
                          controller.formatTime(model.workingDay.toString(),
                              model.workTime.toString());
                          goPresent(children: [
                            CancelJobWidget(
                              model: model,
                              controller: controller,
                            ),
                          ]);
                        },
                        text: 'Huỷ việc',
                        colorBackGroud: AppColors.kGray050Color,
                        textStyle: AppTextStyle.textButtonStyle.copyWith(
                          color: AppColors.kRrror400Color,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
