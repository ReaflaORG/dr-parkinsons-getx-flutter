import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/mission_controller.dart';

class MissionCard extends StatelessWidget {
  final String cardName;
  final String cardStatus;
  final DateTime time;
  const MissionCard({
    super.key,
    required this.cardName,
    required this.cardStatus,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color cardColor;
    if (cardStatus == '대기') {
      cardColor = ColorPath.PrimaryLightColor;
      backgroundColor = ColorPath.PrimaryLightColor;
    } else if (cardStatus == '실패') {
      cardColor = ColorPath.TertiaryLightColor;
      backgroundColor = ColorPath.TertiaryLightColor.withOpacity(0.2);
    } else {
      cardColor = ColorPath.Background2HD9D9D9;
      backgroundColor = ColorPath.Background2HD9D9D9.withOpacity(0.4);
    }
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                height: 40.h,
                child: CircleAvatar(
                  backgroundColor: ColorPath.Border2HECEFF1,
                  child: Image.asset(
                    width: 28.w,
                    height: 28.h,
                    'assets/images/medicine/pill0103.jpg',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 79.w,
                height: 20.h,
                child: Text(
                  cardName,
                  style: TextPath.TextF16W500.copyWith(
                      color: ColorPath.TextGrey3H616161),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  cardStatus,
                  style: TextPath.TextF12W500.copyWith(
                    color: ColorPath.TextGrey3H616161,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('12: 00'),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  MissionController.to.changeCheckBox();
                },
                child: MissionController.to.box.value,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
