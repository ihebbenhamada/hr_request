import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../services/create_mail_service.dart';

class CreateMailController extends BaseController {
  /// SERVICES
  final CreateMailService _createMailService = CreateMailService();
  late GetStorage storage;

  /// CONTROLLERS
  final TextEditingController subjectMessageTextEditingController =
      TextEditingController();
  final TextEditingController bodyMessageTextEditingController =
      TextEditingController();

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
  onClickSend() {}

  onClickBack() {
    Get.back();
  }
}
