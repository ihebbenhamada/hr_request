import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/login_response.dart';

class LoginService {
  Future<LoginResponse?> login({
    required String id,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "UserName": id,
      "Password": password,
      "FK_DefBranchId": 4,
    };
    Response? response =
        await AppInterceptor.dio?.post(EndPoints.LOGIN_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
