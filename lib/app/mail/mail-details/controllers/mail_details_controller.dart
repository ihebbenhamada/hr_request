import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/mail/mail-details/services/mail_details_service.dart';

import '../../../../../config/controllerConfig/base_controller.dart';

class MailDetailsController extends BaseController {
  /// SERVICES
  final MailDetailsService _mailDetailsService = MailDetailsService();
  late GetStorage storage;

  /// CONTROLLERS
  final TextEditingController replaySubjectMessageTextEditingController =
      TextEditingController();
  final TextEditingController replayBodyMessageTextEditingController =
      TextEditingController();

  /// VARIABLES
  RxBool isReplay = false.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
  onClickReplay() {
    isReplay.value = true;
  }

  onClickSendReplay() {}

  onClickBack() {
    Get.back();
  }
}
