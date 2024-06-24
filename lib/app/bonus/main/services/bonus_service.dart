import 'package:dio/dio.dart';
import 'package:request_hr/app/bonus/main/models/bonus_response.dart';

import '../../../../config/api-urls/end_points.dart';
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
      return null;
    }
  }
}
