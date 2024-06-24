import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/model/meeting_response.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/screens/meetings_details_screen.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../main/controller/dashboard-controller.dart';
import '../services/meetings_service.dart';

class MeetingsController extends BaseController {
  /// SERVICES
  final MeetingsService _meetingsService = MeetingsService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

  /// VARIABLES
  final storage = GetStorage();
  RxInt selectedFilter = 0.obs;

  RxList<MeetingResponse> meetingList = <MeetingResponse>[].obs;
  RxList<MeetingResponse> allMeetingList = <MeetingResponse>[].obs;
  RxList<MeetingResponse> pendingMeetingList = <MeetingResponse>[].obs;
  RxList<MeetingResponse> approvedMeetingList = <MeetingResponse>[].obs;
  RxList<MeetingResponse> rejectedMeetingList = <MeetingResponse>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  getListMeetings() {
    _meetingsService.getAllMeetings().then((value) {
      if (value != null) {
        allMeetingList.value = value;
        pendingMeetingList.value =
            value.where((map) => map.fkReqStatusId == 35).toList();
        approvedMeetingList.value =
            value.where((map) => map.fkReqStatusId == 36).toList();
        rejectedMeetingList.value =
            value.where((map) => map.fkReqStatusId == 37).toList();
        meetingList.value = allMeetingList;
      }
      _dashboardController.isMeetingLoading.value = false;
      if (_dashboardController.isDecisionLoading.isFalse &&
          _dashboardController.isVacationLoading.isFalse) {
        AppInterceptor.hideLoader();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    getListMeetings();
  }

  void navigateAndRefresh() async {
    final result = await Get.to(
      id: 4,
      () => const MeetingsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    if (result != null) {
      getListMeetings();
    }
  }

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        meetingList.value = allMeetingList;
        break;
      case 1:
        meetingList.value = pendingMeetingList;
        break;
      case 2:
        meetingList.value = approvedMeetingList;
        break;
      case 3:
        meetingList.value = rejectedMeetingList;
        break;
      default:
        meetingList.value = allMeetingList;
        break;
    }
  }

  onClickMeetingItem(MeetingResponse meetingItem) {
    AppInterceptor.showLoader();
    _meetingsService.getMeetingById(id: meetingItem.id).then((value) {
      AppInterceptor.hideLoader();
      if (value != null) {
        Get.to(
          id: 4,
          () => MeetingsDetailsScreen(meetingItem: value),
          transition: Transition.leftToRight,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  Future<void> handleRefresh() async {
    AppInterceptor.showLoader();
    selectedFilter.value = 0;
    getListMeetings();
  }
}
