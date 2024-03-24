import 'package:dio/dio.dart';
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
}
