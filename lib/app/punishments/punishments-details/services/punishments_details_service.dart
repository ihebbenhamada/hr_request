import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/config/colors/colors.dart';

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
