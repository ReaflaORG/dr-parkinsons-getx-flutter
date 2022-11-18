import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/my_symptoms_item_model.dart';
import '../view/edit_my_symptoms_view.dart';
import 'show_dialog_two_options.dart';

const String type = "delete_symptom";
const String alertTitleMsg = "정말 삭제하시겠습니까?";
const String alertContentMsg = "주치의 찾기 탭을 통해 다시 담당 주치의를 설정하실 수 있습니다.";
const String firstButtonTitle = "삭제하기";
const String secondButtonTitle = "취소하기";

// my symptoms item widget
class MySymptomsItemWidget extends StatelessWidget {
  const MySymptomsItemWidget({
    super.key,
    required this.onClick,
    required this.item,
  });
  final MySymptomsItemModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.symptom,
                        style: TextPath.TextF16W400.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        item.dateWritten,
                        style: TextPath.TextF16W400.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditMySymptomsView(),
                          ),
                        );
                      },
                      child: Ink.image(
                        image: AssetImage(
                          'assets/my_symptoms/modify_pencil_icon.png',
                        ),
                        width: 12,
                        height: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        showAlertTwoOptionsDialog(
                          context,
                          type,
                          alertTitleMsg,
                          alertContentMsg,
                          firstButtonTitle,
                          secondButtonTitle,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Ink.image(
                          image: AssetImage(
                            'assets/my_symptoms/trash_icon.png',
                          ),
                          width: 18,
                          height: 18,
                        ),
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
