import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/evaluations/evaluations-steps/main/model/detail_evaluation.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../config/api-urls/end_points.dart';
import '../../../../../config/interceptor/interceptor.dart';

class EvaluationsUpdateStepsService {
  Future<bool?> updateEvaluation({
    required int id,
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
      "id": id,
      "fK_EvaluationFormId": fKEvaluationFormId,
      "fK_EvaluatedById": fKEvaluatedById,
      "evaluatedByName": evaluatedByName,
      "evaluatedByNameEn": evaluatedByNameEn,
      "submitType": submitType,
      "formName": formName,
      "formNameEn": formNameEn,
      "fK_EvaluatedEmployeeId": fKEvaluatedEmployeeId,
      "evaluatedEmployeeName": evaluatedEmployeeName,
      "evaluatedEmployeeNameEn": evaluatedEmployeeNameEn,
      "evaluationDate": evaluationDate,
      "fK_CreatorId": fKCreatorId,
      "fK_ReqStatusId": fKReqStatusId,
      "creationDate": creationDate,
      "lastModifiedDate": lastModifiedDate,
      "isActive": isActive,
      "isDeleted": isDeleted,
      "isEmployeeApprove": isEmployeeApprove,
      "employeeApproveDate": employeeApproveDate,
      "employeeNotes": employeeNotes,
      "employeeSigniture": employeeSigniture,
      "employeeName": employeeName,
      "details": detailEvaluationList.map((list) => list.toJson()).toList(),
    };

    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.UPDATE_EVALUATION_URL, data: data);
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
