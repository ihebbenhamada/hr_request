import 'package:dio/dio.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/model/meeting_response.dart';
import 'package:request_hr/config/api-urls/end_points.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

class MeetingsService {
  Future<List<MeetingResponse>?> getAllMeetings() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_MEETINGS_URL);
      if (response != null && response.statusCode == 200) {
        List<MeetingResponse> meetingResponseList =
            (response.data as List<dynamic>)
                .map((json) => MeetingResponse.fromJson(json))
                .toList();

        return meetingResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<MeetingResponse?> getMeetingById({required int id}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_MEETING_BY_ID_URL(id.toString()));
      if (response != null && response.statusCode == 200) {
        MeetingResponse meetingItem = MeetingResponse.fromJson(response.data);
        return meetingItem;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<MeetingResponse>?> getMeetingByStatus(
      {required int status}) async {
    try {
      Response? response = await AppInterceptor.dio?.get(
        EndPoints.GET_MEETING_BY_STATUS_URL + status.toString(),
      );
      if (response != null && response.statusCode == 200) {
        List<MeetingResponse> meetingResponseList =
            (response.data as List<dynamic>)
                .map((json) => MeetingResponse.fromJson(json))
                .toList();

        return meetingResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<MeetingResponse>?> getIncomingMeetings() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_INCOMING_MEETINGS_URL);
      if (response != null && response.statusCode == 200) {
        List<MeetingResponse> meetingResponseList =
            (response.data as List<dynamic>)
                .map((json) => MeetingResponse.fromJson(json))
                .toList();

        return meetingResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<List<MeetingResponse>?> getIncomingMeetingById(
      {required int id}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_INCOMING_MEETING_BY_ID_URL + id.toString());
      if (response != null && response.statusCode == 200) {
        List<MeetingResponse> meetingResponseList =
            (response.data as List<dynamic>)
                .map((json) => MeetingResponse.fromJson(json))
                .toList();

        return meetingResponseList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<bool?> approveMeeting({
    required int id,
  }) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.APPROVE_MEETING_URL + id.toString());
      if (response != null && response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<bool?> apologyMeeting({
    required int id,
    required String reason,
  }) async {
    try {
      Response? response = await AppInterceptor.dio?.post(
          EndPoints.APOLOGY_MEETING_URL(id.toString(), reason) + id.toString());
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
