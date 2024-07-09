import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:request_hr/app/ticket/main/models/ticket_response.dart';
import 'package:request_hr/app/ticket/ticket-details/models/ticket_details.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class TicketService {
  Future<TicketResponse?> getTickets() async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_EMPLOYEE_REQUEST_TICKETS_URL);
      if (response != null && response.statusCode == 200) {
        return TicketResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "Error!",
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

  Future<TicketDetails?> getTicketDetails({required int id}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_TICKET_DETAILS_URL + id.toString());
      if (response != null && response.statusCode == 200) {
        return TicketDetails.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Fluttertoast.showToast(
        msg: "Error!",
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
