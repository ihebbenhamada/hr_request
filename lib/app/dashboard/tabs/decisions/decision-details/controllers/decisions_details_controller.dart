import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:request_hr/config/interceptor/interceptor.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/decisions_details_service.dart';

class DecisionsDetailsController extends BaseController {
  /// SERVICES
  final DecisionsDetailsService _decisionsDetailsService =
      DecisionsDetailsService();

  /// CONTROLLERS
  late final TextEditingController subjectTextEditingController;
  late final TextEditingController descriptionTextEditingController;

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
  void initValues() {
    subjectTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
  }

  /// FUNCTIONS
  onClickDone() {
    AppInterceptor.showLoader();
    _decisionsDetailsService
        .createDecisions(
      fKHrEmployeeId: 0,
      fKHrDepartmentId: 1,
      subject: subjectTextEditingController.value.text,
      description: descriptionTextEditingController.value.text,
    )
        .then((value) {
      if (value != null) {
        Get.back(result: 'refresh', id: 1);
      }
      AppInterceptor.hideLoader();
    });
  }

  onClickBack() {
    Get.back(id: 1);
  }
}
