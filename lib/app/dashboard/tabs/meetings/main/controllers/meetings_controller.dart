import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/model/meeting_response.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/screens/meetings_details_screen.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../services/meetings_service.dart';

class MeetingsController extends BaseController {
  /// SERVICES
  final MeetingsService _meetingsService = MeetingsService();

  /// CONTROLLERS

  /// VARIABLES
  final storage = GetStorage();
  RxInt selectedFilter = 0.obs;
  RxList<MeetingResponse> meetingList = <MeetingResponse>[].obs;
  RxList<MeetingResponse> filteredMeetingList = <MeetingResponse>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  getListMeetings() {
    AppInterceptor.showLoader();
    _meetingsService.getAllMeetings().then((value) {
      if (value != null) {
        meetingList.value = value.obs;
        filteredMeetingList.value = value.obs;
      }
      AppInterceptor.hideLoader();
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
    filteredMeetingList.refresh();
    switch (index) {
      case 0:
        filteredMeetingList.value = meetingList;
        break;
      case 1:
        filteredMeetingList.value =
            meetingList.where((map) => map.isActive == true).toList();
        break;
      case 2:
        filteredMeetingList.value =
            meetingList.where((map) => map.isActive == false).toList();
        break;
      case 3:
        filteredMeetingList.value =
            meetingList.where((map) => map.isActive == true).toList();
        break;
      default:
        filteredMeetingList.value = meetingList;
        break;
    }
  }

  onClickMeetingItem(MeetingResponse meetingItem) {
    Get.to(
      id: 4,
      () => MeetingsDetailsScreen(meetingItem: meetingItem),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
