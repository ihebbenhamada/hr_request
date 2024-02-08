import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_hr/app/dashboard/tabs/meetings/controllers/meetings_controller.dart';

import '../../../../../config/theme/theme_controller.dart';

class MeetingsScreen extends StatelessWidget {
  final _meetingsController = Get.put(MeetingsController());
  final ThemeController themeController = Get.find();
  MeetingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('meetings'),
      ),
    );
  }
}
