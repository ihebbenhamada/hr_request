import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class ComplaintDetailsService {
  Future<List<DropDownModel>?> getJobTypes() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_JOB_TYPES_URL);
      if (response != null && response.statusCode == 200) {
        List<DropDownModel> jobTypesList = (response.data as List<dynamic>)
            .map((json) => DropDownModel.fromJson(json))
            .toList();

        return jobTypesList;
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
      log(e.response.toString());
      return null;
    }
  }

  Future<bool?> createComplaint({
    required int fKHrEmployeeId,
    required String subject,
    required String description,
    required List<int> jobTypesIds,
  }) async {
    Map<String, dynamic> data = {
      "fK_HrEmployeeId": fKHrEmployeeId,
      "subject": subject,
      "description": description,
      "jobTypesIds": jobTypesIds,
    };

    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_COMPLAINT_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return true;
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
      log(e.response.toString());
      return null;
    }
  }
}
