import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../models/sarch_doctors_model.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/search_doctors_controller.dart';
import '../widget/search_doctor_item_widget.dart';

/// 전문의 검색 화면
class SearchDoctorsView extends GetView<DoctorSearchController> {
  const SearchDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPath.BackgroundWhite,
            elevation: 0,
            centerTitle: false,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                '파킨슨병 전문의 검색',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  // 보호자에게 연락 문자
                  AuthService.to.userData.value.guardianPhoneNumber != null
                      ? GlobalEmergencyModalWidget(context: context)
                      : GlobalEmergencyModalWidget2(context: context);
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 18.w),
                  child: Image.asset(
                    'assets/search_doctors/search_doctors_icon.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 15.w),
                  InkWell(
                    onTap: () async {
                      controller.distance.value = '0';
                      await controller.getDoctorList();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorPath.Border2HECEFF1,
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Form(
                        key: controller.globalFormKey.value,
                        child: TextFormField(
                          controller:
                              controller.searchTextFormFieldController.value,
                          textInputAction: TextInputAction.search,
                          focusNode: controller.searchTextFocusNode.value,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 17.w,
                              horizontal: 8.w,
                            ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(
                                18.75.w,
                                12.5.w,
                                22.75.w,
                                12.5.w,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  // 검색 기능
                                  controller.distance.value = '0';
                                  await controller.getDoctorList();
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
                          onFieldSubmitted: (value) async {
                            controller.distance.value = '0';
                            await controller.getDoctorList();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '또는',
                          style: TextPath.TextF12W500.copyWith(),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '거리순으로 보기',
                          style: TextPath.TextF14W500.copyWith(),
                        ),
                        SizedBox(width: 5.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                              controller.distanceList.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(right: 3.w),
                              child: RadioButtonForSearchDoctors(
                                title: '${controller.distanceList[index]} Km',
                                isCheck: controller.distanceList[index] ==
                                    controller.distance.value,
                                onClick: () async {
                                  controller.searchTextFormFieldController.value
                                      .text = '';
                                  controller.searchTextFormFieldController
                                      .refresh();
                                  controller.distance.value =
                                      controller.distanceList[index];
                                  await controller.getDoctorList();
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
          SearchDoctorsModel item = controller.doctorListData[index];
          return DoctorSearchItemWidget(
            onClick: () {
              Get.toNamed(Routes.DOCTOR,
                  arguments: {'doctor_id': item.doctorId});
            },
            item: item,
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.transparent),
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
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorPath.GreyColor,
            width: 1.w,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.hospitalName,
                      style: TextPath.TextF14W500.copyWith(),
                    ),
                    Text(
                      item.doctorPosition,
                      style: TextPath.TextF12W400.copyWith(),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Text(
                      item.doctorName,
                      style: TextPath.TextF14W400.copyWith(
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
      ),
    );
  }
}
