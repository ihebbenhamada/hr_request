import 'package:dio/dio.dart';
import 'package:request_hr/api/models/public/department.dart';
import 'package:request_hr/api/models/public/employee.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class PublicApiServices {
  Future<List<Department>?> getDepartments({String lang = "en"}) async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_DEPARTMENTS_URL + lang);
    if (response != null && response.statusCode == 200) {
      List<Department> departmentResponseList = (response.data as List<dynamic>)
          .map((json) => Department.fromJson(json))
          .toList();

      return departmentResponseList;
    } else {
      return null;
    }
  }

  Future<List<Employee>?> getEmployees({String lang = "en"}) async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_EMPLOYEES_URL + lang);
    if (response != null && response.statusCode == 200) {
      List<Employee> employeeResponseList = (response.data as List<dynamic>)
          .map((json) => Employee.fromJson(json))
          .toList();

      return employeeResponseList;
    } else {
      return null;
    }
  }

  Future<List<Employee>?> getEmployeesByDepartment(
      {required String id, String lang = "en"}) async {
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_EMPLOYEES_BY_DEPARTMENT_URL(id, lang));
    if (response != null && response.statusCode == 200) {
      List<Employee> employeeResponseList = (response.data as List<dynamic>)
          .map((json) => Employee.fromJson(json))
          .toList();

      return employeeResponseList;
    } else {
      return null;
    }
  }
}
