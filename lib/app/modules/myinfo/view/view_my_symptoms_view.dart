import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/view_my_symtoms_controller.dart';
import '../models/view_my_symptoms_item_model.dart';
import '../widgets/view_my_symptoms_item_widget.dart';

// view my symptoms view
class ViewMySymptomsView extends GetView<ViewMySymptomsController> {
  const ViewMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPath.BackgroundWhite,
            elevation: 0,
            centerTitle: false,
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
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24)),
                    color: ColorPath.PrimaryLightColor,
                  ),
                  //width: screenSize(context).width,
                  height: 230,
                ),
                Container(
                  child: Container(
                    //width: screenSize(context).width,
                    //height: screenSize(context).height,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        ViewMySymptomsHeader(),
                        ViewMySymptomsView(),
                        // Expanded(
                        //   child: ViewMySymptomsView(),
                        // ),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
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

// view my symptoms header
class ViewMySymptomsHeader extends GetView<ViewMySymptomsController> {
  bool isSetting = false;
  bool isGuardian = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 9.5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 11.5),
                    child: Image.asset(
                      'assets/doctor/back_arrow.png',
                      width: 21,
                      height: 13.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '내 증상 기록',
                    style: TextPath.TextF20W600.copyWith(),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '편집하기',
                      style: TextPath.TextF16W600.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

// view my symptoms body view
class ViewMySymptomsBodyView extends GetView<ViewMySymptomsController> {
  @override
  Widget build(BuildContext context) {
    ViewMySymptomsItemModel item = controller.listArray;
    return ViewMySymptomsItemWidget(
      item: item,
    );
  }
}
