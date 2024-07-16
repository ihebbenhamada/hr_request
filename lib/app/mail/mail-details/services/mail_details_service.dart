import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class MailDetailsService {
  Future<bool?> replayMessage({
    required int fkParentId,
    required int fkHrEmployeeId,
    required String subject,
    required String description,
    required String? reply,
    required List<int> assignees,
    required List<int> departmentIds,
    required String filePath,
    required int fKReqStatusId,
    required String assigneeName,
    required String byAssigneeName,
    required String jobName,
    required int fKCreatorId,
    required int? parentId,
    required String assigneeByImagePath,
    required String assigneeImagePath,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required int receiver,
    required String receivers,
    required List<dynamic>? file,
    required List<dynamic> assigneesList,
    required List<dynamic> departments,
    required List<dynamic>? listReqMessageVMs,
  }) async {
    Map<String, dynamic> data = {
      "FK_ParentId": fkParentId,
      "FK_HrEmployeeId": fkHrEmployeeId,
      "Subject": subject,
      "Description": description,
      "Reply": reply,
      "Assignees": assignees,
      "DepartmentsIds": departmentIds,
      "FilePath": filePath,
      "FK_ReqStatusId": fKReqStatusId,
      "AssigneeName": assigneeName,
      "ByAssigneeName": byAssigneeName,
      "JobName": jobName,
      "FK_CreatorId": fKCreatorId,
      "ParentId": parentId,
      "AssigneeByImagePath": assigneeByImagePath,
      "AssigneeImagePath": assigneeImagePath,
      "CreationDate": creationDate,
      "LastModifiedDate": lastModifiedDate,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "Receiver": receiver,
      "Receivers": receivers,
      "file": file,
      "assigneesList": assigneesList,
      "Departments": departments,
      "listReqMessageVMs": listReqMessageVMs
    };
    try {
      Response? response = await AppInterceptor.dio?.post(
        EndPoints.REPLY_MESSAGE_URL,
        data: data,
      );
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('3-3-3-3-3-3-3-3--3-3-33');
      log(e.response.toString());
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
