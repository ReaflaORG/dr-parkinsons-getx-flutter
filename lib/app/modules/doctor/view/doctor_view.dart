import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/doctor_controller.dart';
import '../model/doctor_item_model.dart';
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
                Navigator.pop(context);
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
              child: Text(
                'OOO의사',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.fromLTRB(0.w, 13.w, 18.w, 13.w),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "주치의 추가/변경하기",
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
            physics: ClampingScrollPhysics(),
            child: Container(
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
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 15.w),
                          DoctorHeader(),
                          SizedBox(height: 15.w),
                          DoctorBodyView(),
                          SizedBox(height: 15.w),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

// doctor header
class DoctorHeader extends GetView<DoctorController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Row(
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
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 48.w),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ColorPath.Blue2F7ABAColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 8.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
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
          ),
        ],
      ),
    );
  }
}

// doctor body view - call item widget with listview
class DoctorBodyView extends GetView<DoctorController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.only(top: 40.w),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          DoctorItemModel item = controller.listArray[index];
          return DoctorItemWidget(
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorView(),
                ),
              );
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
