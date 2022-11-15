import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/write_my_symtoms_controller.dart';
import '../models/write_my_symptoms_item_model.dart';
import '../widgets/write_my_symptoms_item_widget.dart';

// write my symptoms view
class WriteMySymptomsView extends GetView<WriteMySymptomsController> {
  const WriteMySymptomsView({super.key});

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
                        WriteMySymptomsHeader(),
                        WriteMySymptomsView(),
                        // Expanded(
                        //   child: WriteMySymptomsView(),
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

// write my symptoms header
class WriteMySymptomsHeader extends GetView<WriteMySymptomsController> {
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
                  child: Ink.image(
                    image: AssetImage(
                      'assets/doctor/back_arrow.png',
                    ),
                    width: 21,
                    height: 13.5,
                  ),
                ),
                SizedBox(width: 11.5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '내 증상 기록',
                    style: TextPath.TextF20W600.copyWith(),
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

// write my symptoms body view
class WriteMySymptomsBodyView extends GetView<WriteMySymptomsController> {
  @override
  Widget build(BuildContext context) {
    WriteMySymptomsItemModel item = controller.listArray;
    return WriteMySymptomsItemWidget(
      item: item,
    );
  }
}
