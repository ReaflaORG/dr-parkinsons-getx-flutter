import 'package:base/app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/my_info_controller.dart';
import '../models/my_info_item_model.dart';
import '../widgets/my_info_item_widget.dart';

// my info view
class MyInfoView extends GetView<MyInfoController> {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPath.PrimaryLightColor,
            elevation: 0,
            centerTitle: false,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                '내정보',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24.w)),
                    color: ColorPath.PrimaryLightColor,
                  ),
                  height: 230,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      MyInfoHeader(),
                      MyInfoBodyView(),
                      // Expanded(
                      //   child: MyInfoBodyView(),
                      // ),
                      SizedBox(height: MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

// my info header
class MyInfoHeader extends GetView<MyInfoController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 15.w),
            Column(
              children: [
                AuthService.to.userData.value.userName != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              AuthService.to.userData.value.userName!,
                              style: TextPath.TextF24W600.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.w),
                            alignment: Alignment.center,
                            child: Text(
                              '님',
                              style: TextPath.TextF14W400.copyWith(
                                color: ColorPath.TextGrey3H616161,
                              ),
                            ),
                          ),
                        ],
                      )
                    : InkWell(
                        onTap: () => Get.toNamed(Routes.PROFILE_SETTING),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '이름을 설정해주세요.',
                            style: TextPath.TextF24W600.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(top: 30.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.w),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(25, 118, 210, 0.15),
                        spreadRadius: -5,
                        blurRadius: 10,
                        offset: Offset(10.w, 10.w),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      !AuthService.to.isMyDoctor
                          ? myinfoSearchDoctor(context)
                          : myinfoMyDoctor(),
                      Container(
                        padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                        child: Divider(
                          height: 1,
                          color: ColorPath.GrayCCCColor,
                        ),
                      ),
                      AuthService.to.userData.value.guardianName == null
                          ? myinfoSettingProfile()
                          : myinfoMyGuardianProfile(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
          ],
        ),
      ),
    );
  }

  // my info my doctor
  Widget myinfoMyDoctor() {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 60.w,
          child: Text(
            '내 주치의',
            style: TextPath.TextF12W200.copyWith(
              color: ColorPath.TextGrey3H616161,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 4.5.w),
          child: Text(
            AuthService.to.myDoctor.value.doctorName,
            style: TextPath.TextF14W400.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 4.5.w),
          child: Text(
            '(${AuthService.to.myDoctor.value.hospitalName})',
            style: TextPath.TextF12W400.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/myinfo/trash_icon.png',
              width: 18.w,
              height: 18.w,
            ),
          ),
        ),
      ],
    );
  }

// my info search doctor
  Widget myinfoSearchDoctor(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              '내 주치의가 설정되어 있지 않습니다.\n버튼을 선택하면 주치의 검색으로 이동합니다.',
              style: TextPath.TextF12W400.copyWith(),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.toNamed('/search');
            },
            child: Container(
              width: 36,
              height: 36,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
              decoration: BoxDecoration(
                  color: ColorPath.PrimaryLightColor,
                  borderRadius: BorderRadius.circular(18.w)),
              child: Image.asset(
                'assets/myinfo/arrow_right_icon.png',
                width: 18,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // my info MyGuardian Profile
  Widget myinfoMyGuardianProfile() {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 60.w,
            child: Text(
              '보호자',
              style: TextPath.TextF12W200.copyWith(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 4.5.w),
            child: Text(
              AuthService.to.userData.value.guardianName!,
              style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              AuthService.to.userData.value.guardianPhoneNumber!,
              style: TextPath.TextF12W400.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // my info setting profile
  Widget myinfoSettingProfile() {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: TextPath.TextF12W400.copyWith(),
          children: [
            TextSpan(
              text: '하단의 ',
              style: TextStyle(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
            const TextSpan(
              text: '프로필 설정 ',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextSpan(
              text: '에서 보호자를 설정해 주세요.',
              style: TextStyle(
                color: ColorPath.TextGrey3H616161,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// my info view - call item widget with listview
class MyInfoBodyView extends GetView<MyInfoController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: 40.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listArray.length,
        itemBuilder: (BuildContext context, int index) {
          MyInfoItemModel item = controller.listArray[index];
          return MyInfoItemWidget(
            onClick: () {
              if (item.vc != null) {
                Get.toNamed(item.vc!);
              }
            },
            item: item,
          );
        },
      ),
    );
  }
}
