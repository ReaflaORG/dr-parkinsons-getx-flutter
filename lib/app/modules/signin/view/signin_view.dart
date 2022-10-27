import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/signin_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CarouselSliderWidget(),
                  SizedBox(height: 24.h),
                  const SocialLoginButtonWidget(),
                  SizedBox(height: 20.h),
                  const TermsGuideTextWidget(),
                ],
              ),
            ),
          ),
        ),
      );
}

/// * 온보딩 슬라이드 위젯
class CarouselSliderWidget extends GetView<SignInController> {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(height: 40.h),
            CarouselSlider(
              carouselController: controller.carouselController.value,
              items: List.generate(
                controller.carouselSlideData.length,
                (index) {
                  return Column(
                    children: [
                      Image.asset(
                        controller.carouselSlideData[index].image,
                        width: 320.w,
                        height: 200.h,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 38.h),
                      Text(
                        controller
                            .carouselSlideData[
                                controller.carouselSliderIndex.value]
                            .title,
                        textAlign: TextAlign.center,
                        style: TextPath.TextF16W700,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 50.h,
                        child: Text(
                          controller
                              .carouselSlideData[
                                  controller.carouselSliderIndex.value]
                              .description,
                          textAlign: TextAlign.center,
                          style: TextPath.TextF16W400.copyWith(
                            color: ColorPath.TextGrey3H616161,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              options: CarouselOptions(
                height: 323.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 3000),
                autoPlayAnimationDuration: const Duration(
                  milliseconds: 1000,
                ),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                onPageChanged: (int index, CarouselPageChangedReason value) {
                  controller.carouselSliderIndex.value = index;
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.carouselSlideData.length,
                (index) => Container(
                  width: 10.w,
                  height: 10.h,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.carouselSliderIndex.value ==
                            controller.carouselSlideData
                                .indexOf(controller.carouselSlideData[index])
                        ? ColorPath.TextGrey1H212121
                        : ColorPath.GreyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

/// * 소셜 로그인 버튼
class SocialLoginButtonWidget extends StatelessWidget {
  const SocialLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/main');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPath.Background3HFEE500,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/signin/kakao_logo.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        '카카오톡으로 계속하기',
                        style: TextPath.Heading3F16W600.copyWith(
                          color: ColorPath.TextGrey2H424242,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/main');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPath.TextGrey2H424242,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/signin/apple_logo.png',
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 15.w),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.3),
                        child: Text(
                          '애플로 계속하기',
                          style: TextPath.Heading3F16W600.copyWith(
                            color: ColorPath.TextWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

/// * 하단 약관 텍스트
class TermsGuideTextWidget extends StatelessWidget {
  const TermsGuideTextWidget({super.key});

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          text: '회원가입 시 파킨슨앱',
          children: [
            TextSpan(
              text: '서비스 이용 약관',
              style: TextPath.TextF10W400.copyWith(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
            const TextSpan(
              text: '과',
            ),
            TextSpan(
              text: '개인정보 보호정책',
              style: TextPath.TextF10W400.copyWith(
                color: ColorPath.TextGrey3H616161,
              ),
            ),
            const TextSpan(
              text: '에 동의하게 됩니다',
            ),
          ],
          style: TextPath.TextF10W400.copyWith(
            color: ColorPath.TextGrey4H9E9E9E,
          ),
        ),
      );
}
