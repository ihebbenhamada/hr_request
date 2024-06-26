import 'package:dio/dio.dart';
import 'package:request_hr/app/loan/main/models/loan_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../loan-details/models/create_loan.dart';

class LoanService {
  Future<LoanResponse?> getEmpLoans() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_EMP_LOANS_URL);
      if (response != null && response.statusCode == 200) {
        LoanResponse empLoanResponse = LoanResponse.fromJson(response.data);
        return empLoanResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }

  Future<CreateLoan?> getUpdateLoan({required int loanId}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_UPDATE_LOAN_URL(loanId.toString()));
      if (response != null && response.statusCode == 200) {
        CreateLoan empLoanResponse = CreateLoan.fromJson(response.data);

        return empLoanResponse;
      } else {
        return null;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
