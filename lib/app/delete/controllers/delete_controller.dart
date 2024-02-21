import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/delete_service.dart';

class DeleteController extends BaseController {
  /// SERVICES
  final DeleteService _deleteService = DeleteService();

  /// CONTROLLERS

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS

  onClickDelete() {
    Get.back();
  }
}
