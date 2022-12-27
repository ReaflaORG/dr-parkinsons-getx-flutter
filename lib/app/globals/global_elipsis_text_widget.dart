import 'package:flutter/material.dart';

import '../theme/texts.dart';

/// 글로벌 이클립스 텍스트 위젯
///
/// [text] String
///
/// [ellipsis] String
///
/// [maxLines] int
///
/// [isShowMore] bool?
///
/// [startScaleIsSmall] bool?
///
/// [splashFactory] InteractiveInkFeatureFactory?
///
/// [textDirection] TextDirection?
///
/// [style] TextStyle?

class GlobalEllipsisTextWidget extends StatefulWidget {
  const GlobalEllipsisTextWidget({
    super.key,
    required this.text,
    this.textOverflow = TextOverflow.visible,
    this.textStyle,
    this.maxLines = 2,
    this.moreText = '...더보기',
    this.moreTextRight = 0,
    this.moreTextBottom = -1,
    this.moreTextWidth = 50,
    this.moreTextStyle = const TextStyle(
      // fontSize: 14.sp,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    required this.onTap,
  });

  final String text;
  final TextOverflow? textOverflow;
  final TextStyle? textStyle;
  final int? maxLines;
  final String? moreText;
  final double? moreTextRight;
  final double? moreTextBottom;
  final double moreTextWidth;
  final TextStyle? moreTextStyle;
  final void Function() onTap;

  @override
  State<GlobalEllipsisTextWidget> createState() =>
      _GlobalEllipsisTextWidgetState();
}

class _GlobalEllipsisTextWidgetState extends State<GlobalEllipsisTextWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;
  bool _isVisible = true;
  bool _isVisible2 = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    animationOffset = Tween<Offset>(
      begin: const Offset(0.0, -0.01),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    Future.delayed(const Duration(milliseconds: 250), () {
      animationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isVisible = false;
        });
      },
      child: LayoutBuilder(
        builder: (context, size) {
          // 텍스트 페인터를 사용하여 최대 라인을 초과하는지 확인
          TextPainter textPainter = TextPainter(
            maxLines: widget.maxLines,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            text: TextSpan(
              text: widget.text,
              style: widget.textStyle ?? TextPath.TextF14W500.copyWith(),
            ),
          );

          // 레이아웃 함수로 넓이 값 전달
          textPainter.layout(maxWidth: size.maxWidth);

          // 텍스트가 스크린 끝에 닿았는지
          _isVisible2 = textPainter.didExceedMaxLines;

          return _isVisible && _isVisible2
              ? Stack(
                  children: [
                    Text(
                      widget.text,
                      maxLines: widget.maxLines,
                      overflow: widget.textOverflow,
                      style: widget.textStyle,
                    ),
                    // Positioned(
                    //   right: widget.moreTextRight,
                    //   bottom: widget.moreTextBottom,
                    //   child: Container(
                    //     alignment: Alignment.centerRight,
                    //     width: widget.moreTextWidth.w,
                    //     color: Colors.white,
                    //     child: Text(
                    //       widget.moreText!,
                    //       style: widget.moreTextStyle,
                    //     ),
                    //   ),
                    // ),
                  ],
                )
              : InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    widget.text,
                    style: widget.textStyle,
                  ),
                );
          // return FadeTransition(
          //   opacity: animationController,
          //   child: SlideTransition(
          //     position: _animationOffset,
          //     child: _isVisible && _isVisible2
          //         ? Stack(
          //             children: [
          //               Text(
          //                 widget.text,
          //                 maxLines: widget.maxLines,
          //                 overflow: widget.textOverflow,
          //                 style: widget.textStyle,
          //               ),
          //               Positioned(
          //                 right: widget.moreTextRight,
          //                 bottom: widget.moreTextBottom,
          //                 child: Container(
          //                   alignment: Alignment.centerRight,
          //                   width: widget.moreTextWidth,
          //                   color: Colors.white,
          //                   child: Text(
          //                     widget.moreText!,
          //                     style: widget.moreTextStyle,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           )
          //         : Text(
          //             widget.text,
          //             style: widget.textStyle,
          //           ),
          //   ),
          // );
        },
      ),
    );
  }
}
