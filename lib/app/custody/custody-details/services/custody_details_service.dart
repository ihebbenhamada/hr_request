import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';

class CustodyDetailsService {
  Future<List<DropDownModel>?> getPaymentTypes() async {
    try {
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
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }

  Future<bool?> createCustody({
    required int paymentType,
    required int fKHrEmployeeId,
    required String dateCustody,
    required int totalAmount,
    required int fKCbCustodyTypeId,
    required String custodyName,
    required String subject,
    required String description,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "PaymentType": paymentType,
      "DateCustody": dateCustody.substring(0, 10),
      "TotalAmount": totalAmount,
      "FK_CbCustodyTypeId": fKCbCustodyTypeId,
      "CustodyName": custodyName,
      "Subject": subject,
      "Description": description,
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_CUSTODY_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      log(e.response.toString());
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
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.UPDATE_CUSTODY_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "error".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }
}
