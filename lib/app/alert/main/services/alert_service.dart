import 'package:dio/dio.dart';
import 'package:request_hr/app/alert/main/models/alert_chart.dart';
import 'package:request_hr/app/alert/main/models/alert_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class AlertService {
  Future<List<AlertResponse>?> getAlertsList() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALL_ALERTS_URL);
    if (response != null && response.statusCode == 200) {
      List<AlertResponse> alertResponseList = (response.data as List<dynamic>)
          .map((json) => AlertResponse.fromJson(json))
          .toList();
      return alertResponseList;
    } else {
      return null;
    }
  }

  Future<List<AlertChart>?> getAlertsChart() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALERTS_CHART_URL);
    if (response != null && response.statusCode == 200) {
      List<AlertChart> bonusChartList = (response.data as List<dynamic>)
          .map((json) => AlertChart.fromJson(json))
          .toList();
      return bonusChartList;
    } else {
      return null;
    }
  }
}
