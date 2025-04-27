import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/home/models/dash.dart';

import '../../../../../config/api-urls/end_points.dart';
import '../../../../../config/colors/colors.dart';
import '../../../../../config/interceptor/interceptor.dart';

class HomeService {
  Future<DashBoardInfo?> getDashboardInfo() async {
    try {
      String empId = GetStorage().read('employee')['id'].toString();
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.DASHBOARD_URL(empId));
      if (response != null && response.statusCode == 200) {
        DashBoardInfo dashBoardInfo = DashBoardInfo.fromJson(response.data);
        return dashBoardInfo;
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
