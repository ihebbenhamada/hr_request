import 'package:dio/dio.dart';
import 'package:request_hr/app/loan/main/models/loan_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class LoanService {
  Future<LoanResponse?> getEmpLoans() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_EMP_LOANS_URL);
    if (response != null && response.statusCode == 200) {
      LoanResponse empLoanResponse = LoanResponse.fromJson(response.data);

      return empLoanResponse;
    } else {
      return null;
    }
  }
}
