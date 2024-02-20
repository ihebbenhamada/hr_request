import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/ticket/ticket-details/screens/ticket_details_screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/ticket_service.dart';

class TicketController extends BaseController {
  /// SERVICES
  final TicketService _ticketService = TicketService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxList ticketList = [].obs;
  final List<Map<String, dynamic>> ticketData = [
    {
      'title': 'Request Ticked',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Ticked',
      'type': 2,
      'date': '13-2-2024',
    },
  ];

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    ticketList.value = ticketData;
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        ticketList.value = ticketData;
        break;
      case 1:
        ticketList.value = ticketData.where((map) => map['type'] == 1).toList();
        break;
      case 2:
        ticketList.value = ticketData.where((map) => map['type'] == 0).toList();
        break;
      case 3:
        ticketList.value = ticketData.where((map) => map['type'] == 2).toList();
        break;
      default:
        ticketList.value = ticketData;
        break;
    }
  }

  onClickTicketItem() {
    Get.to(
      () => TicketDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickCreateTicket() {
    Get.to(
      () => TicketDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
