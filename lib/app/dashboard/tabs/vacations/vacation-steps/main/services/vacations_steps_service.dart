import 'package:dio/dio.dart';
import 'package:request_hr/api/models/result_response.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../model/get_create_first_step.dart';

class VacationsStepsService {
  Future<GetCreateFirstStep?> getCreateFirstStep(String employeeId) async {
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_CREATE_FIRST_STEP_URL + employeeId);
    if (response != null && response.statusCode == 200) {
      return GetCreateFirstStep.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ResultResponse?> createFinalExitApproval({
    int? id,
    int? fKHrEmployeeId,
    int? fKReqFinalExitId,
    String? employeeName,
    required String creationDate,
    String? quitDate,
    String? lastWorkingDayDate,
    bool? hasCommitment,
    required String phone,
    required String mobile,
    required String address,
    required String lastModifiedDate,
    bool? isActive,
    bool? isDeleted,
  }) async {
    Map<String, dynamic> data = {
      "id": id,
      "fK_HrEmployeeId": fKHrEmployeeId,
      "fK_ReqFinalExitId": fKReqFinalExitId,
      "employeeName": employeeName,
      "creationDate": creationDate,
      "quitDate": quitDate,
      "lastWorkingDayDate": lastWorkingDayDate,
      "hasCommitment": hasCommitment,
      "phone": phone,
      "mobile": mobile,
      "address": address,
      "lastModifiedDate": lastModifiedDate,
      "isActive": isActive,
      "isDeleted": isDeleted,
    };

    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_FIRST_STEP_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return ResultResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
