import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/complaint_details_service.dart';

class ComplaintDetailsController extends BaseController {
  /// SERVICES
  final ComplaintDetailsService _complaintDetailsService =
      ComplaintDetailsService();

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
