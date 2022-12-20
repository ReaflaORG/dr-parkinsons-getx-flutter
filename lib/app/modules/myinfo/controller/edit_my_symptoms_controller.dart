// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/modules/myinfo/controller/my_symptoms_controller.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/main_provider.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/my_symptoms_item_model.dart';

// edity my symptoms controller
class EditMySymptomsController extends GetxController {
  static EditMySymptomsController get to => Get.find();

  // Data ▼ ============================================
  RxList<XFile> files = <XFile>[].obs;
  RxList<String> remove_items = <String>[].obs;
  // EditController ▼ ========================================
  late Rx<TextEditingController> titleController;
  late Rx<TextEditingController> contentController;

  // FocusNode ▼ ========================================
  Rx<FocusNode> titleFoucesNode = FocusNode().obs;
  Rx<FocusNode> contentFoucesNode = FocusNode().obs;

  // * 에러 리스트
  Rx<String> titleError = ''.obs;
  Rx<String> contentError = ''.obs;

  // Variable ▼ ============================================
  late Rx<MySymptomsModel> editItem;
  Rx<bool> process = true.obs;
  Rx<dynamic> symptomId = 1.obs;

  // Function ▼ ========================================
  Future<void> getMySymptomsData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/myinfo/sympthom/$symptomId',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          editItem = MySymptomsModel.fromJson(response.data).obs;
          process.value = false;

          titleController =
              TextEditingController(text: editItem.value.title).obs;
          contentController =
              TextEditingController(text: editItem.value.description).obs;

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  Future<void> handleSubmit(BuildContext context) async {
    if (titleController.value.text.isEmpty) {
      titleError.value = '제목은 필수입니다.';
    } else {
      titleError.value = '';
    }

    if (contentController.value.text.isEmpty) {
      contentError.value = '내용은 필수입니다.';
    } else {
      contentError.value = '';
    }

    if (titleError.value.isNotEmpty || contentError.value.isNotEmpty) {
      return;
    }
    List<Dio.MultipartFile> _files = [];
    for (int i = 0; i < files.length; i++) {
      String content = lookupMimeType(files[i].path)!;
      _files.add(Dio.MultipartFile.fromFileSync(files[i].path,
          contentType:
              MediaType(content.split('/')[0], content.split('/')[1])));
    }

    try {
      Dio.FormData request = Dio.FormData.fromMap({
        'title': titleController.value.text,
        'description': contentController.value.text,
        'files': _files,
        'remove_symptom_history_files': remove_items.join(','),
      });

      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PUT',
        url: '/myinfo/sympthom/$symptomId',
        requestModel: request,
      );
      switch (response.statusCode) {
        case 200:
          titleController.value.text = '';
          contentController.value.text = '';

          MySymptomsController.to.getMySymptomsData();

          Get.back();
          await GlobalToastWidget(message: '수정되었습니다.');

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  // Function ▼ ========================================
  // 파일 추가하기
  Future<void> handleFileAdd({required bool isImage}) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image;
    if (isImage) {
      image = await _picker.pickImage(source: ImageSource.gallery);
    } else {
      image = await _picker.pickVideo(source: ImageSource.gallery);
    }

    if (image != null) {
      files.add(image);
    }
  }

  // 파일 삭제하기
  handleFileRemove({required int index}) {
    files.removeAt(index);
  }

  // 컨텐츠 삭제하기
  handleContentRemove({required int index}) {
    remove_items
        .add(editItem.value.symptomHistoryFiles[index].fileId.toString());
    editItem.value.symptomHistoryFiles.removeAt(index);
    editItem.refresh();
  }

  // 파일 선택기
  Future<void> handleFileSelected() async {
    await Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 180.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.w),
            GestureDetector(
              onTap: () => Get.back(),
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 98.w,
                height: 7.w,
                decoration: BoxDecoration(
                    color: ColorPath.Background2HD9D9D9,
                    borderRadius: BorderRadius.circular(10.w)),
              ),
            ),
            SizedBox(height: 24.w),
            SizedBox(
              width: double.infinity,
              height: 44.w,
              child: TextButton(
                onPressed: () {
                  handleFileAdd(isImage: false);
                  Get.back();
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorPath.PrimaryDarkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  '영상 추가하기',
                  style: TextPath.TextF16W600White.copyWith(),
                ),
              ),
            ),
            SizedBox(height: 12.w),
            SizedBox(
              width: double.infinity,
              height: 44.w,
              child: TextButton(
                onPressed: () async {
                  handleFileAdd(isImage: true);
                  Get.back();
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorPath.PrimaryDarkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  '사진 추가하기',
                  style: TextPath.TextF16W600White.copyWith(),
                ),
              ),
            ),
            SizedBox(height: 30.w),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Future<void> onInit() async {
    symptomId.value = await Get.arguments['id'];
    await getMySymptomsData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
