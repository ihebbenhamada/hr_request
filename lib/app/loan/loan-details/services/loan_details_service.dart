import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/create_loan.dart';

class LoanDetailsService {
  Future<CreateLoan?> getCreateLoan() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_CREATE_LOAN_URL);
    if (response != null && response.statusCode == 200) {
      CreateLoan getCreateLoanResponse = CreateLoan.fromJson(response.data);
      return getCreateLoanResponse;
    } else {
      return null;
    }
  }

  Future<bool?> createLoan({
    required int paymentType,
    required String loanDate,
    required double totalAmount,
    required String subject,
    required String description,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required bool isGeneralManager,
    required bool isFinancialDirector,
    required bool isGeneralDirector,
    required int? fKGeneralDirectorId,
    required String? generalDirector,
    required String employeeName,
    required int fKReqStatusId,
    required String paymentTypeName,
  }) async {
    Map<String, dynamic> data = {
      "PaymentType": paymentType,
      "LoanDate": loanDate,
      "TotalAmount": totalAmount,
      "Subject": subject,
      "Description": description,
      "CreationDate": creationDate,
      "LastModifiedDate": lastModifiedDate,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "IsGeneralManager": isGeneralManager,
      "IsFinancialDirector": isFinancialDirector,
      "IsGeneralDirector": isGeneralDirector,
      "FK_GeneralDirectorId": fKGeneralDirectorId,
      "GeneralDirector": generalDirector,
      "EmployeeName": employeeName,
      "FK_ReqStatusId": fKReqStatusId,
      "PaymentTypeName": paymentTypeName
    };
    Response? response =
        await AppInterceptor.dio?.post(EndPoints.CREATE_LOAN_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> updateLoan({
    required int id,
    required int paymentType,
    required String loanDate,
    required double totalAmount,
    required String subject,
    required String description,
    required String creationDate,
    required String lastModifiedDate,
    required bool isActive,
    required bool isDeleted,
    required bool isGeneralManager,
    required bool isFinancialDirector,
    required bool isGeneralDirector,
    required int fKGeneralDirectorId,
    required String generalDirector,
    required String employeeName,
    required int fKReqStatusId,
    required String paymentTypeName,
  }) async {
    Map<String, dynamic> data = {
      "id": id,
      "PaymentType": paymentType,
      "LoanDate": loanDate,
      "TotalAmount": totalAmount,
      "Subject": subject,
      "Description": description,
      "CreationDate": creationDate,
      "LastModifiedDate": lastModifiedDate,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "IsGeneralManager": isGeneralManager,
      "IsFinancialDirector": isFinancialDirector,
      "IsGeneralDirector": isGeneralDirector,
      "FK_GeneralDirectorId": fKGeneralDirectorId,
      "GeneralDirector": generalDirector,
      "EmployeeName": employeeName,
      "FK_ReqStatusId": fKReqStatusId,
      "PaymentTypeName": paymentTypeName
    };

    Response? response =
        await AppInterceptor.dio?.post(EndPoints.CREATE_LOAN_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
