import 'package:dio/dio.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/get_employee_vacations_response.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class VacationsService {
  Future<EmployeeVacations?> getEmployeeVacations() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_EMPLOYEE_VACATIONS_URL);
    if (response != null && response.statusCode == 200) {
      return EmployeeVacations.fromJson(response.data);
    } else {
      return null;
    }
  }
}
