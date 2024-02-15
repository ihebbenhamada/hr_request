import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../config/controllerConfig/base_controller.dart';
import '../services/meetings_details_service.dart';

class MeetingsDetailsController extends BaseController {
  /// SERVICES
  final MeetingsDetailsService _meetingsDetailsService =
      MeetingsDetailsService();

  /// CONTROLLERS

  /// VARIABLES
  RxList<String> meetingPointList = <String>[].obs;
  final TextEditingController meetingPointTextEditingController =
      TextEditingController(text: '');
  RxList<File> files = <File>[].obs;

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
  void initValues() {}

  /// FUNCTIONS
  addMeetingPoint() {
    if (meetingPointTextEditingController.value.text.isNotEmpty) {
      meetingPointList.add(
          '${meetingPointList.length + 1}- ${meetingPointTextEditingController.value.text}');
      meetingPointTextEditingController.clear();
    }
  }

  uploadAttachment() {
    FilePicker.platform.pickFiles(allowMultiple: true).then((result) {
      if (result != null) {
        files.value = result.paths.map((path) => File(path!)).toList();
      } else {
        // User canceled the picker
      }
    });
  }
}
