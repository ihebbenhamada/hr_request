import 'package:dio/dio.dart';
import 'package:request_hr/app/purchase/main/models/purchase.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class PurchaseService {
  Future<List<Purchase>?> getPurchaseList() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALL_PURCHASE_ORDER_URL);
    if (response != null && response.statusCode == 200) {
      List<Purchase> purchaseList = (response.data as List<dynamic>)
          .map((json) => Purchase.fromJson(json))
          .toList();
      return purchaseList;
    } else {
      return null;
    }
  }
}
