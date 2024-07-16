import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/bonus/main/models/bonus_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class BonusService {
  Future<BonusResponse?> getBonus() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_BONUS_URL);
      if (response != null && response.statusCode == 200) {
        BonusResponse bonusResponse = BonusResponse.fromJson(response.data);
        return bonusResponse;
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
