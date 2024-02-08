import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/main/controller/dashboard-controller.dart';
import 'package:request_hr/app/dashboard/tabs/decisions/decision-details/controllers/decisions_details_controller.dart';
import 'package:request_hr/app/dashboard/tabs/home/controllers/home_controller.dart';
import 'package:request_hr/app/dashboard/tabs/mail/controllers/mail_controller.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/controllers/meetings_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/main/controllers/vacations_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/success-vacation/controllers/success_vacation_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-form/controllers/vacations_form_controller.dart';
import 'package:request_hr/app/dashboard/tabs/vacations/vacation-steps/main/controllers/vacations_steps_controller.dart';

import '../app/auth/login/controllers/login_controller.dart';
import '../app/dashboard/tabs/decisions/main/controllers/decisions_controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class DashboardPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class DecisionsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DecisionsController());
  }
}

class DecisionsDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DecisionsDetailsController());
  }
}

class MeetingsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeetingsController());
  }
}

class VacationPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VacationsController());
  }
}

class VacationsFormPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VacationsFormController());
  }
}

class VacationsStepsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VacationsStepsController());
  }
}

class SuccessVacationPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessVacationController());
  }
}

class MailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MailController());
  }
}

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
