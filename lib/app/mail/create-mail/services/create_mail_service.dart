import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class CreateMailService {
  Future<bool?> sendMessage({
    required int id,
    required int fkParentId,
    required int fkHrEmployeeId,
    required String subject,
    required String description,
    required String reply,
    required List<int> assignees,
    required List<int> departmentIds,
    required String filePath,
    required int fKReqStatusId,
    required String assigneeName,
    required String byAssigneeName,
    required String jobName,
    required int fKCreatorId,
  }) async {
    Map<String, dynamic> data = {
      "Id": 1,
      "FK_ParentId": 1,
      "FK_HrEmployeeId": 1,
      "Subject": "qqqqq",
      "Description": "aaaa",
      "Reply": "aaaa",
      "Assignees": [1],
      "DepartmentsIds": [1],
      "FilePath": "hahhah",
      "FK_ReqStatusId": 1,
      "AssigneeName": "aaaa",
      "ByAssigneeName": "aaaa",
      "JobName": "aaaa",
      "FK_CreatorId": 1,
      "ParentId": 1,
      "AssigneeByImagePath": "aaaaa",
      "AssigneeImagePath": "aaaaa",
      "CreationDate": "2024-04-20",
      "LastModifiedDate": "2024-04-20",
      "IsActive": true,
      "IsDeleted": false,
      "Receiver": 2,
      "Receivers": "aaaa",
      "file": null,
      "assigneesList": [
        {
          "Id": 1,
          "FK_AssigneeId": 1,
          "FK_AssigneeById": 1,
          "FK_ReqMessageId": 1,
          "CreationDate": "2024-04-20",
          "LastModifiedDate": "2024-04-20",
          "IsActive": true,
          "IsDeleted": false
        }
      ],
      "Departments": [
        {"Value": "1", "Text": "aaaaa"}
      ],
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
