import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/view_my_symtoms_controller.dart';

// view my symptoms view
class ViewMySymptomsView extends GetView<ViewMySymptomsController> {
  const ViewMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPath.BackgroundWhite,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 39.w,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 18.w),
              child: Image.asset(
                'assets/doctor/back_arrow.png',
                width: 21.w,
                height: 13.5.w,
              ),
            ),
          ),
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              '내 증상 기록',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0.w, 10.w, 18.w, 10.w),
              child: InkWell(
                onTap: () async {
                  await Get.toNamed(
                    Routes.EDIT_MY_SYMPTOMS,
                    arguments: {'id': controller.item.value.symptomHistoryId},
                  );
                  await controller.getMySymptomsData();
                },
                child: Text(
                  '편집하기',
                  style: TextPath.TextF16W600.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [],
            ),
          ),
        ),
      );
}
