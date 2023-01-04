import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/my_symptoms_controller.dart';
import '../models/my_symptoms_item_model.dart';

const String type = 'delete_symptom';
const String alertTitleMsg = '정말 삭제하시겠습니까?';
const String alertContentMsg = '주치의 찾기 탭을 통해 다시 담당 주치의를 설정하실 수 있습니다.';
const String firstButtonTitle = '삭제하기';
const String secondButtonTitle = '취소하기';

// my symptoms view
class MySymptomsView extends GetView<MySymptomsController> {
  const MySymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
      context: context,
      appBar: GlobalAppBarWidget(
        title: '내 증상 기록',
        appBar: AppBar(),
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 5).w,
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.WRITE_MY_SYMPTOMS);
                controller.getMySymptomsData();
              },
              child: Text(
                '추가하기',
                style: TextPath.TextF14W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
          ),
        ],
      ),
      body: controller.listArray.isEmpty
          ? SizedBox(
              width: double.infinity,
              height: Get.height - 150.w,
              child: Center(
                child: Text(
                  '내 증상 기록이 없습니다\r\n오른쪽 상단에 추가하기 버튼을 눌러주세요!',
                  textAlign: TextAlign.center,
                  style: TextPath.TextF16W400.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20).w,
                    child: Column(
                      children: [
                        SizedBox(height: 20.w),
                        ListView.builder(
                          padding: const EdgeInsets.only(top: 10).w,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.listArray.length,
                          itemBuilder: (BuildContext context, int index) {
                            MySymptomsModel item = controller.listArray[index];
                            return MySymptomsItemWidget(
                              onClick: () async {
                                await Get.toNamed(
                                  Routes.VIEW_MY_SYMPTOMS,
                                  arguments: {
                                    'id': controller
                                        .listArray[index].symptomHistoryId
                                  },
                                );
                                await controller.getMySymptomsData();
                              },
                              item: item,
                              controller: controller,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

// my symptoms item widget
class MySymptomsItemWidget extends StatelessWidget {
  const MySymptomsItemWidget({
    super.key,
    required this.onClick,
    required this.item,
    required this.controller,
  });

  final MySymptomsModel item;
  final Function onClick;
  final MySymptomsController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    height: 50.w,
                    padding: const EdgeInsets.only(left: 10).w,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.title,
                      style: TextPath.TextF16W400.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(right: 20).w,
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.createdAt.toString().substring(0, 10),
                      style: TextPath.TextF16W400.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.EDIT_MY_SYMPTOMS,
                        arguments: {
                          'id': item.symptomHistoryId,
                        },
                      );
                    },
                    child: Ink.image(
                      image: const AssetImage(
                        'assets/my_symptoms/modify_pencil_icon.png',
                      ),
                      width: 12.w,
                      height: 12.w,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      GlobalSymptomRecordWidget(
                        alertTitleMsg: alertTitleMsg,
                        alertContentMsg: alertContentMsg,
                        onCancelPressed: () {
                          Get.back();
                        },
                        onOkPressed: () {
                          controller.deleteMySymptomsData(
                            item.symptomHistoryId,
                          );
                          Get.back();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 10).w,
                      child: Ink.image(
                        image: const AssetImage(
                          'assets/my_symptoms/trash_icon.png',
                        ),
                        width: 18.w,
                        height: 18.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
