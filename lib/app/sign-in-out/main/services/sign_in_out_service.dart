import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/sign-in-out/main/model/sign_in_out.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class SignInOutService {
  Future<List<SignInOut>?> getSignInOutList() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_SIGNIN_SIGNOUT_URL);
      if (response != null && response.statusCode == 200) {
        List<SignInOut> signInOutList = (response.data as List<dynamic>)
            .map((json) => SignInOut.fromJson(json))
            .toList();
        return signInOutList;
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
