import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_divier_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/doctor_detail_controller.dart';
import '../widget/doctor_video_widget.dart';

// 전문의 화면
class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : GlobalLayoutWidget(
              context: context,
              appBar: GlobalAppBarWidget(
                title: '${controller.doctor.value.doctorName} 의사',
                appBar: AppBar(),
                isLeadingVisible: false,
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: const Radius.circular(24).r,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20).w,
                      child: Column(
                        children: [
                          const DoctorHeaderWidget(),
                          GlobalDividerWidget.basic(
                            margin: const EdgeInsets.only(
                              left: 0,
                              top: 30,
                              right: 0,
                              bottom: 20,
                            ).w,
                          ),
                          const DoctorCardWidget(),
                          SizedBox(height: 30.w),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

/// 전문의 헤더
class DoctorHeaderWidget extends GetView<DoctorDetailController> {
  const DoctorHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 32.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.doctor.value.hospitalName} ${controller.doctor.value.doctorPosition}',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                controller.handleDoctorPatchProvider();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8).w,
                backgroundColor: controller.isDoctorSubscribe.value
                    ? ColorPath.Blue2F7ABAColor
                    : ColorPath.Background2HD9D9D9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
                ),
              ),
              child: Text(
                '내 주치의',
                style: TextPath.TextF12W500.copyWith(
                  color: controller.isDoctorSubscribe.value
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
class DoctorCardWidget extends GetView<DoctorDetailController> {
  const DoctorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.doctor_id == 94
        ? ListView.separated(
            padding: const EdgeInsets.only(top: 20).w,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.videoData.length,
            itemBuilder: (BuildContext context, int index) {
              return DoctorVideoWidget(
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(color: Colors.transparent);
            },
          )
        : const Center(
            child: Text(
              '컨텐츠가 없습니다',
            ),
          );
  }
}
