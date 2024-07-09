import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation_chart.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/colors/colors.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class EvaluationsService {
  /*Future<List<Evaluation>?> getEvaluations() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_EVALUATIONS_URL);
    if (response != null && response.statusCode == 200) {
      List<Evaluation> decisionResponseList = (response.data as List<dynamic>)
          .map((json) => Evaluation.fromJson(json))
          .toList();

      return decisionResponseList;
    } else {
      return null;
    }
  }*/

  Future<EvaluationResponse?> getEvaluations() async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_EVALUATED_EMPLOYEE_EVALUATIONS_URL);
      if (response != null && response.statusCode == 200) {
        return EvaluationResponse.fromJson(response.data);
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
