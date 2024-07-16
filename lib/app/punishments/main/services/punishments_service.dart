import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/punishments/main/models/punishment_response.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/punishment_chart.dart';

class PunishmentsService {
  Future<List<PunishmentResponse>?> getPunishmentList() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_PUNISHMENTS_URL);
      if (response != null && response.statusCode == 200) {
        List<PunishmentResponse> punishmentResponseList =
            (response.data as List<dynamic>)
                .map((json) => PunishmentResponse.fromJson(json))
                .toList();
        return punishmentResponseList;
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

  Future<List<PunishmentChart>?> getPunishmentChart() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_PUNISHMENTS_CHART_URL);
      if (response != null && response.statusCode == 200) {
        List<PunishmentChart> punishmentChartList =
            (response.data as List<dynamic>)
                .map((json) => PunishmentChart.fromJson(json))
                .toList();
        return punishmentChartList;
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
