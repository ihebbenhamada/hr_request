import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/sign_in_out_create.dart';

class SignInOutDetailsService {
  Future<SigninOutCreate?> getCreateSignInOut() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_CREATE_SIGNIN_SIGNOUT_URL);
    if (response != null && response.statusCode == 200) {
      return SigninOutCreate.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<bool?> createSignInOut({
    required String attendType,
    required String location,
    required String areaName,
  }) async {
    Map<String, dynamic> data = {
      "AttendType": attendType,
      "Location": location,
      "AreaName": areaName,
      "IsDeleted": false
    };
    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_SIGNIN_SIGNOUT_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
