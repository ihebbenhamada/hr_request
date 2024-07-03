import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/custody/custody-details/screens/custody_details_screen.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../models/custody.dart';
import '../services/custody_service.dart';

class CustodyController extends BaseController {
  /// SERVICES
  final CustodyService _custodyService = CustodyService();

  /// CONTROLLERS

  /// VARIABLES
  RxInt selectedFilter = 0.obs;

  RxList<Custody> allCustodyList = <Custody>[].obs;
  RxList<Custody> pendingCustodyList = <Custody>[].obs;
  RxList<Custody> approvedCustodyList = <Custody>[].obs;
  RxList<Custody> rejectedCustodyList = <Custody>[].obs;

  RxList<Custody> custodyList = <Custody>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    getCustodyList();
  }

  /// FUNCTIONS
  getCustodyList() {
    AppInterceptor.showLoader();
    _custodyService.getCustodyList().then((value) {
      if (value != null) {
        List<Custody> list = value;
        allCustodyList.value = list;
        pendingCustodyList.value =
            list.where((map) => map.fkReqStatusId == 31).toList();
        approvedCustodyList.value =
            list.where((map) => map.fkReqStatusId == 32).toList();
        rejectedCustodyList.value =
            list.where((map) => map.fkReqStatusId == 33).toList();
        custodyList.value = allCustodyList;
      }
      AppInterceptor.hideLoader();
    });
  }

  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        custodyList.value = allCustodyList;
        break;
      case 1:
        custodyList.value = pendingCustodyList;
        break;
      case 2:
        custodyList.value = approvedCustodyList;
        break;
      case 3:
        custodyList.value = rejectedCustodyList;
        break;
      default:
        custodyList.value = allCustodyList;
        break;
    }
  }

  onClickCustodyItem(Custody item) {
    Get.to(
      () => CustodyDetailsScreen(),
      transition: Transition.leftToRight,
      arguments: item,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      () => CustodyDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getCustodyList();
    }
  }
}
