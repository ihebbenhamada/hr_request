import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/custody/custody-details/screens/custody_details_screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/custody_service.dart';

class CustodyController extends BaseController {
  /// SERVICES
  final CustodyService _custodyService = CustodyService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxList custodyList = [].obs;
  final List<Map<String, dynamic>> custodyData = [
    {
      'title': 'Request Custody',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Custody',
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
    custodyList.value = custodyData;
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        custodyList.value = custodyData;
        break;
      case 1:
        custodyList.value =
            custodyData.where((map) => map['type'] == 1).toList();
        break;
      case 2:
        custodyList.value =
            custodyData.where((map) => map['type'] == 0).toList();
        break;
      case 3:
        custodyList.value =
            custodyData.where((map) => map['type'] == 2).toList();
        break;
      default:
        custodyList.value = custodyData;
        break;
    }
  }

  onClickCustodyItem() {
    Get.to(
      () => CustodyDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickCreateCustody() {
    Get.to(
      () => CustodyDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
