import 'package:base/app/model/doctor_search_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/doctor_search_controller.dart';
import '../widget/doctor_search_item_widget.dart';

// search doctors view
class SearchDoctorsView extends GetView<DoctorSearchController> {
  const SearchDoctorsView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
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
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SearchDoctorsHeader(),
                        SearchDoctorsBodyView(),
                        // Expanded(
                        //   child: SearchDoctorsBodyView(),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

// search doctors header
class SearchDoctorsHeader extends GetView<DoctorSearchController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 15.w),
          _searchDoctorsSearchBar(),
          SizedBox(height: 15.w),
          _searchDoctorsDistanceButtons(),
          SizedBox(height: 15.w),
        ],
      ),
    );
  }

  Widget _searchDoctorsSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: ColorPath.Border2HECEFF1,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(18.75.w, 12.5.w, 22.75.w, 12.5.w),
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
      ),
    );
  }

  Widget _searchDoctorsDistanceButtons() {
    return Container(
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
          SizedBox(width: 10.w),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorPath.Blue2F7ABAColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),
            child: Text(
              '5Km',
              style: TextPath.TextF12W500.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w),
                  side: BorderSide(
                    color: ColorPath.Border3E7E7E7,
                  ),
                )),
            child: Text(
              '10Km',
              style: TextPath.TextF12W500.copyWith(),
            ),
          ),
          SizedBox(width: 5.w),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w),
                  side: BorderSide(
                    color: ColorPath.Border3E7E7E7,
                  ),
                )),
            child: Text(
              '20Km',
              style: TextPath.TextF12W500.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}

// search doctors body view - call item widget with listview
class SearchDoctorsBodyView extends GetView<DoctorSearchController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          DoctorSearchItemModel item = controller.listArray[index];
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
