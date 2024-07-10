import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  Future<void> handleRefresh() async {
    getNotificationList();
  }
}
