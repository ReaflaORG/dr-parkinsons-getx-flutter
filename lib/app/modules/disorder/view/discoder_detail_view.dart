import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/video/video_view.dart';
import '../controller/disorder_detail_controller.dart';

class DiscoderDetailView extends GetView<DisorderDetailController> {
  const DiscoderDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VideoView(
      content_url: controller.arguments,
    );
  }
}
