import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/doctor_controller.dart';
import '../widget/doctor_item_widget.dart';

// 전문의 화면
class DoctorView extends GetView<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !controller.process.value
          ? Scaffold(
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
                  '${controller.doctor.value.doctorName} 의사',
                  style: TextPath.Heading2F18W600.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24.r),
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          const DoctorHeaderWidget(),
                          SizedBox(height: 10.w),
                          const DoctorCardWidget(),
                          SizedBox(height: 30.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

/// 전문의 헤더
class DoctorHeaderWidget extends GetView<DoctorController> {
  const DoctorHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.doctor.value.users);
    return Obx(
      () => Container(
        height: 32.w,
        padding: EdgeInsets.symmetric(vertical: 4.5.w, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${controller.doctor.value.hospitalName} ${controller.doctor.value.doctorPosition}',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey3H616161,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                await controller.putDoctorUser();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                backgroundColor: controller.doctor.value.users.indexWhere(
                            (e) => e == AuthService.to.userData.value.uid) !=
                        -1
                    ? ColorPath.Blue2F7ABAColor
                    : ColorPath.Background2HD9D9D9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                '내 주치의',
                style: TextPath.TextF12W500.copyWith(
                  color: controller.doctor.value.users
                              .indexOf(AuthService.to.userData.value.uid) !=
                          -1
                      ? Colors.white
                      : ColorPath.TextGrey4H9E9E9E,
                ),
              ),
            ),
          ],
        ),
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
        padding: EdgeInsets.only(top: 20.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.doctor.value.doctorContents.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorItemWidget(
            item: controller.doctor.value.doctorContents[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.transparent);
        },
      ),
    );
  }
}
