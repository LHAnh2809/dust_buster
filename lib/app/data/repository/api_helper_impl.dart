import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dust_buster/app/common/constants.dart';
import 'package:dust_buster/app/common/storage/storage.dart';
import 'package:dust_buster/app/common/util/extensions.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'firebase/firestire_service_get.dart';

class ApiHelperImpl implements ApiHelper {
  String? apiUrl = Storage.getValue<String>('apiUrl');

  Future<void> fetchDataFromFirestore() async {
    final FirestoreServiceGet _firestoreServiceGet = FirestoreServiceGet();
    DocumentSnapshot? snapshot = await _firestoreServiceGet.getAPI();
    if (snapshot != null && snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      String json = jsonEncode(data);
      Map<String, dynamic> jobData = jsonDecode(json);

      String viewValue = jobData['IP'];
      String apiUrll = 'http://$viewValue:8000/api/v1';
      print(apiUrll);
      await Storage.saveValue('apiUrl', apiUrll);
    } else {
      debugPrint('Tài liệu không tồn tại hoặc đã xảy ra lỗi.');
    }
  }

  String baseVietMapUrl = Constants.baseVietMapUrl;
  String apiKeyVietMap = Constants.apiKeyVietMap;
  Duration myTimeout = Constants.timeout;

  Map<String, String> getHeaders(String accessToken) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  // đăng nhâp
  @override
  Future<Map<String, dynamic>> portLogin(
      {required String email, required String password}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/login-user/';
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);
      ;

      if (response.statusCode == 200 || response.statusCode == 401) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Đăng nhập thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> referralCode({required String code}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/referral-code/';

      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "referralCode": code,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);

      if (response.statusCode == 200 || response.statusCode == 404) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Không có mã giới thiệu này');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> logout({required String accessToken}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/logout/';

      final response = await http
          .post(
            Uri.parse(url),
            headers: getHeaders(accessToken),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Đăng xuất thất bại');
      }
    });
  }

  //tạo tài khoản
  @override
  Future<Map<String, dynamic>> portCreateUsers({
    required String password,
    required String phoneNumber,
    required String email,
    required String name,
    required int sex,
    required String datebirth,
    required String referralCode,
  }) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/create-users/';
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "password": password,
            "phoneNumber": phoneNumber,
            "email": email,
            "name": name,
            "sex": sex,
            "datebirth": datebirth,
            "referralCode": referralCode,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Tạo tài khoản thất bại');
      }
    });
  }

  //yêu cầu mã otp
  @override
  Future<Map<String, dynamic>> requestOtp(
      {required String email, required String name}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/request-otp-user/';

      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": email,
            "name": name,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);
      // final jsonResponse = json.decode(response.body);
      // debugPrint("json $jsonResponse");
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Nhận mã OTP thất bại');
      }
    });
  }

  // xác thực otp
  @override
  Future<Map<String, dynamic>> verifyOtp(
      {required String email, required String otp}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/verify-otp/';

      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": email,
            "otp": otp,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);
      // final jsonResponse = json.decode(response.body);
      // debugPrint("json $jsonResponse");
      if (response.statusCode == 200 || response.statusCode == 400) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Xác minh OTP thất bại');
      }
    });
  }

  // xác thực email
  @override
  Future<Map<String, dynamic>> requestEmail({required String email}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/request-email/';

      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "email": email,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);
      // final jsonResponse = json.decode(response.body);
      // debugPrint("json $jsonResponse");
      if (response.statusCode == 200 || response.statusCode == 404) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Email không tồn tại');
      }
    });
  }

  //quên mật khẩu
  @override
  Future<Map<String, dynamic>> forgotPassword(
      {required String email, required String newPassword}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/forgot-password/';

      final response = await http.put(Uri.parse(url),
          body: jsonEncode({
            "email": email,
            "newPassword": newPassword,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Đổi mật khẩu không thành công');
      }
    });
  }

// gợi ý tìm kiếm địa chi nhanh
  @override
  Future<List<Map<String, dynamic>>> vietMapAutoComplete(
      {required String location}) async {
    final url =
        '$baseVietMapUrl/autocomplete/v3?apikey=$apiKeyVietMap&text=$location';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(
          jsonResponse); // Return a list of maps
    } else {
      throw Exception('Error fetching autocomplete data from the server');
    }
  }

// gợi ý tìm kiếm địa chi nhanh
  @override
  Future<List<Map<String, dynamic>>> getPlaceVietMap(
      {required String refId}) async {
    final url = '$baseVietMapUrl/place/v3?apikey=$apiKeyVietMap&refid=$refId';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return [jsonResponse];
    } else {
      throw Exception('Lỗi tìm nạp dữ liệu tự động hoàn thành từ máy chủ');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getReverseVietMap(
      {required String lat, required String lng}) async {
    final url =
        '$baseVietMapUrl/reverse/v3?apikey=$apiKeyVietMap&lng=$lng&lat=$lat';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonResponse);
    } else {
      throw Exception('Lỗi tìm nạp dữ liệu tự động hoàn thành từ máy chủ');
    }
  }

