import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_tr;
import 'package:request_hr/app/ticket/ticket-details/models/get_create_ticket.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../dashboard/tabs/vacations/main/models/drop_down.dart';

class TicketDetailsService {
  Future<GetCreateTicketResponse?> getCreateTickets() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_CREATE_TICKET_URL);
      if (response != null && response.statusCode == 200) {
        return GetCreateTicketResponse.fromJson(response.data);
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

  Future<bool?> createTicket({
    required int? fKHrEmployeeId,
    required String dueDate,
    required String paymentType,
    required bool employeeTicket,
    required String employeeNote,
    required String employeeName,
    required String employeeBirthDate,
    required bool ticketForWife,
    required String wifeNote,
    required String wifeName,
    required String wifeBirthDate,
    required bool ticketForChild1,
    required String child1Note,
    required String child1Name,
    required String child1BirthDate,
    required bool ticketForChild2,
    required String child2Note,
    required String child2Name,
    required String child2BirthDate,
    required String creationDate,
    required String lastModifiedDate,
    required String description,
    required bool isActive,
    required bool isDeleted,
    required bool hasAirlineTicket,
    required int fKReqStatusId,
    required String status,
    required String employeeJob,
  }) async {
    Map<String, dynamic> data = {
      "FK_HrEmployeeId": fKHrEmployeeId,
      "DueDate": dueDate,
      "PaymentType": paymentType,
      "EmployeeTicket": employeeTicket,
      "EmployeeNote": employeeNote,
      "EmployeeName": employeeName,
      "EmployeeBirthDate": employeeBirthDate,
      "TicketForWife": ticketForWife,
      "WifeNote": wifeNote,
      "WifeName": wifeName,
      "WifeBirthDate": wifeBirthDate,
      "TicketForChild1": ticketForChild1,
      "Child1Note": child1Note,
      "Child1Name": child1Name,
      "Child1BirthDate": child1BirthDate,
      "TicketForChild2": ticketForChild2,
      "Child2Note": child2Note,
      "Child2Name": child2Name,
      "Child2BirthDate": child2BirthDate,
      "CreationDate": creationDate,
      "LastModifiedDate": lastModifiedDate,
      "Description": description,
      "IsActive": isActive,
      "IsDeleted": isDeleted,
      "HasAirlineTicket": hasAirlineTicket,
      "FK_ReqStatusId": fKReqStatusId,
      "Status": status,
      "EmployeeJob": employeeJob
    };
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_TICKET_URL, data: data);
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
