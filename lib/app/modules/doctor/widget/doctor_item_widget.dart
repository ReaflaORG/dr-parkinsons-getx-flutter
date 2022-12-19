import 'package:base/app/models/doctor_model.dart';
import 'package:base/app/modules/doctor/view/doctor_content_viedo_player.dart';
import 'package:base/app/utils/formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

// doctor item widget
class DoctorItemWidget extends StatelessWidget {
  const DoctorItemWidget({
    super.key,
    required this.item,
  });
  final DoctorContent item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DoctorContentView(content_url: item.content));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(item.contentThumbnail!),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset('assets/doctor/video_play_button.png'),
            ),
            SizedBox(height: 6.w),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
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
                    padding: EdgeInsets.only(left: 10.w),
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


// class ImageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         height: 222,
//         width: double.infinity,
//         padding: EdgeInsets.only(left: 10.w, right: 10.w),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.transparent,
//             image: DecorationImage(
//                 image: ExactAssetImage('assets/doctor/doctor_1.png'),
//                 fit: BoxFit.cover)),
//       ),
//     );
//   }
// }
