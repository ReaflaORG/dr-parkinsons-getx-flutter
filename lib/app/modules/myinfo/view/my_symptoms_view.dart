import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/my_symptoms_controller.dart';
import '../models/my_symptoms_item_model.dart';
import '../widgets/my_symptoms_item_widget.dart';
import 'edit_my_symptoms_view.dart';

// my symptoms view
class MySymptomsView extends GetView<MySymptomsController> {
  const MySymptomsView({super.key});

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
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
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
                  onTap: () {},
                  child: Text(
                    "추가하기",
                    style: TextPath.TextF16W600.copyWith(
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
            child: Stack(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 40.w),
                        MySymptomsBodyView(),
                        // Expanded(
                        //   child: MySymptomsBodyView(),
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

// my symptoms body view - call item widget with listview
class MySymptomsBodyView extends GetView<MySymptomsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: 40),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          MySymptomsItemModel item = controller.listArray[index];
          return MySymptomsItemWidget(
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditMySymptomsView(),
                ),
              );
            },
            item: item,
          );
        },
      ),
    );
  }
}
