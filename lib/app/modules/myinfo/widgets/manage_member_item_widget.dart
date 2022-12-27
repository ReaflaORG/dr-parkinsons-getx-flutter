import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../models/manage_member_item_model.dart';
import 'show_dialog_two_options.dart';

const String typeLogout = "logout";
const String alertTitleMsgLogout = "로그아웃 하시겠습니까?";
const String alertContentMsgLogout = "";
const String firstButtonTitleLogout = "로그아웃 하기";
const String secondButtonTitleLogout = "취소";

const String typeResignation = "resignation";
const String alertTitleMsgResignation = "정말 탈퇴하시겠습니까??";
const String alertContentMsgResignation = "";
const String firstButtonTitleResignation = "탈퇴하기";
const String secondButtonTitleResignation = "취소";

// manage member item widget
class ManageMemberItemWidget extends StatelessWidget {
  const ManageMemberItemWidget({
    super.key,
    required this.item,
  });
  final ManageMemberItemModel item;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await showAlertTwoOptionsDialog(
                      handleOk: () async {
                        // 로그아웃
                        await AuthService.to.handleLogout();
                      },
                      context: context,
                      alertTitleMsg: alertTitleMsgLogout,
                      alertContentMsg: alertContentMsgLogout,
                      firstButtonTitle: firstButtonTitleLogout,
                      secondButtonTitle: secondButtonTitleLogout,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '로그아웃',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/my_symptoms/myinfo_list_icon.png',
                          width: 18,
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7),
                InkWell(
                  onTap: () async {
                    await showAlertTwoOptionsDialog(
                      handleOk: () async {
                        // 회원탈퇴
                        await AuthService.to.handleWithOut();
                      },
                      context: context,
                      alertTitleMsg: alertTitleMsgResignation,
                      alertContentMsg: alertContentMsgResignation,
                      firstButtonTitle: firstButtonTitleResignation,
                      secondButtonTitle: secondButtonTitleResignation,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          '회원탈퇴',
                          style: TextPath.TextF14W500.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/my_symptoms/myinfo_list_icon.png',
                          width: 18,
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
