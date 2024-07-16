import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/login_response.dart';

class LoginService {
  Future<LoginResponse?> login({
    required String id,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "UserName": id,
      "Password": password,
      "FK_DefBranchId": 4,
    };
    try {
      Response? response =
          await AppInterceptor.dio?.post(EndPoints.LOGIN_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }
}
