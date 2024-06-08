import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:request_hr/app/mail/mail-details/services/mail_details_service.dart';

import '../../../../../config/controllerConfig/base_controller.dart';
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
    final result = await OpenFile.open(filePath);
    log("type=${result.type}  message=${result.message}");
  }

  void downloadFile() async {
    final downloadDirectory = await _getDownloadDirectory();
    log(downloadDirectory ?? 'fsiled');
    final taskId = await FlutterDownloader.enqueue(
      fileName: 'document',
      url:
          'https://file-examples.com/storage/fe4e1227086659fa1a24064/2017/10/file-example_PDF_500_kB.pdf',
      savedDir: downloadDirectory ?? '/storage/emulated/0/Download',
      saveInPublicStorage: true,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification: true,
      // click on notification to open downloaded file (for Android)
    );
    String filePath = '';
    if (downloadDirectory == null) {
      filePath = '/storage/emulated/0/Download/document';
    } else {
      filePath = '$downloadDirectory/document';
    }

    if (taskId != null) {
      openFile(filePath);
    }
    // Check storage permission
    /*DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Permission permissionToRequest;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        permissionToRequest = Permission.storage;
        log('  Permission.storage   --------');
      } else {
        log('  Permission.photos   --------');
        permissionToRequest = Permission.photos;
      }
      if (await permissionToRequest.request().isGranted) {
        // Get the external storage directory
        Directory? directory = await getExternalStorageDirectory();
        String path = '${directory?.path}/hobba.pdf';

        // Download the file
        Dio dio = Dio();
        try {
          await dio.download(
              'https://file-examples.com/storage/fe4e1227086659fa1a24064/2017/10/file-example_PDF_500_kB.pdf',
              path);
          print('File downloaded to $path');
        } catch (e) {
          print('Error downloading file: $e');
        }
      } else {
        print('Storage permission denied');
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      permissionToRequest = Permission.photos;
    }*/
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
