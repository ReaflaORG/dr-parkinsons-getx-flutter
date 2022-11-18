import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class CheckList extends StatelessWidget {
  final int num;
  final String title;
  final String sub;

  const CheckList({
    super.key,
    required this.num,
    required this.title,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorPath.BackgroundWhite,
            boxShadow: [
              BoxShadow(
                color: ColorPath.PrimaryColor.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 36.w,
                height: 36.h,
                child: CircleAvatar(
                  backgroundColor: ColorPath.Background1HECEFF1,
                  child: Text(
                    num.toString(),
                    style: TextPath.TextF16W700.copyWith(
                      color: ColorPath.SecondaryColor,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey3H616161,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextPath.TextF16W500.copyWith(
                        color: ColorPath.TextGrey1H212121),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: ColorPath.SecondaryColor,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
