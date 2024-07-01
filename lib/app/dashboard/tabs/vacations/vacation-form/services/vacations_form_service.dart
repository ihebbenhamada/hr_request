import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:request_hr/api/models/result_response.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/get_create_vacation_response.dart';

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
      log(e.error.toString());

      log(e.response.toString());
      log(e.requestOptions.headers.toString());
      return null;
    }
  }

  Future<GetCreateVacation?> getCreateVacations() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_CREATE_VACATION_URL);
      if (response != null && response.statusCode == 200) {
        return GetCreateVacation.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
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
      return null;
    }
  }
}
