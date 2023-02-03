import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_parkinsons/app/globals/global_inkwell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
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
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          title: '내 증상 기록',
          appBar: AppBar(),
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10).w,
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
            : ListView.builder(
                padding: const EdgeInsets.only(top: 10).w,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.listArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return MySymptomsItemWidget(
                    onClick: () async {
                      await Get.toNamed(
                        Routes.VIEW_MY_SYMPTOMS,
                        arguments: {
                          'id': controller.listArray[index].symptomHistoryId
                        },
                      );
                      await controller.getMySymptomsData();
                    },
                    item: controller.listArray[index],
                    controller: controller,
                  );
                },
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
    return GlobalInkWellWidget(
      onTap: () => onClick(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20).w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextPath.TextF16W400.copyWith(
                        color: ColorPath.BlackColor,
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Text(
                      item.description,
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                    SizedBox(height: 20.w),
                    // if (item.symptomHistoryFiles.isEmpty)
                    //   DottedBorder(
                    //     color: ColorPath.TextGrey4H9E9E9E,
                    //     strokeWidth: 1,
                    //     dashPattern: const [6, 1],
                    //     borderType: BorderType.RRect,
                    //     radius: const Radius.circular(6).w,
                    //     child: SizedBox(
                    //       width: 110.w,
                    //       height: 110.w,
                    //       child: Center(
                    //         child: Icon(
                    //           Icons.image,
                    //           color: ColorPath.TextGrey4H9E9E9E,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    if (item.symptomHistoryFiles.isNotEmpty)
                      Row(
                        children: List.generate(
                          item.symptomHistoryFiles.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 10).w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.w),
                              child: CachedNetworkImage(
                                imageUrl: item.symptomHistoryFiles[index].url,
                                width: 110.w,
                                height: 110.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  item.createdAt.toString().substring(0, 10),
                  style: TextPath.TextF14W400.copyWith(
                    color: ColorPath.TextGrey3H616161,
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Get.toNamed(
                //       Routes.EDIT_MY_SYMPTOMS,
                //       arguments: {
                //         'id': item.symptomHistoryId,
                //       },
                //     );
                //   },
                //   child: Ink.image(
                //     image: const AssetImage(
                //       'assets/my_symptoms/modify_pencil_icon.png',
                //     ),
                //     width: 12.w,
                //     height: 12.w,
                //   ),
                // ),
                // SizedBox(width: 10.w),
                // InkWell(
                //   onTap: () {
                //     GlobalSymptomRecordWidget(
                //       alertTitleMsg: alertTitleMsg,
                //       alertContentMsg: alertContentMsg,
                //       onCancelPressed: () {
                //         Get.back();
                //       },
                //       onOkPressed: () {
                //         controller.deleteMySymptomsData(
                //           item.symptomHistoryId,
                //         );
                //         Get.back();
                //       },
                //     );
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.only(right: 10).w,
                //     child: Ink.image(
                //       image: const AssetImage(
                //         'assets/my_symptoms/trash_icon.png',
                //       ),
                //       width: 18.w,
                //       height: 18.w,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.w,
            color: ColorPath.TextGrey1H212121.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
