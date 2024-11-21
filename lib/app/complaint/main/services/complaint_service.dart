import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/complaint_response.dart';

class ComplaintService {
  Future<ComplaintResponse?> getComplaints(String lang) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_COMPLAINTS_HOME_PAGE_URL(lang));
      if (response != null && response.statusCode == 200) {
        return ComplaintResponse.fromJson(response.data);
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
