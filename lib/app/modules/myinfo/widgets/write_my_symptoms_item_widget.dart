import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

import '../models/write_my_symptoms_item_model.dart';
import 'show_dialog.dart';

const String alertTitleMsg = "내 증상 기록 저장";
const String alertContentMsg = "내 증상 기록이 저장되었습니다.";

// write my symptoms item widget
class WriteMySymptomsItemWidget extends StatelessWidget {
  const WriteMySymptomsItemWidget({
    super.key,
    required this.item,
  });
  final WriteMySymptomsItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          _writeMySymptomsForm(),
          SizedBox(height: 50),
          _writeMySymptomsAction(context),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  // write  my symptoms form
  Widget _writeMySymptomsForm() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '제목',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6),
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '파킨슨 일지 (10.17)',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '작성시간',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6),
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '10월 17일 오후 3시 20분',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '내 증상 기록',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6),
          Container(
            child: TextField(
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '내용입력',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '영상 및 사진 업로드',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                DottedBorder(
                  color: Color.fromRGBO(4, 168, 180, 0.9),
                  strokeWidth: 1,
                  dashPattern: [3, 1],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(6),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                    ),
                    child: Container(
                      width: 64,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text(
                        '+',
                        style: TextPath.TextF20W400.copyWith(
                          color: Color.fromRGBO(4, 168, 180, 0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/my_symptoms/sample_img.png',
                        width: 90,
                        height: 60,
                      ),
                      Positioned(
                        top: 4.06,
                        right: 4.06,
                        child: Image.asset(
                          'assets/my_symptoms/close_icon.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // write my symptoms button action
  Widget _writeMySymptomsAction(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Container(
            width: 128,
            height: 38,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: ColorPath.Border3E7E7E7,
                  ),
                ),
              ),
              child: Text(
                '취소',
                style: TextPath.TextF14W400.copyWith(
                  color: ColorPath.TextGrey3H616161,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 38,
              child: TextButton(
                onPressed: () {
                  showAlertDialog(context, alertTitleMsg, alertContentMsg);
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorPath.TextGrey1H212121,
                  backgroundColor: ColorPath.Blue2F7ABAColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: ColorPath.Border3E7E7E7,
                    ),
                  ),
                ),
                child: Text(
                  '완료',
                  style: TextPath.TextF14W400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
