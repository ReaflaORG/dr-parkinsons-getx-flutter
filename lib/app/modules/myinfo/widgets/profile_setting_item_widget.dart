import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/profile_setting_item_model.dart';

// profile setting item widget
class ProfileSettingItemWidget extends StatelessWidget {
  const ProfileSettingItemWidget({
    super.key,
    required this.item,
  });
  final ProfileSettingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          _profileSettingForm(),
          SizedBox(height: 40),
          _profileSettingAction(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  // profile setting form
  Widget _profileSettingForm() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '이름',
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
                hintText: '이름',
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
            alignment: Alignment.bottomLeft,
            child: Text(
              '연락처',
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
                hintText: '000-0000-0000',
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
            alignment: Alignment.bottomLeft,
            child: Text(
              '보호자명',
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
                hintText: '이름',
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
            alignment: Alignment.bottomLeft,
            child: Text(
              '보호자 연락처',
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
                hintText: '000-0000-0000',
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
            alignment: Alignment.bottomLeft,
            child: Text(
              '성별',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  width: 84,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: ColorPath.PrimaryDarkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '남성',
                      style: TextPath.TextF14W400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Container(
                  width: 84,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '여성',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '연령대',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: ColorPath.PrimaryDarkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '~30대',
                      style: TextPath.TextF14W400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '40대',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '50대',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '60대~',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '파킨슨 진단 결과',
              style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: ColorPath.Blue2F7ABAColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Blue2F7ABAColor,
                        ),
                      ),
                    ),
                    child: Text(
                      '의심',
                      style: TextPath.TextF14W400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '초기',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 64,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '중증',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 68,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPath.TextGrey1H212121,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: ColorPath.Border3E7E7E7,
                        ),
                      ),
                    ),
                    child: Text(
                      '해당없음',
                      style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              '파킨슨 의심시기',
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
                hintText: '2022-10-11',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(18.75, 12.5, 22.75, 12.5),
                  child: Image.asset(
                    'assets/myinfo/fa_calendar.png',
                    width: 14.86,
                    height: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // profile setting action
  Widget _profileSettingAction() {
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
                onPressed: () {},
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
