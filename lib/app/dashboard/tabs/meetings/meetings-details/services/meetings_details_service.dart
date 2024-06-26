import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:request_hr/api/models/public/meeting_point.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class MeetingsDetailsService {
  Future<bool?> createMeeting({
    required String subject,
    required String meetingDate,
    required String meetingTitle,
    required int fkHrDepartmentId,
    required int fkAssigneeById,
    required String submitType,
    required List<MeetingPoint> meetingPoints,
    required List<int> assignees,
  }) async {
    Map<String, dynamic> data = {
      "subject": subject,
      "meetingDate": meetingDate,
      "meetingTitle": meetingTitle,
      "fk_HrDepartmentId": fkHrDepartmentId,
      "fk_AssigneeById": fkAssigneeById,
      "submitType": submitType,
      "meetingPoints": meetingPoints.map((map) => map.toJson()).toList(),
      "assignees ": assignees
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_MEETING_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log("e.error.toString()");
      log(e.error.toString());
      log(e.response?.data.toString() ?? "");
      return null;
    }
  }
}
