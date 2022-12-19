import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/sarch_doctors_model.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/search_doctors_controller.dart';
import '../widget/search_doctor_item_widget.dart';

// search doctors view
class SearchDoctorsView extends GetView<DoctorSearchController> {
  const SearchDoctorsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
              onTap: () {},
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
          child: Obx(
            () => Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 15.w),
                          InkWell(
                            onTap: () async {
                              await controller.onHandleSearch(
                                  searchKeyword: controller
                                      .searchTextFormFieldController
                                      .value
                                      .text);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorPath.Border2HECEFF1,
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              child: Form(
                                  key: controller.globalFormKey.value,
                                  child: TextFormField(
                                    controller: controller
                                        .searchTextFormFieldController.value,
                                    focusNode:
                                        controller.searchTextFocusNode.value,
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            18.75.w, 12.5.w, 22.75.w, 12.5.w),
                                        child: Image.asset(
                                          'assets/search_doctors/search_icon.png',
                                          width: 16.5.w,
                                          height: 16.5.w,
                                        ),
                                      ),
                                      hintText: '병원명 또는 의사명을 입력하세요.',
                                      hintStyle: TextPath.TextF14W500.copyWith(
                                        color: ColorPath.TextGrey4H9E9E9E,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 17.w,
                                        horizontal: 8.w,
                                      ),
                                    ),
                                    onFieldSubmitted: (value) async {
                                      await controller.onHandleSearch(
                                          searchKeyword: value);
                                    },
                                  )),
                            ),
                          ),
                          SizedBox(height: 15.w),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.w),
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
                                    controller.distanceList.length,
                                    (index) => Container(
                                      margin: EdgeInsets.only(right: 3.w),
                                      child: RadioButtonForSearchDoctors(
                                        title:
                                            '${controller.distanceList[index]} Km',
                                        isCheck:
                                            controller.distanceList[index] ==
                                                controller.distance.value,
                                        onClick: () =>
                                            controller.distance.value =
                                                controller.distanceList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.w),
                        ],
                      ),
                      !controller.isSearch.value
                          ? SearchDoctorsBeforeListView()
                          : SearchDoctorsAfterListView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class SearchDoctorsBeforeListView extends GetView<DoctorSearchController> {
  const SearchDoctorsBeforeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          SearchDoctorsModel item = controller.listArray[index];
          return DoctorSearchItemWidget(
            onClick: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DoctorView(),
              //   ),
              // );
              Get.toNamed(Routes.DOCTOR);
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

class SearchDoctorsAfterListView extends GetView<DoctorSearchController> {
  const SearchDoctorsAfterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.searchData.length,
        itemBuilder: (BuildContext context, int index) {
          SearchDoctorsModel item = controller.searchData[index];
          return DoctorSearchItemWidget(
            onClick: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DoctorView(),
              //   ),
              // );
              Get.toNamed(Routes.DOCTOR);
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

// search doctors item widget
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
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorPath.GreyColor,
            width: 1,
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
                      " 의사",
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
