import 'package:get_storage/get_storage.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../services/meetings_service.dart';

class MeetingsController extends BaseController {
  /// SERVICES
  final MeetingsService _meetingsService = MeetingsService();

  /// CONTROLLERS

  /// VARIABLES
  final storage = GetStorage();

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
}
