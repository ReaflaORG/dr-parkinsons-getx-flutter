import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/doctor_controller.dart';
import '../widget/doctor_item_widget.dart';

// docotor view
class DoctorView extends GetView<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
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
            title: Text(
              'OOO의사',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
              textAlign: TextAlign.left,
            ),
            actions: [
              Container(
                padding: EdgeInsets.fromLTRB(0.w, 13.w, 18.w, 13.w),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '주치의 추가/변경하기',
                    style: TextPath.TextF12W400.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24.w)),
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 15.w),
                      const DoctorHeaderWidget(),
                      SizedBox(height: 15.w),
                      const DoctorCardWidget(),
                      SizedBox(height: 15.w),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

/// 전문의 헤더
class DoctorHeaderWidget extends GetView<DoctorController> {
  const DoctorHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'OO 병원 신경과 전문의',
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey3H616161,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.only(right: 48.w),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorPath.Blue2F7ABAColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 8.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      )),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(6.w, 4.5.w, 6.w, 4.5.w),
                    child: Text(
                      '내 주치의',
                      style: TextPath.TextF12W500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 전문의 목록
class DoctorCardWidget extends GetView<DoctorController> {
  const DoctorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.only(top: 40.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorItemWidget(
            onClick: () {
              Get.toNamed('/doctor');
            },
            item: controller.listArray[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.transparent);
        },
      ),
    );
  }
}
