import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class AlertDetailsService {
  Future<bool?> createAlert({
    required int fKHrEmployeeId,
    required int fKAssigneeId,
    required int fKHrDepartmentId,
    required String subject,
    required String description,
    required String creationDate,
    required String lastModifiedDate,
    required bool isDeleted,
    required bool isActive,
    required List<int> assignees,
    required List<int> departmentsIds,
    required List<Map<String, dynamic>> hrDepartments,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "FK_AssigneeId": fKAssigneeId,
      "FK_HrDepartmentId": fKHrDepartmentId,
      "Subject": subject,
      "Description": description,
      "CreationDate": creationDate,
      "DepartmentsIds": departmentsIds,
      "IsDeleted": isDeleted,
      "IsActive": isActive,
      "assignees": assignees,
      "LastModifiedDate": lastModifiedDate,
      "HrDepartments": hrDepartments
    };

    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_ALERTS_URL, data: data);
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

  Future<bool?> updateAlert({
    required int id,
    required int fKHrEmployeeId,
    required int fKAssigneeId,
    required int fKHrDepartmentId,
    required String subject,
    required String description,
    required String creationDate,
    required String lastModifiedDate,
    required bool isDeleted,
    required bool isActive,
    required List<int> assignees,
    required List<int> departmentsIds,
    required List<Map<String, dynamic>> hrDepartments,
  }) async {
    Map<String, dynamic> data = {
      "Id": id,
      "FK_HrEmployeeId": fKHrEmployeeId,
      "FK_AssigneeId": fKAssigneeId,
      "FK_HrDepartmentId": fKHrDepartmentId,
      "Subject": subject,
      "Description": description,
      "CreationDate": creationDate,
      "DepartmentsIds": departmentsIds,
      "IsDeleted": isDeleted,
      "IsActive": isActive,
      "assignees": assignees,
      "LastModifiedDate": lastModifiedDate,
      "HrDepartments": hrDepartments
    };

    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_ALERTS_URL, data: data);
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
