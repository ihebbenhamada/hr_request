import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../model/notification.dart';
import '../services/notifications_service.dart';

class NotificationsController extends BaseController {
  /// SERVICES
  final NotificationsService _notificationsService = NotificationsService();
  late GetStorage storage;

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> listNotifications = [
    {
      'image': AppImages.profile,
      'name': 'Dina Saber Ahmed',
      'job': 'General Manager',
      'date': '13Dec - 6:30',
      'type': 1,
    },
    {
      'name': 'Dina Saber Ahmed',
      'job': 'Project Manager',
      'date': '13Dec - 6:30',
      'type': 2,
    },
    {
      'name': 'Dina Saber Ahmed',
      'job': 'General Manager',
      'date': '13Dec - 6:30',
      'type': 3,
    },
    {
      'name': 'Dina Saber Ahmed',
      'job': 'General Manager',
      'date': '13Dec - 6:30',
      'type': 4,
    },
    {
      'name': 'Dina Saber Ahmed',
      'job': 'General Manager',
      'date': '13Dec - 6:30',
      'type': 5,
    },
    {
      'name': 'Dina Saber Ahmed',
      'job': 'General Manager',
      'date': '13Dec - 6:30',
      'type': 6,
    },
  ];
  final RxList<Notification> notificationList = <Notification>[].obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
    getNotificationList();
  }

  /// FUNCTIONS
  getNotificationList() {
    AppInterceptor.showLoader();
    _notificationsService.getNotifications().then((value) {
      if (value != null) {
        notificationList.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }
}
