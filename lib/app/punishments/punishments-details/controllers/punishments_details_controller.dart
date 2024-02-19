import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/punishments_details_service.dart';

class PunishmentsDetailsController extends BaseController {
  /// SERVICES
  final PunishmentsDetailsService _punishmentsDetailsService =
      PunishmentsDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  final List<String> employeesList = [
    'Mohamed Ahmed',
    'Iheb Ben Hamada',
    'Mohamed malki',
    'Mohamed ayed'
  ];
  RxString selectedEmployee = 'Mohamed Ahmed'.obs;

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
  onSelectEmployee(String value) {
    selectedEmployee.value = value;
  }
}
