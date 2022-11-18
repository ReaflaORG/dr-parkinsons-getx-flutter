import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../controller/edit_my_symptoms_controller.dart';
import '../models/edit_my_symptoms_item_model.dart';
import '../widgets/edit_my_symptoms_item_widget.dart';

// edit my symptoms view
class EditMySymptomsView extends GetView<EditMySymptomsController> {
  const EditMySymptomsView({super.key});

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
                '내 증상 편집',
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
                        EditMySymptomsHeader(),
                        EditMySymptomsView(),
                        // Expanded(
                        //   child: EditMySymptomsView(),
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

// edity my symptoms header
class EditMySymptomsHeader extends GetView<EditMySymptomsController> {
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
                    '내 증상 편집',
                    style: TextPath.TextF12W600.copyWith(),
                  ),
                ),
                // Spacer(),
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       '편집하기',
                //       style: TextStyle(
                //         color: searchDoctorsButtonTextBlackColor,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

// edit my symptoms view - call item widget
class EditMySymptomsBodyView extends GetView<EditMySymptomsController> {
  @override
  Widget build(BuildContext context) {
    EditMySymptomsItemModel item = controller.listArray;
    return EditMySymptomsItemWidget(
      item: item,
    );
  }
}
