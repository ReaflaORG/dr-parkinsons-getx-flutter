import 'package:base/app/globals/global_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/mission_controller.dart';

class MissionCard extends GetView<MissionController> {
  final int index;

  const MissionCard({
    super.key,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          InkWell(
            onTap: () async {
              if (controller.current_index.value ==
                  controller.dateList.length - 1) {
                controller.updateTime(
                    controller.missionData[index].mission_time.toString());
                await controller
                    .updateType(controller.missionData[index].mission_type);
                GlobalUpdateAlarm(
                  context: context,
                  id: controller.missionData[index].mission_id,
                );
              }
            },
            child: Container(
              width: 320.w,
              height: 52.h,
              decoration: BoxDecoration(
                color: controller.handleColorBoxDecoration(index: index),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.missionData[index].mission_type == '투약')
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CircleAvatar(
                        backgroundColor: ColorPath.Border2HECEFF1,
                        child: Image.asset(
                          width: 28.w,
                          height: 28.h,
                          'assets/images/icons/3d/48pill.png',
                        ),
                      ),
                    )
                  else if (controller.missionData[index].mission_type == '물마시기')
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CircleAvatar(
                        backgroundColor: ColorPath.Border2HECEFF1,
                        child: Image.asset(
                          width: 28.w,
                          height: 28.h,
                          'assets/images/icons/3d/36water.png',
                        ),
                      ),
                    )
                  else if (controller.missionData[index].mission_type == '과일야채')
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CircleAvatar(
                        backgroundColor: ColorPath.Border2HECEFF1,
                        child: Image.asset(
                          width: 28.w,
                          height: 28.h,
                          'assets/images/icons/3d/36vegi.png',
                        ),
                      ),
                    )
                  else if (controller.missionData[index].mission_type == '야외활동')
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CircleAvatar(
                        backgroundColor: ColorPath.Border2HECEFF1,
                        child: Image.asset(
                          width: 28.w,
                          height: 28.h,
                          'assets/images/icons/3d/36outdoor.png',
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: CircleAvatar(
                        backgroundColor: ColorPath.Border2HECEFF1,
                        child: Image.asset(
                          width: 28.w,
                          height: 28.h,
                          'assets/images/icons/3d/36heart.png',
                        ),
                      ),
                    ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 79.w,
                    height: 20.h,
                    child: Text(
                      controller.missionData[index].mission_type,
                      style: TextPath.TextF16W500.copyWith(
                          color: ColorPath.TextGrey3H616161),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: controller.handleColorBoxDecoration(
                        type: 'card_color',
                        index: index,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      controller.missionData[index].status!,
                      style: TextPath.TextF12W500.copyWith(
                        color: ColorPath.TextGrey3H616161,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(controller.missionData[index].mission_time > 1000
                      ? '''${controller.missionData[index].mission_time.toString().substring(0, 2)}:${controller.missionData[index].mission_time.toString().substring(2, 4)}'''
                      : '''${controller.missionData[index].mission_time.toString().substring(0, 1)}:${controller.missionData[index].mission_time.toString().substring(1, 3)}'''),
                  const SizedBox(width: 10),
                  Checkbox(
                    value: controller.missionData[index].clear,
                    onChanged: (bool? value) async {
                      if (controller.current_index.value ==
                          controller.dateList.length - 1) {
                        await controller.clearMission(
                          mission_id: controller.missionData[index].mission_id,
                          index: index,
                        );
                      }
                    },
                  ),
                  // GestureDetector(
                  //   behavior: HitTestBehavior.translucent,
                  //   onTap: ()  {
                  //      MissionController.to.changeCheckBox(index: index);
                  //   },
                  //   child: MissionController.to.box.value,
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
