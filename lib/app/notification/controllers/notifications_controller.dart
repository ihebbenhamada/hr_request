import 'package:get_storage/get_storage.dart';
import 'package:request_hr/config/image_urls/image_urls.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
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

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
}
