import 'package:flutter/material.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../models/suggest_policy_item_model.dart';
import 'show_dialog.dart';

const String alertTitleMsg = "정책 제안 발신 완료";
const String alertContentMsg =
    "작성된 제안은 닥터 파킨슨 관리자에게 전송되어 향후 정책 결정의 자료로 사용됩니다.\n소중한 의견에 감사합니다.";

// suggest policy item widget
class SuggestPolicyItemWidget extends StatelessWidget {
  const SuggestPolicyItemWidget({
    super.key,
    required this.item,
  });
  final SuggestPolicyItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          _suggestPolicyForm(),
          SizedBox(height: 40),
          _suggestPolicyAction(context),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  // suggest policy form
  Widget _suggestPolicyForm() {
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
                hintText: '정책제안합니다.',
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
              '내용',
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
          SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            height: 24,
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: BorderSide(
                        color: ColorPath.Border1H9E9E9E,
                        width: 1,
                      ),
                      value: item.isAgreePersonalInfo,
                      onChanged: (bool? value) {
                        // setState(() {
                        //   isAgreePersonalInfo = value!;
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '개인정보 처리방침에 동의합니다.',
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            height: 24,
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: BorderSide(
                        color: ColorPath.Border1H9E9E9E,
                        width: 1,
                      ),
                      value: item.isSendAnonymous,
                      onChanged: (bool? value) {
                        // setState(() {
                        //   isSendAnynomous = value!;
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '익명으로 전송합니다.',
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // suggest policy button action
  Widget _suggestPolicyAction(BuildContext context) {
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
