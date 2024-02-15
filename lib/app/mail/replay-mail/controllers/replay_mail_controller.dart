import 'package:get_storage/get_storage.dart';
import 'package:request_hr/app/mail/replay-mail/services/replay_mail_service.dart';

import '../../../../../config/controllerConfig/base_controller.dart';

class ReplayMailController extends BaseController {
  /// SERVICES
  final ReplayMailService _replayMailService = ReplayMailService();
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
