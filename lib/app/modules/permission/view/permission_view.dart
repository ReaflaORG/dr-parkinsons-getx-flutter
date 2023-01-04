import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/permission_model.dart';
import '../../../service/permission_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/permission_controller.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // padding: EdgeInsets.fromLTRB(43.w, 30.w, 43.w, 0.w),
          // width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(43.w, 30.w, 43.w, 0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        // height: 52.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 4,
                              ),
                              width: 36.w,
                              height: 38.67.w,
                              decoration: BoxDecoration(
                                color: ColorPath.GreyColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                child: SizedBox(
                                  width: 28.w,
                                  height: 22.67.w,
                                  child: Image.asset(
                                    'assets/images/logo/logo_small.png',
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '앱 접근권한 안내',
                                  style: TextPath.Heading3F16W600.copyWith(
                                    height: 1.20,
                                  ),
                                ),
                                SizedBox(height: 2.w),
                                Text(
                                  '파킨슨 앱 이용 시 다음 권한들을 사용하오니\r\n허용해 주시기 바랍니다.',
                                  style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                    height: 1.15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        child: Divider(
                          indent: 1,
                          endIndent: 1,
                          thickness: 1,
                          height: 1,
                          color: ColorPath.GreyColor,
                        ),
                      ),
                      const RequiredPermissionsWidget(),
                      SizedBox(height: 25.w),
                      const OptionPermissionsWidget(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48.w,
                child: TextButton(
                  onPressed: () {
                    PermissionService.to.handlePermissionOnPressed();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: ColorPath.PrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    '동의하고 계속하기',
                    style: TextPath.TextF14W600.copyWith(
                      color: ColorPath.TextWhite,
                    ),
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

/// 필수 접근 권한 위젯
class RequiredPermissionsWidget extends GetView<PermissionController> {
  const RequiredPermissionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.permissionRequiredList.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '필수 접근 권한',
                style: TextPath.TextF14W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              SizedBox(height: 25.w),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.permissionRequiredList.length,
                itemBuilder: (context, index) {
                  return PermissionContentWidget(
                    index: index,
                    permissionList: controller.permissionRequiredList,
                  );
                },
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

/// 선택 접근 권한 위젯
class OptionPermissionsWidget extends GetView<PermissionController> {
  const OptionPermissionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.permissionOptionList.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '선택 접근 권한',
                style: TextPath.TextF14W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              SizedBox(height: 25.w),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.permissionOptionList.length,
                itemBuilder: (context, index) {
                  return PermissionContentWidget(
                    index: index,
                    permissionList: controller.permissionOptionList,
                  );
                },
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

/// 권한 동의 내용 위젯
class PermissionContentWidget extends StatelessWidget {
  final int index;
  final List<PermissionModel> permissionList;

  const PermissionContentWidget({
    super.key,
    required this.index,
    required this.permissionList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: ColorPath.Background1HECEFF1,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              permissionList[index].image!,
              width: 19.w,
              height: 19.w,
            ),
          ),
          SizedBox(width: 18.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                permissionList[index].title,
                style: TextPath.TextF14W500,
              ),
              Text(
                permissionList[index].description,
                style: TextPath.TextF12W400.copyWith(
                  color: ColorPath.TextGrey2H424242,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
