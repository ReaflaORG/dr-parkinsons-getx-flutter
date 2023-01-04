import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../main/controller/main_controller.dart';
import '../controller/my_info_controller.dart';

class MyInfoView extends GetView<MyInfoController> {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          title: '내정보',
          appBar: AppBar(),
          isLeadingVisible: true,
          backgroundColor: ColorPath.PrimaryLightColor,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: 160.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ).r,
                  color: ColorPath.PrimaryLightColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                child: Column(
                  children: [
                    const MyInfoHeaderWidget(),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 20.w),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.menuData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MenuWidget(
                          index: index,
                        );
                      },
                    ),
                    SizedBox(height: 50.w),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 내정보 헤더
class MyInfoHeaderWidget extends GetView<MyInfoController> {
  const MyInfoHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10).w,
        child: Column(
          children: [
            SizedBox(height: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthService.to.userData.value.userName != null
                    ? Text(
                        '${AuthService.to.userData.value.userName!}님',
                        style: TextPath.TextF24W600.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
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
                SizedBox(height: 30.w),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 20).w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8).r,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(25, 118, 210, 0.15),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      !AuthService.to.isMyDoctor
                          ? const DoctorEmptyWidget()
                          : const DoctorWidget(),
                      // GlobalDividerWidget(
                      //   margin: const EdgeInsets.only(top: 10, bottom: 20).w,
                      //   color: ColorPath.GreyLightColor,
                      //   height: 1.w,
                      // ),
                      SizedBox(height: 10.w),
                      AuthService.to.userData.value.guardianName == null
                          ? const GuardianEmptyWidget()
                          : const GuardianWidget(),
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
}

/// 주치의가 없을 때 위젯
class DoctorEmptyWidget extends StatelessWidget {
  const DoctorEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '내 주치의가 설정되어 있지 않습니다\r\n버튼을 클릭하면 주치의 검색으로 이동합니다',
          style: TextPath.TextF12W400,
        ),
        const Spacer(),
        Material(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50).r,
          ),
          child: IconButton(
            splashColor: ColorPath.PrimaryLightColor,
            highlightColor: ColorPath.PrimaryColor.withOpacity(0.05),
            onPressed: () {
              MainController.to.navigationIndex.value = 3;
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            icon: Icon(
              Icons.east_rounded,
              color: ColorPath.SecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

/// 주치의가 있을 때 위젯
class DoctorWidget extends GetView<MyInfoController> {
  const DoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/search/doctor/detail',
          arguments: {
            'doctor_id': AuthService.to.myDoctor.value.doctorId,
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '내 주치의',
            style: TextPath.TextF12W400.copyWith(
              color: ColorPath.TextGrey3H616161,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AuthService.to.myDoctor.value.doctorName!,
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                  Text(
                    '(${AuthService.to.myDoctor.value.hospitalName})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextPath.TextF12W400.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Material(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50).r,
                ),
                child: IconButton(
                  splashColor: ColorPath.PrimaryLightColor,
                  highlightColor: ColorPath.PrimaryColor.withOpacity(0.05),
                  onPressed: () {
                    controller.putDoctorUser(context);
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: ColorPath.SecondaryDarkColor,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 보호자가 없을 때 위젯
class GuardianEmptyWidget extends StatelessWidget {
  const GuardianEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              text: '프로필 설정',
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

/// 보호자가 있을 때 위젯
class GuardianWidget extends StatelessWidget {
  const GuardianWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '나의 보호자',
          style: TextPath.TextF12W400.copyWith(
            color: ColorPath.TextGrey3H616161,
          ),
        ),
        Row(
          children: [
            Text(
              AuthService.to.userData.value.guardianName!,
              style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
            Text(
              '(${AuthService.to.userData.value.guardianPhoneNumber!})',
              style: TextPath.TextF12W400.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
            const Spacer(),
            Material(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50).r,
              ),
              child: IconButton(
                splashColor: ColorPath.PrimaryLightColor,
                highlightColor: ColorPath.PrimaryColor.withOpacity(0.05),
                onPressed: () {
                  Get.toNamed('/myinfo/profile_setting');
                },
                icon: Icon(
                  Icons.call_made_rounded,
                  color: ColorPath.SecondaryDarkColor,
                  size: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 내정보 메뉴 위젯
class MenuWidget extends GetView<MyInfoController> {
  const MenuWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.menuData[index].page != null) {
          Get.toNamed(controller.menuData[index].page!);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.menuData[index].title,
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: controller.menuData[index].page != null,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/myinfo/myinfo_list_icon.png',
                    width: 6,
                    height: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
