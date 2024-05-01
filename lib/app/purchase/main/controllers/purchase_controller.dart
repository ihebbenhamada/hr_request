import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/purchase/purchase-details/screens/purchase_details_screen.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../models/purchase.dart';
import '../services/purchase_service.dart';

class PurchaseController extends BaseController {
  /// SERVICES
  final PurchaseService _purchaseService = PurchaseService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;
  RxList<Purchase> purchaseList = <Purchase>[].obs;

  RxList<Purchase> allPurchaseList = <Purchase>[].obs;
  RxList<Purchase> pendingPurchaseList = <Purchase>[].obs;
  RxList<Purchase> approvedPurchaseList = <Purchase>[].obs;
  RxList<Purchase> rejectedPurchaseList = <Purchase>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getPurchaseList();
  }

  /// FUNCTIONS
  getPurchaseList() {
    AppInterceptor.showLoader();
    List<Purchase> list = [
      Purchase(
        id: 1,
        serialPrefix: "sp",
        serialNumber: 10,
        orderDate: "2024-04-12",
        fkStStatusId: 31,
        status: "pending",
        description: "description",
      ),
      Purchase(
        id: 1,
        serialPrefix: "sp",
        serialNumber: 10,
        orderDate: "2024-04-12",
        fkStStatusId: 32,
        status: "approved",
        description: "description",
      ),
    ];
    purchaseList.value = list;
    allPurchaseList.value = list;
    pendingPurchaseList.value =
        list.where((element) => element.fkStStatusId == 31).toList();
    approvedPurchaseList.value =
        list.where((element) => element.fkStStatusId == 32).toList();
    rejectedPurchaseList.value =
        list.where((element) => element.fkStStatusId == 33).toList();
    _purchaseService.getPurchaseList().then((value) {
      if (value != null) {
        purchaseList.value = value;
        allPurchaseList.value = value;
        pendingPurchaseList.value =
            value.where((element) => element.fkStStatusId == 31).toList();
        approvedPurchaseList.value =
            value.where((element) => element.fkStStatusId == 32).toList();
        rejectedPurchaseList.value =
            value.where((element) => element.fkStStatusId == 33).toList();
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        purchaseList.value = allPurchaseList;
        break;
      case 1:
        purchaseList.value = pendingPurchaseList;
        break;
      case 2:
        purchaseList.value = approvedPurchaseList;
        break;
      case 3:
        purchaseList.value = rejectedPurchaseList;
        break;
      default:
        purchaseList.value = allPurchaseList;
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
