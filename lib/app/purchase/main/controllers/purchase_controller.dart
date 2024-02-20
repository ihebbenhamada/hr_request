import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/purchase/purchase-details/screens/purchase_details_screen.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/purchase_service.dart';

class PurchaseController extends BaseController {
  /// SERVICES
  final PurchaseService _purchaseService = PurchaseService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxList purchaseList = [].obs;
  final List<Map<String, dynamic>> purchaseData = [
    {
      'title': 'Request Purchase',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 2,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 0,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
      'type': 1,
      'date': '13-2-2024',
    },
    {
      'title': 'Request Purchase',
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
    purchaseList.value = purchaseData;
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        purchaseList.value = purchaseData;
        break;
      case 1:
        purchaseList.value =
            purchaseData.where((map) => map['type'] == 1).toList();
        break;
      case 2:
        purchaseList.value =
            purchaseData.where((map) => map['type'] == 0).toList();
        break;
      case 3:
        purchaseList.value =
            purchaseData.where((map) => map['type'] == 2).toList();
        break;
      default:
        purchaseList.value = purchaseData;
        break;
    }
  }

  onClickPurchaseItem() {
    Get.to(
      () => PurchaseDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  onClickCreatePurchase() {
    Get.to(
      () => PurchaseDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
