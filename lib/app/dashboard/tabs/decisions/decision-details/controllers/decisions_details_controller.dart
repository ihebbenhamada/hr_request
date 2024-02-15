import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_details_service.dart';

class DecisionsDetailsController extends BaseController {
  /// SERVICES
  final DecisionsDetailsService _decisionsDetailsService =
      DecisionsDetailsService();

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
  onClickDone() {
    Get.back(id: 1);
  }

  onClickBack() {
    Get.back(id: 1);
  }
}
