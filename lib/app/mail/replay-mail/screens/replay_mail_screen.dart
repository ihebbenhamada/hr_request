import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/mail/replay-mail/controllers/replay_mail_controller.dart';
import 'package:request_hr/config/colors/colors.dart';

import '../../../../../config/theme/theme_controller.dart';

class ReplayMailScreen extends StatelessWidget {
  final _replayMailController = Get.put(ReplayMailController());
  final ThemeController themeController = Get.find();

  ReplayMailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
    );
  }
}
