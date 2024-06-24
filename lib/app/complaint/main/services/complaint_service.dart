import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/complaint_response.dart';

class ComplaintService {
  Future<ComplaintResponse?> getComplaints() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_COMPLAINTS_HOME_PAGE_URL);
      if (response != null && response.statusCode == 200) {
        return ComplaintResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
