import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class BonusDetailsService {
  Future<bool?> createBonus({
    required int? id,
    required int fKHrEmployeeId,
    required String subject,
    required String description,
    required double amount,
    required int bonusType,
    required String creationDate,
    required bool isDeleted,
  }) async {
    Map<String, dynamic> data = {
      "Id": id,
      "FK_HrEmployeeId": fKHrEmployeeId,
      "Subject": subject,
      "Description": description,
      "Amount": amount,
      "BonusType": bonusType,
      "CreationDate": creationDate,
      "DepartmentsIds": [1],
      "IsDeleted": isDeleted,
      "LastModifiedDate": "2024-04-15",
      "FK_AssigneeId": 1,
      "HrDepartments": [
        {"Value": "4", "Text": "1"}
      ]
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_BONUS_URL, data: data);
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
