import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/models/drop_down.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/complaint_details_service.dart';

class ComplaintDetailsController extends BaseController {
  /// SERVICES
  final ComplaintDetailsService _complaintDetailsService =
      ComplaintDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  final List<DropDownModel> employeesList = [
    DropDownModel(disabled: false, text: 'Choose', value: '0'),
    DropDownModel(disabled: false, text: 'Mohamed Ahmed', value: '1'),
    DropDownModel(disabled: false, text: 'Iheb Ben Hamada', value: '2'),
    DropDownModel(disabled: false, text: 'Ahmed houcem', value: '3'),
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
