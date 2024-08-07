import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/api/models/result_response.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/get_create_vacation_response.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../../config/api-urls/end_points.dart';
import '../../../../../../config/interceptor/interceptor.dart';

class VacationsFormService {
  Future<ResultResponse?> createVacation({
    required int fKAlternativeEmployee,
    required int fKAlternativeToPayingAnyDue,
    required int fKHrVacationTypeId,
    required int fKReqStatusId,
    required String dateFrom,
    required String dateTo,
    String? description,
  }) async {
    Map<String, dynamic> data = {
      "FK_AlternativeEmployee": fKAlternativeEmployee,
      "FK_AlternativeToPayingAnyDue": fKAlternativeToPayingAnyDue,
      "FK_HrVacationTypeId": fKHrVacationTypeId,
      "FK_ReqStatusId": fKReqStatusId,
      "DateFrom": dateFrom,
      "DateTo": dateTo,
      "Description": description
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_VACATION_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return ResultResponse.fromJson(response.data);
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

  Future<GetCreateVacation?> getCreateVacations(String lang) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_CREATE_VACATION_URL(lang));
      if (response != null && response.statusCode == 200) {
        return GetCreateVacation.fromJson(response.data);
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

  Future<ResultResponse?> updateVacation({
    required int vacationId,
    required int fKAlternativeEmployee,
    required int fKAlternativeToPayingAnyDue,
    required int fKHrVacationTypeId,
    required int fKReqStatusId,
    required String dateFrom,
    required String dateTo,
    String? description,
  }) async {
    Map<String, dynamic> data = {
      "VacationId": vacationId,
      "FK_AlternativeEmployee": fKAlternativeEmployee,
      "FK_AlternativeToPayingAnyDue": fKAlternativeToPayingAnyDue,
      "FK_HrVacationTypeId": fKHrVacationTypeId,
      "FK_ReqStatusId": fKReqStatusId,
      "DateFrom": dateFrom,
      "DateTo": dateTo,
      "Description": description
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.UPDATE_VACATION_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return ResultResponse.fromJson(response.data);
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
