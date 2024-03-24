import 'package:dio/dio.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/get_create_vacation_response.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/models/create_vacation_response.dart';

import '../../../../../../config/api-urls/end_points.dart';
import '../../../../../../config/interceptor/interceptor.dart';

class VacationsFormService {
  Future<CreateVacation?> createVacation({
    required int fKHrEmployeeId,
    required int fKAlternativeEmployee,
    required int fKAlternativeToPayingAnyDue,
    required int fKHrVacationTypeId,
    required int fKReqStatusId,
    required DateTime dateFrom,
    required DateTime dateTo,
    String? description,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "FK_AlternativeEmployee": fKAlternativeEmployee,
      "FK_AlternativeToPayingAnyDue": fKAlternativeToPayingAnyDue,
      "FK_HrVacationTypeId": fKHrVacationTypeId,
      "FK_ReqStatusId ": fKReqStatusId,
      "DateFrom": dateFrom,
      "DateTo": dateTo,
      "Description": description,
    };
    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_VACATION_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return CreateVacation.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<GetCreateVacation?> getCreateVacations() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_CREATE_VACATION_URL);
    if (response != null && response.statusCode == 200) {
      return GetCreateVacation.fromJson(response.data);
    } else {
      return null;
    }
  }
}
