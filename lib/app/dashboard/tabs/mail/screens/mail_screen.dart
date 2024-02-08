import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/mail/controllers/mail_controller.dart';

import '../../../../../config/theme/theme_controller.dart';

class MailScreen extends StatelessWidget {
  final _mailController = Get.put(MailController());
  final ThemeController themeController = Get.find();
  MailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('mail search'),
      ),
    );
  }
}
