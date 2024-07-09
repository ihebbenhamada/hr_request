import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../model/get_decisions_response.dart';

class DecisionsService {
  Future<List<DecisionsResponse>?> getDecisions() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_DECISIONS_URL);
      if (response != null && response.statusCode == 200) {
        List<DecisionsResponse> decisionResponseList =
            (response.data as List<dynamic>)
                .map((json) => DecisionsResponse.fromJson(json))
                .toList();

        return decisionResponseList;
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
