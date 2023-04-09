import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
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
          Container(
            width: 320.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: controller.handleColorBoxDecoration(index: index),
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: GlobalInkWellWidget(
              borderRadius: 8.r,
              onTap: () async {
                if (controller.current_index.value ==
                    controller.dateList.length - 1) {
                  await Future.wait([
                    controller.updateTime(
                      controller.missionData[index].mission_time,
                      controller.missionData[index].mission_time_string,
                    ),
                    controller.updateType(
                      controller.missionData[index].mission_type,
                    ),
                    GlobalMissionUpdateAlarm(
                      // context: context,
                      id: controller.missionData[index].mission_id,
                      isStatus: controller.missionData[index].status == '대기'
                          ? false
                          : true,
                    ),
                  ]);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (controller.missionData[index].mission_type == '투약')
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.Border2HECEFF1,
                          child: Image.asset(
                            'assets/images/icons/3d/48pill.png',
                            width: 28.w,
                            height: 28.w,
                            cacheWidth: 64,
                            cacheHeight: 63,
                          ),
                        ),
                      )
                    else if (controller.missionData[index].mission_type ==
                        '물마시기')
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.Border2HECEFF1,
                          child: Image.asset(
                            width: 28.w,
                            height: 28.w,
                            'assets/images/icons/3d/36water.png',
                          ),
                        ),
                      )
                    else if (controller.missionData[index].mission_type ==
                        '과일야채')
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.Border2HECEFF1,
                          child: Image.asset(
                            width: 28.w,
                            height: 28.w,
                            'assets/images/icons/3d/36vegi.png',
                          ),
                        ),
                      )
                    else if (controller.missionData[index].mission_type ==
                        '야외활동')
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.Border2HECEFF1,
                          child: Image.asset(
                            width: 28.w,
                            height: 28.w,
                            'assets/images/icons/3d/36outdoor.png',
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: CircleAvatar(
                          backgroundColor: ColorPath.Border2HECEFF1,
                          child: Image.asset(
                            width: 28.w,
                            height: 28.w,
                            'assets/images/icons/3d/36heart.png',
                          ),
                        ),
                      ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        controller.missionData[index].mission_type,
                        style: TextPath.TextF16W500.copyWith(
                            color: ColorPath.TextGrey3H616161),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.w,
                      ),
                      decoration: BoxDecoration(
                        color: controller.handleColorBoxDecoration(
                          type: 'card_color',
                          index: index,
                        ),
                        borderRadius: BorderRadius.circular(4).r,
                      ),
                      child: Text(
                        controller.missionData[index].status!,
                        style: TextPath.TextF12W500.copyWith(
                          color: ColorPath.TextGrey3H616161,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(controller.missionData[index].mission_time_string),
                    Checkbox(
                      value: controller.missionData[index].clear,
                      onChanged: (bool? value) async {
                        if (controller.current_index.value ==
                            controller.dateList.length - 1) {
                          await controller.clearMission(
                            mission_id:
                                controller.missionData[index].mission_id,
                            index: index,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.w),
        ],
      ),
    );
  }
}
