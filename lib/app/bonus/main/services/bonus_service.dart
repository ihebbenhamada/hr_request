import 'package:dio/dio.dart';
import 'package:request_hr/app/bonus/main/models/bonus_chart.dart';
import 'package:request_hr/app/bonus/main/models/bonus_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class BonusService {
  Future<List<BonusResponse>?> getBonusList() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALL_BONUS_URL("1"));
    if (response != null && response.statusCode == 200) {
      List<BonusResponse> bonusResponseList = (response.data as List<dynamic>)
          .map((json) => BonusResponse.fromJson(json))
          .toList();
      return bonusResponseList;
    } else {
      return null;
    }
  }

  Future<List<BonusChart>?> getBonusChart() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_BONUS_CHART_URL);
    if (response != null && response.statusCode == 200) {
      List<BonusChart> bonusChartList = (response.data as List<dynamic>)
          .map((json) => BonusChart.fromJson(json))
          .toList();
      return bonusChartList;
    } else {
      return null;
    }
  }
}
