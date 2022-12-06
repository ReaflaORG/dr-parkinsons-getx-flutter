import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/fact_controller.dart';

class FactView extends GetView<FactController> {
  const FactView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        (() => SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                    elevation: 0,
                    shadowColor: Colors.white,
                    title: Text(
                      '파킨슨 완전정복',
                      style: TextPath.Heading2F18W600.copyWith(
                        color: ColorPath.TextGrey1H212121,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  body: controller.process.value == false
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.factDatas.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed('/fact/factpost',
                                                arguments: {
                                                  'id': controller
                                                      .factDatas[index]
                                                      .parkinson_post_id
                                                });
                                          },
                                          child: Container(
                                            alignment: Alignment.bottomLeft,
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              bottom: 8,
                                            ),
                                            width: 320.w,
                                            height: 130.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  controller
                                                      .factDatas[index].image,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 2,
                                              ),
                                              color: ColorPath.PrimaryDarkColor
                                                  .withOpacity(0.8),
                                              child: Text(
                                                controller
                                                    .factDatas[index].title,
                                                style: TextPath.Heading3F16W600
                                                    .copyWith(
                                                  color:
                                                      ColorPath.BackgroundWhite,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 130),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink()),
            )),
      );
}
