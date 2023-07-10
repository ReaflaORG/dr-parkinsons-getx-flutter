import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../models/sarch_doctors_model.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../main/controller/main_controller.dart';
import '../controller/search_doctors_controller.dart';
import '../widget/doctor_card_widget.dart';

/// 전문의 검색 화면
class DoctorSearchView extends GetView<DoctorSearchController> {
  const DoctorSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : GlobalLayoutWidget(
              context: context,
              onWillPop: () => MainController.to.handleBackPressed(),
              appBar: GlobalAppBarWidget(
                title: '파킨슨병 전문의 검색',
                appBar: AppBar(),
                isLeadingVisible: controller.argument == null
                    ? true
                    : controller.argument['isLeadingVisible'] == true
                        ? false
                        : true,
                actions: [
                  InkWell(
                    onTap: () {
                      AuthService.to.userData.value.guardianPhoneNumber != null
                          ? GlobalEmergencyModalWidget(context: context)
                          : GlobalEmergencyModalWidget2(context: context);
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: Image.asset(
                        'assets/images/icons/page2/24 alert.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.handleDoctorProvider();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20).w,
                    child: Column(
                      children: [
                        SizedBox(height: 15.w),
                        InkWell(
                          onTap: () {
                            controller.distance.value = '0';
                            controller.handleDoctorProvider();
                          },
                          child: Form(
                            key: controller.globalFormKey.value,
                            child: TextFormField(
                              textInputAction: TextInputAction.search,
                              controller: controller
                                  .searchTextFormFieldController.value,
                              focusNode: controller.searchTextFocusNode.value,
                              onChanged: (value) {
                                controller.distance.value = '0';
                                controller.handleDoctorProvider();
                              },
                              onFieldSubmitted: (value) {
                                controller.distance.value = '0';
                                controller.handleDoctorProvider();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorPath.Border2HECEFF1,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 17,
                                  horizontal: 8,
                                ).w,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ColorPath.Border2HECEFF1,
                                  ),
                                  borderRadius: BorderRadius.circular(50).r,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ColorPath.Border2HECEFF1,
                                  ),
                                  borderRadius: BorderRadius.circular(50).r,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ColorPath.Border2HECEFF1,
                                  ),
                                  borderRadius: BorderRadius.circular(50).r,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ColorPath.Border2HECEFF1,
                                  ),
                                  borderRadius: BorderRadius.circular(50).r,
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ColorPath.Border2HECEFF1,
                                  ),
                                  borderRadius: BorderRadius.circular(50).r,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    18.75,
                                    12.5,
                                    22.75,
                                    12.5,
                                  ).w,
                                  child: InkWell(
                                    onTap: () {
                                      controller.distance.value = '0';
                                      controller.handleDoctorProvider();
                                    },
                                    child: Image.asset(
                                      'assets/search_doctors/search_icon.png',
                                      width: 16.5.w,
                                      height: 16.5.w,
                                    ),
                                  ),
                                ),
                                hintText: '병원명 또는 의사명을 입력하세요.',
                                hintStyle: TextPath.TextF14W500.copyWith(
                                  color: ColorPath.TextGrey4H9E9E9E,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.w),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15).r,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5.w),
                              Text(
                                '거리별 검색',
                                style: TextPath.TextF14W500.copyWith(),
                              ),
                              SizedBox(width: 10.w),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                    controller.distanceList.length, (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 3).w,
                                    child: DoctorCardWidget(
                                      title:
                                          '${controller.distanceList[index]} km',
                                      isCheck: controller.distanceList[index] ==
                                          controller.distance.value,
                                      onClick: () {
                                        controller.searchTextFormFieldController
                                            .value.text = '';
                                        controller.searchTextFormFieldController
                                            .refresh();
                                        controller.distance.value =
                                            controller.distanceList[index];
                                        controller.handleDoctorProvider();
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.w),
                        const SearchDoctorsListWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

/// 전문의 리스트
class SearchDoctorsListWidget extends GetView<DoctorSearchController> {
  const SearchDoctorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.doctorListData.length,
        itemBuilder: (BuildContext context, int index) {
          return DoctorSearchItemWidget(
            onClick: () {
              Get.toNamed(
                '/search/doctor/detail',
                arguments: {
                  'doctor_id': controller.doctorListData[index].doctorId,
                },
              );
            },
            item: controller.doctorListData[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.transparent);
        },
      ),
    );
  }
}

/// 주치의 검색 리스트 위젯
///
/// [onClick] : 클릭 이벤트
///
/// [item] : 데이터
class DoctorSearchItemWidget extends StatelessWidget {
  const DoctorSearchItemWidget({
    super.key,
    required this.onClick,
    required this.item,
  });

  final SearchDoctorsModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365.7.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        border: Border.all(
          color: ColorPath.GreyColor,
          width: 1.w,
        ),
      ),
      child: GlobalInkWellWidget(
        padding: const EdgeInsets.all(16).w,
        borderRadius: 6.r,
        onTap: () {
          onClick();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.hospitalName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextPath.TextF14W500.copyWith(),
                  ),
                  Text(
                    item.doctorPosition,
                    style: TextPath.TextF12W400.copyWith(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.doctorName,
                    style: TextPath.TextF14W600.copyWith(
                      color: ColorPath.Blue2F7ABAColor,
                    ),
                  ),
                  Text(
                    ' 의사',
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey3H616161,
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
