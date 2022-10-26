import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/permission_controller.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Container(
            // padding: EdgeInsets.fromLTRB(43.w, 30.h, 43.w, 0.h),
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(43.w, 30.h, 43.w, 0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          // height: 52.h,
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
                                height: 38.67.h,
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
                                    height: 22.67.h,
                                    child: Image.asset(
                                      'assets/images/logo/logo_small@4x.png',
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
                                  SizedBox(height: 2.h),
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
                        Text(
                          '선택 접근 권한',
                          style: TextPath.TextF14W600.copyWith(
                            color: ColorPath.TextGrey1H212121,
                          ),
                        ),
                        SizedBox(height: 25.h),
                        Column(
                          children: List.generate(
                            controller.permissionList.length,
                            (index) => PermissionContentWidget(
                              index: index,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () {},
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
                ),
              ],
            ),
          ),
        ),
      );
}

class PermissionContentWidget extends StatelessWidget {
  final int index;

  const PermissionContentWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: index == 0 ? 0 : 25.h),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: ColorPath.Background1HECEFF1,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            )
          ],
        ),
      );
}
