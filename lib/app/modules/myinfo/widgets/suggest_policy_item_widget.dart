import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../models/suggest_policy_item_model.dart';
import 'show_dialog.dart';

class SuggestPolicyItemWidget extends StatelessWidget {
  const SuggestPolicyItemWidget({
    super.key,
    required this.item,
  });

  final SuggestPolicyItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SuggestPolicyFormWidget(item: item),
          SizedBox(height: 40.w),
          const SuggestPolicyActionWidget(),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}

class SuggestPolicyFormWidget extends StatelessWidget {
  const SuggestPolicyFormWidget({
    super.key,
    required this.item,
  });

  final SuggestPolicyItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0).w,
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
          SizedBox(height: 6.w),
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.GrayCCCColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.Gray333Color),
              ),
              hintText: '의견제안합니다.',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ).w,
            ),
          ),
          SizedBox(height: 24.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '작성시간',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6.w),
          TextField(
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
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ).w,
            ),
          ),
          SizedBox(height: 24.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '내용',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 6.w),
          TextField(
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
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            height: 24,
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6).r,
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
                  SizedBox(width: 12.w),
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
          SizedBox(height: 5.w),
          Container(
            alignment: Alignment.centerLeft,
            height: 24.w,
            child: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6).r,
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
                  SizedBox(width: 12.w),
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
}

class SuggestPolicyActionWidget extends StatelessWidget {
  const SuggestPolicyActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0).w,
      child: Row(
        children: [
          SizedBox(
            width: 128.w,
            height: 38.w,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
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
          SizedBox(width: 8.w),
          Expanded(
            child: SizedBox(
              height: 38.w,
              child: TextButton(
                onPressed: () {
                  showAlertDialog(
                    context,
                    '의견 제안 발신 완료',
                    '작성된 의견은 닥터 파킨슨 관리자에게 전송되어 향후 정책 결정의 자료로 사용됩니다.\r\n\r\n소중한 의견에 감사합니다.',
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorPath.TextGrey1H212121,
                  backgroundColor: ColorPath.Blue2F7ABAColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4).r,
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
