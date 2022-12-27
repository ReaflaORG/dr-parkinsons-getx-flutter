import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';

/// 보호자 알림 서비스 카드 위젯
class ProtectorCardWidget extends StatelessWidget {
  final int num;
  final String title;
  final String sub;

  const ProtectorCardWidget({
    super.key,
    required this.num,
    required this.title,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: 320.w,
          height: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: ColorPath.BackgroundWhite,
            boxShadow: [
              BoxShadow(
                color: ColorPath.PrimaryColor.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 36.w,
                height: 36.w,
                child: CircleAvatar(
                  backgroundColor: ColorPath.Background1HECEFF1,
                  child: Text(
                    num.toString(),
                    style: TextPath.TextF16W700.copyWith(
                      color: ColorPath.SecondaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey3H616161,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextPath.TextF16W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: ColorPath.SecondaryColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 18.w),
      ],
    );
  }
}
