import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/dashboard/tabs/mail/services/mail_service.dart';

import '../../../../../config/controllerConfig/base_controller.dart';

class MailController extends BaseController {
  /// SERVICES
  final MailService _mailService = MailService();
  late GetStorage storage;

  /// CONTROLLERS

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
  }

  /// FUNCTIONS
}
