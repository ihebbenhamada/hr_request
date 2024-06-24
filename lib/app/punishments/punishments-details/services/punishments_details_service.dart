import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class PunishmentsDetailsService {
  Future<bool?> createPunishment({
    required int? id,
    required int fKHrEmployeeId,
    required String subject,
    required String description,
    required double amount,
    required int amountType,
    required String creationDate,
    required bool isDeleted,
    required int employeeReceive,
    required List<int> assignees,
    required List<int> departmentsIds,
  }) async {
    Map<String, dynamic> data = {
      "Id": id,
      "FK_HrEmployeeId": fKHrEmployeeId,
      "Subject": subject,
      "Description": description,
      "Amount": amount,
      "AmountType": amountType,
      "CreationDate": creationDate,
      "LastModifiedDate": "2024-04-20",
      "IsActive": true,
      "IsDeleted": false,
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
