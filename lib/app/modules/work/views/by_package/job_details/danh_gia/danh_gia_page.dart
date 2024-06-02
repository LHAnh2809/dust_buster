import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../../../../home/exports.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../widgets/text_field_widget.dart';
import '../../../../controllers/waiting_controller.dart';

class DanhGiaPage extends StatelessWidget {
  final PendingInvoices model;
  final WaitingController controller;
  const DanhGiaPage({Key? key, required this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        title: 'Đánh giá',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0).r,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                controller.soSao.value = rating.toInt();
              },
            ),
            SizedBox(width: 0.0, height: 10.h),
            ButtonWidget(
              onTap: () {},
              widget: Container(
                width: 100.w,
                height: 100.h,
                padding: const EdgeInsets.all(30.0).r,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.kGray1000Color,
                    width: 1.w,
                  ),
                ),
                child: CustomSvg(
                  image: AppImages.iconsCamera,
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.kGray1000Color,
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
