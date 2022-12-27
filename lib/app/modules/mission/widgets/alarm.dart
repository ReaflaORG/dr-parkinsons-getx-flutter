import 'package:dr_parkinsons/app/theme/color_path.dart';
import 'package:dr_parkinsons/app/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alarm extends StatelessWidget {
  final Function ontap;
  final String imageUrl;
  final String text;
  final bool isPick;
  const Alarm({
    super.key,
    required this.ontap,
    required this.imageUrl,
    required this.text,
    required this.isPick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () async {
            await ontap();
          },
          child: CircleAvatar(
              backgroundColor: isPick
                  ? ColorPath.TertiaryLightColor
                  : ColorPath.BackgroundWhite,
              child: Image.asset(width: 32.w, height: 32.w, imageUrl)),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextPath.TextF12W500.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
      ]),
    );
  }
}
