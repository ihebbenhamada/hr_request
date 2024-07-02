import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class PunishmentsDetailsService {
  Future<bool?> createPunishment({
    required int fKHrEmployeeId,
    required String subject,
    required String description,
    required double amount,
    required int amountType,
    required String creationDate,
    required bool isDeleted,
    required bool isActive,
    required int employeeReceive,
    required List<int> assignees,
    required List<int> departmentsIds,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "Subject": subject,
      "Description": description,
      "Amount": amount,
      "AmountType": amountType,
      "CreationDate": creationDate,
      "LastModifiedDate": "2024-04-20",
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "EmoloyeeRecive": employeeReceive,
      "Assignees": assignees,
      "DepartmentsIds": departmentsIds
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_PUNISHMENTS_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
