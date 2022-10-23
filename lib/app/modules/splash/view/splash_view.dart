import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text('버튼'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ElevatedButton'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('OutlinedButton'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('TextButton'),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.abc_outlined),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text('인풋'),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: TextField(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text('체크박스'),
                  ),
                  Checkbox(
                    value: controller.isChecked.value,
                    onChanged: (value) {
                      controller.isChecked.value = value!;
                    },
                  ),
                  Switch(
                    value: controller.isChecked.value,
                    onChanged: (value) {
                      controller.isChecked.value = value;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: const Text('텍스트'),
                  ),
                  const Text(
                    'Text Default',
                  ),
                  const Text(
                    'Text style 적용',
                    style: TextStyle(
                      color: ColorPath.TextBodyColor,
                    ),
                  ),
                  Text(
                    'Text style 적용',
                    style: TextPath.bodyRegular
                        .copyWith(color: ColorPath.TextGrey4),
                    // style: TextPath.bodyMedium(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
