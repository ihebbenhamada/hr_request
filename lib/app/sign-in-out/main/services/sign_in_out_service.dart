import 'package:dio/dio.dart';
import 'package:request_hr/app/sign-in-out/main/model/sign_in_out.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class SignInOutService {
  Future<List<SignInOut>?> getSignInOutList() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_SIGNIN_SIGNOUT_URL);
      if (response != null && response.statusCode == 200) {
        List<SignInOut> signInOutList = (response.data as List<dynamic>)
            .map((json) => SignInOut.fromJson(json))
            .toList();
        return signInOutList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
