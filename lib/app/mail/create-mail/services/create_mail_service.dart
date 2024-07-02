import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class CreateMailService {
  Future<bool?> sendMessage({
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
      "assigneesList": assigneesList
      /*{
          "Id": 1,
          "FK_AssigneeId": 1,
          "FK_AssigneeById": 1,
          "FK_ReqMessageId": 1,
          "CreationDate": "2024-04-20",
          "LastModifiedDate": "2024-04-20",
          "IsActive": true,
          "IsDeleted": false
        }*/
      ,
      "Departments": departments,
      /* {"Value": "1", "Text": "aaaaa"}*/

      "listReqMessageVMs": [
        {
          "Id": 1,
          "FK_HrEmployeeId": 1,
          "SenderName": "aaaa",
          "Subject": "aaaaa",
          "Description": "aaaaa",
          "Reply": "Aaaa",
          "FilePath": "Aaaa",
          "FK_ReqStatusId": 1,
          "FK_CreatorId": 1,
          "ParentId": 1,
          "CreationDate": "2024-04-20",
          "LastModifiedDate": "2024-04-20",
          "IsActive": true,
          "IsDeleted": false
        }
      ]
    };
    try {
      Response? response = await AppInterceptor.dio?.post(
        EndPoints.SEND_MESSAGE_URL,
        data: data,
      );
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log('+++++++++++++++');
      log(e.response!.data.toString());
      log(e.error.toString());
      log(e.requestOptions.headers.toString());
      return null;
    }
  }
}
