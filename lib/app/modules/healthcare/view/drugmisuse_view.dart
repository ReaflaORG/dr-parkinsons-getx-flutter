import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/drugmisuse_controller.dart';
import '../widgets/drugmisuse_infobox.dart';

/// 주의해야할 약 검색
class DrugMisuseView extends GetView<DrugMisuseController> {
  const DrugMisuseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(74.w),
        child: AppBar(
          toolbarHeight: 84,
          backgroundColor: ColorPath.TertiaryLightColor,
          leadingWidth: 60,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20,
            ).w,
            child: CircleAvatar(
              backgroundColor: ColorPath.BackgroundWhite,
              radius: 24,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          shadowColor: Colors.white,
          title: Text(
            '주의해야할 약 검색',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 58.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorPath.TertiaryLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(36).r,
                  bottomRight: const Radius.circular(36).r,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                width: 320.w,
                height: 42.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(30).r,
                  ),
                  color: ColorPath.BackgroundWhite,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16.w),
                    InkWell(
                      onTap: () async {
                        await controller.onHandleSearch(
                          controller
                              .drugmisuseTextFormFieldController.value.text,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          width: 22.w,
                          height: 22.w,
                          'assets/images/icons/2d/24search.png',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Form(
                        key: controller.globalFormKey.value,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: controller
                              .drugmisuseTextFormFieldController.value,
                          focusNode: controller
                              .drugmisuseTextFormFieldFocusScopeNode.value,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ).w,
                            hintText: '약품명 또는 약제명을 입력하세요',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(4.0).r,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(4.0).r,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(4.0).r,
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          // validator: (String? value) {
                          //   // return controller.handleValidator(
                          //   //   type: 'email',
                          //   //   value: value!,
                          //   // );
                          // },
                          // onChanged: (String text) {
                          //   // Logger().d(text);
                          //   // controller.handleSearchFieldOnChanged(
                          //   //   value: text,
                          //   // );
                          //   controller.handleSearchFieldOnChanged(
                          //     value: text,
                          //   );
                          // },
                          onFieldSubmitted: (value) async {
                            await controller.onHandleSearch(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 320.w,
              child: TextDropdownFormField(
                options: controller.drugMisuseList,
                onChanged: (String value) {
                  controller.onHandleSearch(value);
                },
                // decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     suffixIcon: Icon(Icons.arrow_drop_down),
                //     labelText: "Gender",),
                dropdownHeight: 120,
              ),
            ),
            controller.isSearch.value
                ? const SearchAfterWigdet()
                : const SearchBeforeWidget(),
          ],
        ),
      ),
    );
  }
}

/// 검색 후 위젯
class SearchBeforeWidget extends GetView<DrugMisuseController> {
  const SearchBeforeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: controller.boxesData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index == 0
                        ? SizedBox(height: 20.w)
                        : const SizedBox.shrink(),
                    DrugMisuseInfoBox(
                      box: controller.boxesData[index],
                    ),
                    SizedBox(height: 20.w),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 검색 전 위젯
class SearchAfterWigdet extends GetView<DrugMisuseController> {
  const SearchAfterWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: controller.boxesSearchData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30).w,
              child: InkWell(
                onTap: () => Get.dialog(
                  GlobalDrugmisuseModalWidget(
                    medicineName:
                        controller.boxesSearchData[index].medicineName,
                    isFound: true,
                    okOnPressed: () {
                      Get.back();
                    },
                  ),
                ),
                child: Container(
                  margin: index == 0
                      ? const EdgeInsets.only(top: 20, bottom: 14).w
                      : const EdgeInsets.only(bottom: 14).w,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ).w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorPath.Background1HECEFF1,
                    ),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(6).r,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 26.w,
                        height: 20.w,
                        child: Image.asset(
                          width: 18.w,
                          height: 18.w,
                          'assets/images/icons/2d/18checker.png',
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20.w,
                                  child: Text(
                                    controller
                                        .boxesSearchData[index].medicineName,
                                    style: TextPath.TextF14W500.copyWith(
                                      color: ColorPath.TextGrey1H212121,
                                    ),
                                  ),
                                ),
                                // const Spacer(),
                                Text(
                                  controller
                                      .boxesSearchData[index].medicineMaker,
                                  style: TextPath.TextF12W400.copyWith(
                                    color: ColorPath.TextGrey4H9E9E9E,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 20.w,
                              child: Text(
                                '#${controller.boxesSearchData[index].symptomName} ${controller.boxesSearchData[index].medicineKoTag.map((e) => '#$e').toList().join(' ')} ',
                                style: TextPath.TextF13W400.copyWith(
                                  color: ColorPath.TextGrey3H616161,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
