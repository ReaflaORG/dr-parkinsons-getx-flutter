import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/suggest_policy_controller.dart';
import '../models/suggest_policy_item_model.dart';
import '../widgets/suggest_policy_item_widget.dart';

// suggest policy view
class SuggestPolicyView extends GetView<SuggestPolicyController> {
  const SuggestPolicyView({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '정책 제안하기',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(height: 40.w),
                        SuggestPolicyBodyView(),
                        // Expanded(
                        //   child: SuggestPolicyBodyView(),
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

// suggest policy body view
class SuggestPolicyBodyView extends GetView<SuggestPolicyController> {
  @override
  Widget build(BuildContext context) {
    SuggestPolicyItemModel item = controller.listArray;
    return SuggestPolicyItemWidget(
      item: item,
    );
  }
}
