import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:request_hr/app/mail/mail-details/services/mail_details_service.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/colors/colors.dart';
import '../../../auth/login/models/login_response.dart';
import '../../main/model/mail.dart';

class MailDetailsController extends BaseController {
  /// SERVICES
  final MailDetailsService _mailDetailsService = MailDetailsService();
  late GetStorage storage;

  /// CONTROLLERS
  final TextEditingController replaySubjectMessageTextEditingController =
      TextEditingController();
  final TextEditingController replayBodyMessageTextEditingController =
      TextEditingController();
  Rx<Mail> mail = Mail(
    id: 0,
    fKHrEmployeeId: 0,
    senderName: "",
    subject: "",
    description: "",
    reply: "",
    filePath: "",
    fKReqStatusId: 0,
    isSelected: false,
    creationDate: "",
    lastModifiedDate: "",
    isDeleted: false,
    isActive: false,
  ).obs;
  RxString from = ''.obs;
  RxList<int> assigneesList = <int>[].obs;

  /// VARIABLES
  RxBool isReplay = false.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE

  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
    if (Get.arguments != null) {
      mail.value = Get.arguments[0];
      from.value = Get.arguments[1];
    }
  }

  Future<void> requestPermissions() async {
    await Permission.storage.request();
  }

  Future<String> getFilePath(String filename) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return '$appDocPath/$filename';
  }

  Future<String?> _getDownloadDirectory() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    return directory?.path;
  }

  Future<void> openFile(String filePath) async {
    final result = await OpenFile.open(filePath, type: 'pdf');
  }

  void downloadFile() async {
    final downloadDirectory = await _getDownloadDirectory();
    String filePath = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Permission permissionToRequest;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        permissionToRequest = Permission.storage;
      } else {
        permissionToRequest = Permission.photos;
      }
      if (await permissionToRequest.request().isGranted) {
        final taskId = await FlutterDownloader.enqueue(
          fileName: 'document.pdf',
          url:
              'https://file-examples.com/storage/fe4e1227086659fa1a24064/2017/10/file-example_PDF_500_kB.pdf',
          savedDir: downloadDirectory ?? '/storage/emulated/0/Download',
          saveInPublicStorage: true,
          showNotification: true,
          openFileFromNotification: true,
        );
        if (downloadDirectory == null) {
          filePath = '/storage/emulated/0/Download/document';
        } else {
          filePath = '$downloadDirectory/document.pdf';
        }
        if (taskId != null) {
          openFile(filePath);
        }
      } else {
        print('Storage permission denied');
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      permissionToRequest = Permission.photos;
      final taskId = await FlutterDownloader.enqueue(
        fileName: 'document.pdf',
        url:
            'https://file-examples.com/storage/fe4e1227086659fa1a24064/2017/10/file-example_PDF_500_kB.pdf',
        savedDir: downloadDirectory ?? '/storage/emulated/0/Download',
        saveInPublicStorage: true,
        showNotification: true,
        openFileFromNotification: true,
      );
      if (downloadDirectory == null) {
        filePath = '/storage/emulated/0/Download/document';
      } else {
        filePath = '$downloadDirectory/document.pdf';
      }
      if (taskId != null) {
        openFile(filePath);
      }
    }
  }

  /// FUNCTIONS
  onClickReplay() {
    isReplay.value = true;
  }

  onClickSendReplay() {
    if (replaySubjectMessageTextEditingController.text.isEmpty ||
        replayBodyMessageTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "fill_credentials_toast".tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
    } else {
      _mailDetailsService
          .replayMessage(
        fkParentId: null,
        fkHrEmployeeId: Emp.fromJson(storage.read('employee')).id,
        subject: replaySubjectMessageTextEditingController.text,
        description: replayBodyMessageTextEditingController.text,
        reply: null,
        assignees: assigneesList,
        departmentIds: [],
        filePath: "",
        fKReqStatusId: 1,
        assigneeName: "",
        byAssigneeName: "",
        jobName: "",
        fKCreatorId: null,
        parentId: null,
        assigneeByImagePath: '',
        assigneeImagePath: '',
        creationDate: DateTime.now().toString().substring(0, 10),
        lastModifiedDate: DateTime.now().toString().substring(0, 10),
        isActive: true,
        isDeleted: false,
        receiver: 1,
        receivers: '',
        file: null,
        assigneesList: [],
        departments: [],
        listReqMessageVMs: null,
      )
          .then((value) {
        if (value != null) {
          Get.back();
        }
      });
    }
  }

  onClickBack() {
    Get.back();
  }
}
