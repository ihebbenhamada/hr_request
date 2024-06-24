import 'package:dio/dio.dart';
import 'package:request_hr/app/alert/main/models/alert_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class AlertService {
  Future<AlertResponse?> getAlertsList() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_ALERTS_URL);
      if (response != null && response.statusCode == 200) {
        AlertResponse alertResponse = AlertResponse.fromJson(response.data);
        return alertResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
