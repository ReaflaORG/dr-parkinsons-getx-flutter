// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dio/dio.dart' as Dio;
import 'package:dr_parkinsons/app/theme/color_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../../../theme/text_path.dart';
import 'my_symptoms_controller.dart';

class WriteMySymptomsController extends GetxController {
  static WriteMySymptomsController get to => Get.find();

  // Controller ▼

  /// 내 증상 기록 등록하기 컨트롤러
  Rx<TextEditingController> titleTextEditController =
      TextEditingController().obs;

  /// 내 증상 기록 내용 텍스트 에디팅 컨트롤러
  Rx<TextEditingController> contentTextEditController =
      TextEditingController().obs;

  // FocusNode ▼

  /// 제목 포커스 노드
  Rx<FocusNode> titleFoucesNode = FocusNode().obs;

  /// 내용 포커스 노드
  Rx<FocusNode> contentFoucesNode = FocusNode().obs;

  // Variable ▼

  /// 저장 버튼 활성화 여부
  Rx<bool> isSaveButtonEnable = false.obs;

  /// 제목 에러
  Rx<String> titleError = ''.obs;

  /// 내용 에러
  Rx<String> contentError = ''.obs;

  /// 이미지 및 영상 파일
  RxList<XFile> files = <XFile>[].obs;

  // Function ▼

  /// 텍스트 필드 OnChanged 핸들러
  ///
  /// [text] String: 텍스트 필드에 입력된 텍스트
  ///
  /// [type] String : 텍스트 필드 타입
  void handleOnChanged(
    String text, {
    required String type,
  }) {
    switch (type) {
      case 'title':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          titleError.value = '제목을 입력해주세요';
          return;
        }

        if (text.length < 2) {
          isSaveButtonEnable.value = false;
          titleError.value = '2자 이상 입력해주세요';
          return;
        }

        titleError.value = '';
        isSaveButtonEnable.value = true;
        break;
      case 'content':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          contentError.value = '내 증상 기록 내용을 입력해주세요';
          return;
        }

        if (text.length < 2) {
          isSaveButtonEnable.value = false;
          contentError.value = '2자 이상 입력해주세요';
          return;
        }

        contentError.value = '';
        isSaveButtonEnable.value = true;
        break;
    }

    // 저장 버튼 활성화 여부
    isSaveButtonEnable.value =
        titleError.value.isEmpty && contentError.value.isEmpty;
  }

  /// 내 증상 기록 등록하기
  Future<void> handleSubmit() async {
    if (titleTextEditController.value.text.isEmpty) {
      titleError.value = '제목은 필수입니다.';
    } else {
      titleError.value = '';
    }
    if (contentTextEditController.value.text.isEmpty) {
      contentError.value = '내용은 필수입니다.';
    } else {
      contentError.value = '';
    }

    if (titleError.value.isNotEmpty || contentError.value.isNotEmpty) {
      return;
    }

    try {
      List<Dio.MultipartFile> _files = [];
      for (int i = 0; i < files.length; i++) {
        String content = lookupMimeType(files[i].path)!;
        _files.add(Dio.MultipartFile.fromFileSync(files[i].path,
            contentType:
                MediaType(content.split('/')[0], content.split('/')[1])));
      }
      Dio.FormData request = Dio.FormData.fromMap({
        'title': titleTextEditController.value.text,
        'description': contentTextEditController.value.text,
        'files': _files
      });

      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/myinfo/sympthom',
        requestModel: request,
      );

      switch (response.statusCode) {
        case 201:
          titleTextEditController.value.text = '';
          contentTextEditController.value.text = '';

          Get.back();
          await MySymptomsController.to.getMySymptomsData();
          GlobalToastWidget('저장이 완료되었습니다.');

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 파일 추가하기
  Future<void> handleFileAdd({required bool isImage}) async {
    XFile? image;

    if (isImage) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      image = await ImagePicker().pickVideo(source: ImageSource.gallery);
    }

    if (image != null) {
      files.add(image);
    }
  }

  /// 파일 삭제하기
  handleFileRemove({
    required int index,
  }) {
    files.removeAt(index);
  }

  /// 파일 선택기
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