//xác minh đăng nhập
  @override
  Future<Map<String, dynamic>> postVerifyToken({required String token}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/verify-token/';

      final response = await http
          .post(
            Uri.parse(url),
            headers: getHeaders(token),
          )
          .timeout(myTimeout);
      if (response.statusCode == 200 || response.statusCode == 401) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Email không tồn tại');
      }
    });
  }

  //tạo tạo dữ liệu
  @override
  Future<Map<String, dynamic>> postCreateLocation(
      {required String location,
      required String location2,
      required String lat,
      required String lng}) async {
    return await ApiErrorHandler.handleError(() async {
      String? accessToken = Storage.getValue<String>('access_token');
      final url = '$apiUrl/create-location/';
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({
              "location": location,
              "location2": location2,
              "lat": lat,
              "lng": lng,
            }),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Tạo Địa chỉ thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getLocation() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-location/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Lấy thông tin thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> delLocation(
      {required String id, required int defaultt}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/delete-location/';

      final response = await http.delete(Uri.parse(url),
          body: jsonEncode({
            "id": id,
            "defaultt": defaultt,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);

      if (response.statusCode == 200 || response.statusCode == 400) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Xóa địa chỉ thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> putLocation(
      {required String id, required String idUsers}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/update-location/';

      final response = await http.put(Uri.parse(url),
          body: jsonEncode({
            "id": id,
            "id_users": idUsers,
          }),
          headers: {
            'Content-Type': 'application/json',
          }).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getHomePage() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/select-data-home/';

      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> postCustomerPromotions(
      {required String id}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/create-customer-promotions/';

      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({"id": id}),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Thêm khuyến mãi thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> postCheckPromotions({required String id}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/check-customer-promotions/';

      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({"id": id}),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Kiểm tra khuyến mãi thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getServiceDuration() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/admin/select-service-duration/';

      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getUsers() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-user/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getCustomerPromotions() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-customer-promotions/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getPendingInvoice() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-pending-invoice/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> postCreateInvoice(
      {required String idP,
      required int label,
      required String nameUser,
      required String phoneNumber,
      required String location,
      required String location2,
      required String lat,
      required String lng,
      required String repeat,
      required String petNote,
      required String employeeNote,
      required String workingDay,
      required String workTime,
      required String roomArea,
      required String note,
      required int price,
      required int gPoints,
      required int paymentMethods,
      required int premiumService,
      required int repeatState}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/create-invoice/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({
              "idP": idP,
              "label": label,
              "nameUser": nameUser,
              "phoneNumber": phoneNumber,
              "location": location,
              "location2": location2,
              "lat": lat,
              "lng": lng,
              "repeat": repeat,
              "petNote": petNote,
              "employeeNote": employeeNote,
              "workingDay": workingDay,
              "workTime": workTime,
              "roomArea": roomArea,
              "note": note,
              "price": price,
              "gPoints": gPoints,
              "paymentMethods": paymentMethods,
              "premium_service": premiumService,
              "repeat_state": repeatState
            }),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getNotificationCalendar() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-calendar/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getJobDetails({required String id}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-job-details/?id=$id';
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json'
        }, // Có thể bỏ header nếu không cần
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> putNotification({required String id}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/put-notification/?id=$id';
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> get3cleanWallet() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-3clean-wallet/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> postWallet(
      {required int price,
      required int money,
      required String note,
      required String wallet,
      required int status}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/post-recharge/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({
              "price": price,
              "money": money,
              "note": note,
              "wallet": wallet,
              "status": status,
            }),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> putAcceptJob(
      {required String idParther, required String idInvoiceDetails}) async {
    return await ApiErrorHandler.handleError(() async {
      final url =
          '$apiUrl/put-accept-job/?idParther=$idParther&idInvoiceDetails=$idInvoiceDetails';
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getPartnerInformation(
      {required String id}) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-partner-information/?id=$id';
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> putCancelJob({
    required int orderStatus,
    required int Stt,
    required int price,
    required String idInvoiceDetails,
  }) async {
    return await ApiErrorHandler.handleError(() async {
      final url =
          '$apiUrl/put-cancel-job/?order_status=$orderStatus&stt=$Stt&price=$price&idInvoiceDetails=$idInvoiceDetails';
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> putComplete({
    required String id,
    required int money,
    required String note,
    required String wallet,
    required int status,
    required String idP,
  }) async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/put-complete/';
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode({
          "money": money,
          "note": note,
          "wallet": wallet,
          "status": status,
          "id": id,
          "idP": idP,
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> getHistory() async {
    return await ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/get-history/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .get(
            Uri.parse(url),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Sửa địa chỉ mặc định thất bại');
      }
    });
  }

  @override
  Future<Map<String, dynamic>> postDanhGia(
      {required String idP,
      required String idID,
      required int star,
      required String note}) {
    return ApiErrorHandler.handleError(() async {
      final url = '$apiUrl/post-danhgia/';
      String? accessToken = Storage.getValue<String>('access_token');
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode({
              "idP": idP,
              "idID": idID,
              "sao": star,
              "note": note,
            }),
            headers: getHeaders(accessToken!),
          )
          .timeout(myTimeout);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Đánh giá thất bại');
      }
    });
  }
}
