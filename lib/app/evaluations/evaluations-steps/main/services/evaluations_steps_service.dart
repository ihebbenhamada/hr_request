import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';
import 'package:request_hr/app/evaluations/evaluations-steps/main/model/detail_evaluation.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../config/api-urls/end_points.dart';
import '../../../../../config/interceptor/interceptor.dart';
import '../../../main/models/evaluation_form.dart';

class EvaluationsStepsService {
  Future<List<DropDownModel>?> getFormTypes() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_EVALUATION_FORM_TYPE_URL);
      if (response != null && response.statusCode == 200) {
        List<DropDownModel> list = (response.data as List<dynamic>)
            .map((json) => DropDownModel.fromJson(json))
            .toList();

        return list;
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

  Future<EvaluationForm?> getFormData(String fileId) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_CREATE_EVALUATION_URL(fileId));
      if (response != null && response.statusCode == 200) {
        return EvaluationForm.fromJson(response.data);
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

  Future<EvaluationForm?> getUpdateEvaluation(
      String? fileId, String empId, String fkHrEmpEvalId) async {
    try {
      Response? response = await AppInterceptor.dio?.get(
          EndPoints.GET_UPDATE_EVALUATION_URL(fileId, empId, fkHrEmpEvalId));
      if (response != null && response.statusCode == 200) {
        return EvaluationForm.fromJson(response.data);
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

  Future<bool?> createEvaluation({
    required int fKEvaluationFormId,
    required int fKEvaluatedById,
    required String evaluatedByName,
    required String evaluatedByNameEn,
    required String submitType,
    required String formName,
    required String formNameEn,
    required int fKEvaluatedEmployeeId,
    required String evaluatedEmployeeName,
    required String evaluatedEmployeeNameEn,
    required String evaluationDate,
    required int fKCreatorId,
    required int fKReqStatusId,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required bool isEmployeeApprove,
    required String employeeApproveDate,
    required String employeeNotes,
    required String employeeSigniture,
    required String employeeName,
    required List<DetailEvaluation> detailEvaluationList,
  }) async {
    Map<String, dynamic> data = {
      "FK_EvaluationFormId": fKEvaluationFormId,
      "FK_EvaluatedById": fKEvaluatedById,
      "EvaluatedByName": evaluatedByName,
      "EvaluatedByNameEn": evaluatedByNameEn,
      "SubmitType": submitType,
      "FormName": formName,
      "FormNameEn": formNameEn,
      "FK_EvaluatedEmployeeId": fKEvaluatedEmployeeId,
      "EvaluatedEmployeeName": evaluatedEmployeeName,
      "EvaluatedEmployeeNameEn": evaluatedEmployeeNameEn,
      "EvaluationDate": evaluationDate,
      "FK_CreatorId": fKCreatorId,
      "FK_ReqStatusId": fKReqStatusId,
      "CreationDate": creationDate,
      "LastModifiedDate": lastModifiedDate,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "IsEmployeeApprove": isEmployeeApprove,
      "EmployeeApproveDate": employeeApproveDate,
      "EmployeeNotes": employeeNotes,
      "EmployeeSigniture": employeeSigniture,
      "EmployeeName": employeeName,
      "details": detailEvaluationList.map((list) => list.toJson()).toList(),
    };

    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_EVALUATION_URL, data: data);
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
      log(e.response.toString());
      return null;
    }
  }
}
