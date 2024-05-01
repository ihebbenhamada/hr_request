import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/custody.dart';

class CustodyService {
  Future<List<Custody>?> getCustodyList() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALL_CUSTODIES_URL);
    if (response != null && response.statusCode == 200) {
      List<Custody> bonusResponseList = (response.data as List<dynamic>)
          .map((json) => Custody.fromJson(json))
          .toList();
      return bonusResponseList;
    } else {
      return null;
    }
  }
}
