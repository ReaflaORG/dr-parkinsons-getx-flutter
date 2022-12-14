import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/manage_member_controller.dart';
import '../models/manage_member_item_model.dart';
import '../widgets/manage_member_item_widget.dart';

// manage member view
class ManageMemberView extends GetView<ManageMemeberController> {
  const ManageMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            '회원 관리',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 14.w),
              const ManageMemberBodyView(),
              // Expanded(
              //   child: ManageMemberBodyView(),
              // ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

// manage member body view
class ManageMemberBodyView extends GetView<ManageMemeberController> {
  const ManageMemberBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    ManageMemberItemModel item = controller.listArray;
    return ManageMemberItemWidget(
      item: item,
    );
  }
}
