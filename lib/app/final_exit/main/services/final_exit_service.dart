import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/api/models/result_response.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../../config/colors/colors.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';
import '../model/get_create_first_step.dart';
import '../model/get_create_second_step.dart';
import '../model/get_create_third_step.dart';

class FinalExitService {
  /// FIRST STEP
  Future<GetCreateFirstStep?> getCreateFirstStep() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_FIRST_STEP_URL);
      if (response != null && response.statusCode == 200) {
        return GetCreateFirstStep.fromJson(response.data);
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

  Future<ResultResponse?> createFinalExitApproval({
    required int? fKHrEmployeeId,
    required int? fKReqFinalExitId,
    required String? employeeName,
    required String creationDate,
    required String? quitDate,
    required String? lastWorkingDayDate,
    required bool? hasCommitment,
    required String phone,
    required String mobile,
    required String address,
    required String lastModifiedDate,
    required bool? isActive,
    required bool? isDeleted,
  }) async {
    Map<String, dynamic> data = {
      "fK_HrEmployeeId": fKHrEmployeeId,
      "fK_ReqFinalExitId": fKReqFinalExitId,
      "employeeName": employeeName,
      "creationDate": creationDate,
      "quitDate": quitDate,
      "lastWorkingDayDate": lastWorkingDayDate,
      "hasCommitment": hasCommitment,
      "phone": phone,
      "mobile": mobile,
      "address": address,
      "lastModifiedDate": lastModifiedDate,
      "isActive": isActive,
      "isDeleted": isDeleted,
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_FIRST_STEP_URL, data: data);

      if (response != null && response.statusCode == 200) {
        return ResultResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
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

  /// SECOND STEP
  Future<GetCreateSecondStep?> getCreateSecondStep(String lang) async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_SECOND_STEP_URL(lang));
      if (response != null && response.statusCode == 200) {
        return GetCreateSecondStep.fromJson(response.data);
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

  Future<ResultResponse?> createTicketExchange({
    required int id,
    required int fKHrEmployeeId,
    required String dateDue,
    required double totalDeservedAmount,
    required double? totalExtaraTicketsValue,
    required String? ticketPath,
    required String? description,
    required bool isFromRequests,
    required int? requestRefrenceId,
    required int fKCreatorId,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required String? imagePath,
    required String? employeeName,
    required int? fKDefBranchId,
    required int? fKHrManagementId,
    required int? fKHrDepartmentId,
    required String? employeeCode,
    required List<DropDownModel> hrDepartments,
    required List<DropDownModel> hrManagements,
    required List<DropDownModel> defBranches,
    required List<DropDownModel> kinshipType,
    required int? paymentTypes,
    required List<DropDownModel> paymentType,
    required List<Detail> details,
  }) async {
    Map<String, dynamic> data = {
      "id": id,
      "fK_HrEmployeeId": fKHrEmployeeId,
      "dateDue": dateDue,
      "totalDeservedAmount": totalDeservedAmount,
      "totalExtaraTicketsValue": totalExtaraTicketsValue,
      "ticketPath": ticketPath,
      "description": description,
      "isFromRequests": isFromRequests,
      "requestRefrenceId": requestRefrenceId,
      "fK_CreatorId": fKCreatorId,
      "creationDate": creationDate,
      "lastModifiedDate": lastModifiedDate,
      "isActive": isActive,
      "isDeleted": isDeleted,
      "imagePath": imagePath,
      "employeeName": employeeName,
      "fK_DefBranchId": fKDefBranchId,
      "fK_HrManagementId": fKHrManagementId,
      "fK_HrDepartmentId": fKHrDepartmentId,
      "employeeCode": employeeCode,
      "hrDepartments": List<DropDownModel>.from(hrDepartments.map((x) => x)),
      "hrManagements": List<DropDownModel>.from(hrManagements.map((x) => x)),
      "defBranches": List<DropDownModel>.from(defBranches.map((x) => x)),
      "kinshipType": List<DropDownModel>.from(kinshipType.map((x) => x)),
      "paymentTypes": paymentTypes,
      "paymentType": List<DropDownModel>.from(paymentType.map((x) => x)),
      "details": List<Detail>.from(details.map((x) => x.toJson())),
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_SECOND_STEP_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return ResultResponse.fromJson(response.data);
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

  /// THIRD STEP
  Future<GetCreateThirdStep?> getCreateThirdStep() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_THIRD_STEP_URL);
    if (response != null && response.statusCode == 200) {
      return GetCreateThirdStep.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ResultResponse?> createDisclaimer({
    required int id,
    required int fKHrEmployeeId,
    required String employeeName,
    required String departmentName,
    required String? jobName,
    required String? reason,
    required String lastWorkingDayDate,
    required int? fKReqFinalExitId,
    required int? fKRequestVacationId,
    required bool? isFinalHandOver,
    required String? fileName,
    required String? handOverCommitmentFilePath,
    required int fKHrCreatorId,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required String? reviewer,
    required DefBranchVm? defBranchVm,
  }) async {
    Map<String, dynamic> data = {
      "id": id,
      "fK_HrEmployeeId": fKHrEmployeeId,
      "employeeName": employeeName,
      "departmentName": departmentName,
      "jobName": jobName,
      "reason": reason,
      "lastWorkingDayDate": lastWorkingDayDate,
      "fK_ReqFinalExitId": fKReqFinalExitId,
      "fK_RequestVacationId": fKRequestVacationId,
      "isFinalHandOver": isFinalHandOver,
      "fileName": fileName,
      "handOverCommitmentFilePath": handOverCommitmentFilePath,
      "fK_HrCreatorId": fKHrCreatorId,
      "creationDate": creationDate,
      "lastModifiedDate": lastModifiedDate,
      "isActive": isActive,
      "isDeleted": isDeleted,
      "reviewer": reviewer,
      "defBranchVM": defBranchVm?.toJson(),
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_THIRD_STEP_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return ResultResponse.fromJson(response.data);
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
