import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/ticket/main/models/ticket_response.dart';
import 'package:request_hr/app/ticket/ticket-details/screens/ticket_details_screen.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/ticket_service.dart';

class TicketController extends BaseController {
  /// SERVICES
  final TicketService _ticketService = TicketService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxList<Ticket> allTicketsList = <Ticket>[].obs;
  RxList<Ticket> pendingTicketsList = <Ticket>[].obs;
  RxList<Ticket> approvedTicketsList = <Ticket>[].obs;
  RxList<Ticket> rejectedTicketsList = <Ticket>[].obs;
  RxList<Ticket> ticketsList = <Ticket>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getTickets();
  }

  /// FUNCTIONS
  getTickets() {
    AppInterceptor.showLoader();
    _ticketService.getTickets().then((value) {
      if (value != null) {
        allTicketsList.value = value.all;
        pendingTicketsList.value = value.pending;
        approvedTicketsList.value = value.approved;
        rejectedTicketsList.value = value.rejected;
        ticketsList.value = allTicketsList;
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        ticketsList.value = allTicketsList;
        break;
      case 1:
        ticketsList.value = pendingTicketsList;
        break;
      case 2:
        ticketsList.value = approvedTicketsList;
        break;
      case 3:
        ticketsList.value = rejectedTicketsList;
        break;
      default:
        ticketsList.value = allTicketsList;
        break;
    }
  }

  getTicketDetails({required int id}) {}

  onClickTicketItem(Ticket ticket) {
    _ticketService.getTicketDetails(id: ticket.id).then((value) {
      if (value != null) {
        Get.to(
          () => TicketDetailsScreen(),
          arguments: value,
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => TicketDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getTickets();
    }
  }
}
