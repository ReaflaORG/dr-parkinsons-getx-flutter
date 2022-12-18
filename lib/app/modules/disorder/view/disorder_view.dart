import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/disorder_controller.dart';
import '../widget/player.dart';

class DisorderView extends GetView<DisorderController> {
  const DisorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        shadowColor: Colors.white,
        title: Text(
          '파킨슨 병 소개',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '파킨슨 병과 안내과정 소개',
                    style: TextPath.Heading2F18W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.disorderData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return YoutubePlayerWidget(
                      index: index,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
