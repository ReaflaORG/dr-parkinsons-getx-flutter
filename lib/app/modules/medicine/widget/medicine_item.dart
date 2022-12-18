import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

/// 약재 설명 : 이미지 + 설명글
class MedicineImageItem extends StatelessWidget {
  final String? assest;
  final String text;

  const MedicineImageItem({Key? key, this.assest, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (assest != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 6.w),
            child: Image.asset(
              assest!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .35,
              // height: 70.w,
            ),
          ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 12.w),
          child: Text(
            text,
            style: TextPath.TextF13W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),
      ],
    );
  }
}

/// 약재 Item title
class MedicineItemTitle extends StatelessWidget {
  final String text;

  const MedicineItemTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 34.w,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextPath.TextF14W400.copyWith(color: ColorPath.TextGrey4H9E9E9E),
      ),
    );
  }
}

/// 약재 Item description
class MedicineItemDescription extends StatelessWidget {
  final String text;

  const MedicineItemDescription({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextPath.TextF14W400Expand.copyWith(
            color: ColorPath.TextGrey1H212121),
      ),
    );
  }
}

/// 약재 Item Label 1
class MedicineItemLabel1 extends StatelessWidget {
  final String text;

  const MedicineItemLabel1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 30.w,
      child: Text(
        text,
        style: TextPath.TextF14W500.copyWith(color: ColorPath.TextGrey1H212121),
      ),
    );
  }
}

/// 약재 Item Label 2
class MedicineItemLabel2 extends StatelessWidget {
  final String text;

  const MedicineItemLabel2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 6.w),
      height: 30.w,
      child: Text(
        text,
        style: TextPath.TextF14W500.copyWith(color: ColorPath.PrimaryDarkColor),
      ),
    );
  }
}
