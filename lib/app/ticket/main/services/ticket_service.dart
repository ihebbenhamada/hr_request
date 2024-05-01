import 'package:dio/dio.dart';
import 'package:request_hr/app/ticket/main/models/ticket_response.dart';
import 'package:request_hr/app/ticket/ticket-details/models/ticket_details.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class TicketService {
  Future<TicketResponse?> getTickets() async {
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_EMPLOYEE_REQUEST_TICKETS_URL);
    if (response != null && response.statusCode == 200) {
      return TicketResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<TicketDetails?> getTicketDetails({required int id}) async {
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_TICKET_DETAILS_URL + id.toString());
    if (response != null && response.statusCode == 200) {
      return TicketDetails.fromJson(response.data);
    } else {
      return null;
    }
  }
}
