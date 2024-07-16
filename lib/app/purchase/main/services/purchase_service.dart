import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/purchase/main/models/purchase.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class PurchaseService {
  Future<List<Purchase>?> getPurchaseList() async {
    try {
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
