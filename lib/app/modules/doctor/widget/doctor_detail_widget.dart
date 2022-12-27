import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../models/doctor_model.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../../../utils/formatter.dart';
import '../../../utils/video/video_view.dart';

/// 의사 상세 페이지
class DoctorDetailWidget extends StatelessWidget {
  const DoctorDetailWidget({
    super.key,
    required this.item,
  });
  final DoctorContent item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: GlobalInkWellWidget(
        borderRadius: 16.r,
        onTap: () {
          Get.to(() => VideoView(content_url: item.content));
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(item.contentThumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.asset('assets/doctor/video_play_button.png'),
            ),
            SizedBox(height: 6.w),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10).w,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Formmater.dateTimeFormatYYMMDD(item.createdAt),
                      style: TextPath.TextF13W500.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.w),
                  Container(
                    padding: const EdgeInsets.only(left: 10).w,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.title,
                      style: TextPath.TextF14W600.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
