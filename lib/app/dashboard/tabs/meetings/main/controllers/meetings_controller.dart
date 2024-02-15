import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/screens/meetings_details_screen.dart';
import 'package:request_hr/config/controllerConfig/base_controller.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../services/meetings_service.dart';

class MeetingsController extends BaseController {
  /// SERVICES
  final MeetingsService _meetingsService = MeetingsService();

  /// CONTROLLERS

  /// VARIABLES
  final storage = GetStorage();
  RxInt selectedFilter = 0.obs;
  RxList meetingList = [].obs;
  late List<Map<String, dynamic>> meetingData = [
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 1,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 2,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 0,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 1,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 2,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 0,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 1,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 2,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 0,
    },
    {
      'employee_name': 'Mohamed Ahmed ismail',
      'meeting_title': 'Meeting title',
      'employee_image': AppImages.profile,
      'date': '13-2-2024',
      'type': 1,
    },
  ];

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    meetingList.value = meetingData;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  onSelectFilter(int index) {
    selectedFilter.value = index;
    switch (index) {
      case 0:
        meetingList.value = meetingData;
        break;
      case 1:
        meetingList.value =
            meetingData.where((map) => map['type'] == 0).toList();
        break;
      case 2:
        meetingList.value =
            meetingData.where((map) => map['type'] == 1).toList();
        break;
      case 3:
        meetingList.value =
            meetingData.where((map) => map['type'] == 2).toList();
        break;
      default:
        meetingList.value = meetingData;
        break;
    }
  }

  onClickMeetingItem() {
    Get.to(
      id: 4,
      () => MeetingsDetailsScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
