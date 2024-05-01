import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';

class CustodyDetailsService {
  Future<List<DropDownModel>?> getPaymentTypes() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_TICKET_PAYMENT_TYPE_URL);
    if (response != null && response.statusCode == 200) {
      List<DropDownModel> paymentTypes = (response.data as List<dynamic>)
          .map((json) => DropDownModel.fromJson(json))
          .toList();
      return paymentTypes;
    } else {
      return null;
    }
  }

  Future<bool?> createCustody({
    required int paymentType,
    required String dateCustody,
    required int totalAmount,
    required int fKCbCustodyTypeId,
    required String custodyName,
    required String subject,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      "PaymentType ": paymentType,
      "DateCustody": dateCustody,
      "TotalAmount": totalAmount,
      "FK_CbCustodyTypeId": fKCbCustodyTypeId,
      "CustodyName": custodyName,
      "Subject": subject,
      "Description": description,
    };
    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.CREATE_CUSTODY_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> updateCustody({
    required int id,
    required int paymentType,
    required String dateCustody,
    required int totalAmount,
    required int fKCbCustodyTypeId,
    required String custodyName,
    required String subject,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      "CustodyId ": id,
      "PaymentType ": paymentType,
      "DateCustody": dateCustody,
      "TotalAmount": totalAmount,
      "FK_CbCustodyTypeId": fKCbCustodyTypeId,
      "CustodyName": custodyName,
      "Subject": subject,
      "Description": description,
    };
    Response? response = await AppInterceptor.dio
        ?.post(EndPoints.UPDATE_CUSTODY_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
