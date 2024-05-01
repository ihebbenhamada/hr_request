import 'package:dio/dio.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class DecisionsDetailsService {
  Future<bool?> createDecisions({
    required int fKHrEmployeeId,
    required int fKHrDepartmentId,
    required String subject,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "FK_HrDepartmentId": fKHrDepartmentId,
      "subject": subject,
      "description": description
    };
    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_DECISIONS_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
