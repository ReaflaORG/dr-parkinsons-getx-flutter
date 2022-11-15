import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../model/doctor_item_model.dart';

// doctor item widget
class DoctorItemWidget extends StatelessWidget {
  const DoctorItemWidget({
    super.key,
    required this.onClick,
    required this.item,
  });
  final DoctorItemModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                ),
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
                        item.dateWritten,
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
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 222,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            image: DecorationImage(
                image: ExactAssetImage('assets/doctor/doctor_1.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
