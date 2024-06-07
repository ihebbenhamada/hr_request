import 'package:dio/dio.dart';
import 'package:request_hr/app/evaluations/main/models/evaluation_chart.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
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
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_EVALUATED_EMPLOYEE_EVALUATIONS_URL);
    if (response != null && response.statusCode == 200) {
      return EvaluationResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
