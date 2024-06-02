import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/util/exports.dart';
import '../../../data/repository/api_helper.dart';

class DanhGiaController extends GetxController {
  final ApiHelper _apiHelper = Get.find();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<String> listImagePath = [];

  var selectedImage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var noiDungdanhgia = TextEditingController();
  var soSao = 0.obs;
  Future<void> postDanhgia(String idP, String idID) async {
    try {
      if (soSao.value == 0) {
        return Utils.showSnackbar(
            message: 'Vui lòng chọn số sao',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kRrror400Color);
      }
      if (noiDungdanhgia.text.isEmpty) {
        return Utils.showSnackbar(
            message: 'Vui lòng điền nội dung đánh giá',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kRrror400Color);
      }

      // Chuyển đổi listImagePath thành danh sách các tệp
      List<File> files = listImagePath.map((path) => File(path)).toList();

      final response = await _apiHelper.postDanhGia(
          idP: idP,
          idID: idID,
          star: soSao.value,
          note: noiDungdanhgia.text,
          files: files);
      if (response['detail'] == 0) {
        noiDungdanhgia.clear();
        Get.back();
        Get.back();
        return Utils.showSnackbar(
            message: 'Đánh giá thành công',
            icon: AppImages.iconCircleCheck,
            colors: AppColors.kSuccess600Color);
      }
    } catch (e) {
      debugPrint('Error in getPendingInvoicee: $e');
    }
  }

  void selectMultipleImage() async {
    images = await _picker.pickMultiImage();
    if (images != null) {
      // Số lượng ảnh đã chọn
      int selectedCount = listImagePath.length + images!.length;
      if (selectedCount <= 4) {
        for (XFile file in images!) {
          // Kiểm tra xem ảnh đã tồn tại trong danh sách chưa
          if (!listImagePath.any((path) => path == file.path)) {
            listImagePath.add(file.path);
          }
        }
        // Cập nhật số lượng ảnh đã chọn
        selectedImage.value = listImagePath.length;
      } else {
        // Hiển thị thông báo nếu đã chọn quá 4 ảnh
        Utils.showSnackbar(
          message: 'Chỉ được phép chọn tối đa 4 ảnh',
          icon: AppImages.iconCloseCircleFill,
          colors: AppColors.kRrror700Color,
        );
      }
    } else {
      Utils.showSnackbar(
        message: 'Lấy ảnh bị lỗi',
        icon: AppImages.iconCloseCircleFill,
        colors: AppColors.kRrror700Color,
      );
    }
  }

  void removeImage(int index) {
    // Kiểm tra xem index có hợp lệ hay không
    if (index >= 0 && index < listImagePath.length) {
      // Xóa ảnh khỏi danh sách
      listImagePath.removeAt(index);
      // Cập nhật số lượng ảnh đã chọn
      selectedImage.value = listImagePath.length;
    }
  }
}
