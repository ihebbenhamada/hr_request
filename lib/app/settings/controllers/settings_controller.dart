import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/settings_service.dart';

class SettingsController extends BaseController {
  /// SERVICES
  final SettingsService _settingsService = SettingsService();

  /// CONTROLLERS

  /// VARIABLES

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
