import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/bonus_details_service.dart';

class BonusDetailsController extends BaseController {
  /// SERVICES
  final BonusDetailsService _bonusDetailsService = BonusDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  final List<DropDownModel> employeesList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Mohamed Ahmed', value: '1'),
    DropDownModel(disabled: false, text: 'Iheb Ben Hamada', value: '2'),
    DropDownModel(disabled: false, text: 'Mohamed malki', value: '3'),
    DropDownModel(disabled: false, text: 'Mohamed ayed', value: '4'),
  ];

  late Rx<DropDownModel> selectedEmployee;

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
  void initValues() {
    selectedEmployee = employeesList[0].obs;
  }

  /// FUNCTIONS
  onSelectEmployee(DropDownModel value) {
    selectedEmployee.value = value;
  }
}
