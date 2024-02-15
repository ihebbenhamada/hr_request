import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/controllers/decisions_details_controller.dart';
import 'package:request_hr/app/dashboard/tabs/home/controllers/home_controller.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/main/controllers/meetings_controller.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/meetings-details/controllers/meetings_details_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/controllers/success_vacation_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/controllers/vacations_form_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/controllers/vacations_steps_controller.dart';
import 'package:request_hr/app/mail/create-mail/controllers/create_mail_controller.dart';
import 'package:request_hr/app/mail/mail-details/controllers/mail_details_controller.dart';
import 'package:request_hr/app/mail/main/controllers/mail_controller.dart';
import 'package:request_hr/app/mail/replay-mail/controllers/replay_mail_controller.dart';

import '../app/auth/login/controllers/login_controller.dart';
import '../app/dashboard/tabs/decisions/main/controllers/decisions_controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class DashboardPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}

class DecisionsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DecisionsController>(() => DecisionsController());
  }
}

class DecisionsDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DecisionsDetailsController>(() => DecisionsDetailsController());
  }
}

class MeetingsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingsController>(() => MeetingsController());
  }
}

class MeetingsDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingsDetailsController>(() => MeetingsDetailsController());
  }
}

class VacationPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationsController>(() => VacationsController());
  }
}

class VacationsFormPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationsFormController>(() => VacationsFormController());
  }
}

class VacationsStepsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationsStepsController>(() => VacationsStepsController());
  }
}

class SuccessVacationPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessVacationController>(() => SuccessVacationController());
  }
}

class MailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailController>(() => MailController());
  }
}

class CreateMailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMailController>(() => CreateMailController());
  }
}

class MailDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MailDetailsController>(() => MailDetailsController());
  }
}

class ReplayMailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReplayMailController>(() => ReplayMailController());
  }
}

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
