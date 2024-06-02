import 'dart:io';

import 'package:dust_buster/app/modules/widgets/custom_appbar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../../../../home/exports.dart';
import '../../../../../widgets/custom_svg.dart';
import '../../../../../widgets/text_field_widget.dart';
import '../../../../controllers/danh_gia_controller.dart';
import '../../../../controllers/waiting_controller.dart';

class DanhGiaPage extends StatelessWidget {
  final String idPT;
  final String idID;
  final WaitingController controller;
  const DanhGiaPage(
      {Key? key,
      required this.controller,
      required this.idPT,
      required this.idID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var danhGiaController = Get.put(DanhGiaController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarWidget(
        title: 'Đánh giá',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: 0,
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
                danhGiaController.soSao.value = rating.toInt();
              },
            ),
            SizedBox(width: 0.0, height: 10.h),
            Obx(
              () => Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: danhGiaController.selectedImage.value +
                      1, // Thêm một item mặc định cho nút chọn ảnh
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    if (index == danhGiaController.selectedImage.value) {
                      // Item mặc định cho nút chọn ảnh
                      return GestureDetector(
                        onTap: () {
                          danhGiaController.selectMultipleImage();
                        },
                        child: Container(
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
                      );
                    } else {
                      // Ảnh từ danh sách
                      return Stack(
                        children: [
                          Image.file(
                            File(danhGiaController.listImagePath[index]),
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 2,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                danhGiaController.removeImage(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.kGray1000Color.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: 0.0, height: 10.h),
            TextFieldWidget(
              obsNhapText: false,
              hintText: 'Nội dung đánh giá',
              controller: danhGiaController.noiDungdanhgia,
              onChanged: (value) {},
            ),
            SizedBox(width: 0.0, height: 16.h),
            ButtonWidget(
              onTap: () {
                danhGiaController
                    .postDanhgia(idPT, idID)
                    .then((value) => controller.getHistoryy());
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
