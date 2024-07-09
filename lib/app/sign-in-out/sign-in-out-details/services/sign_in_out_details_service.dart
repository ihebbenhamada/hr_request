import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/sign_in_out_create.dart';

class SignInOutDetailsService {
  Future<SigninOutCreate?> getCreateSignInOut() async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_CREATE_SIGNIN_SIGNOUT_URL);
      if (response != null && response.statusCode == 200) {
        return SigninOutCreate.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "Error!",
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

  Future<bool?> createSignInOut({
    required String attendType,
    required String location,
    required String areaName,
  }) async {
    Map<String, dynamic> data = {
      "AttendType": attendType,
      "Location": location,
      "AreaName": areaName,
      "IsDeleted": false
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_SIGNIN_SIGNOUT_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "Error!",
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
