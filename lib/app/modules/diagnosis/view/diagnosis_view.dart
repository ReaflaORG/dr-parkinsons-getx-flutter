import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/diagnosis_controller.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          centerTitle: false,
          elevation: 0,
          shadowColor: Colors.white,
          title: Text(
            '파킨슨 자가진단',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorPath.PrimaryLightColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40.w,
                            child: SizedBox(
                              width: 24.w,
                              height: 24.w,
                              child: Image.asset(
                                  'assets/images/icons/2d/24false.png'),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '매우 그렇다.',
                              style: TextPath.TextF16W500.copyWith(
                                color: ColorPath.TextGrey2H424242,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: 320,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorPath.PrimaryLightColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: ColorPath.PrimaryLightColor),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 40.w,
                            child: SizedBox(
                              width: 24.w,
                              height: 24.w,
                              child: Image.asset(
                                  'assets/images/icons/2d/24true.png'),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            '매우 그렇다.',
                            style: TextPath.TextF16W500.copyWith(
                              color: ColorPath.TextGrey2H424242,
                            ),
                          )),
                        ],
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
