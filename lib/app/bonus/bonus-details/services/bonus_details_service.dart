import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class BonusDetailsService {
  Future<bool?> createBonus({
    required int fKHrEmployeeId,
    required String subject,
    required String description,
    required double amount,
    required int bonusType,
    required List<int> assignees,
    required List<int> departmentsIds,
    required String creationDate,
    required int fKAssigneeId,
    required int fKHrDepartmentId,
    required List<dynamic> hrDepartments,
    required bool isActive,
    required bool isDeleted,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "Subject": subject,
      "Description": description,
      "Amount": amount,
      "BonusType": bonusType,
      "CreationDate": creationDate,
      "Assignees": assignees,
      "DepartmentsIds": departmentsIds,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "LastModifiedDate": "2024-04-15",
      "FK_AssigneeId": fKAssigneeId,
      "FK_HrDepartmentId": fKHrDepartmentId,
      "HrDepartments": hrDepartments
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
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }
}
