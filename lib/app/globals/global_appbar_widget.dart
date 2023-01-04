import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/color_path.dart';
import '../theme/text_path.dart';

/// 글로벌 앱바 위젯
///
/// [appBar] AppBar
///
/// [title] String
///
/// [elevation] double
///
/// [center] bool
///
/// [leadingIcon] Icon
///
/// [isLeadingVisible] bool
///
/// [onBack] Function?
///
/// [actions] List<Widget>??
class GlobalAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GlobalAppBarWidget({
    super.key,
    required this.title,
    required this.appBar,
    this.elevation = 0,
    this.backgroundColor = Colors.white,
    this.leadingIcon = const Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 24,
    ),
    this.toolbarHeight = 62,
    this.titleSpacing = 20,
    this.isLeadingVisible = false,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
    this.onBack,
    this.actions,
  });

  final AppBar appBar;
  final String title;
  final double elevation;
  final Color backgroundColor;
  final Icon leadingIcon;
  final double toolbarHeight;
  final double titleSpacing;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final bool isLeadingVisible;
  final Function? onBack;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(62.w);

  @override
  Widget build(BuildContext context) {
    // PreferredSize(
    //   preferredSize: Size.fromHeight(62.w),
    //   child:
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight.w,
      automaticallyImplyLeading: automaticallyImplyLeading,
      titleSpacing: titleSpacing.w,
      leading: !isLeadingVisible
          ? IconButton(
              padding: EdgeInsets.zero,
              icon: leadingIcon,
              onPressed: () => onBack != null ? onBack!() : Get.back(),
            )
          : null,
      title: Text(
        title,
        style: TextPath.Heading2F18W600.copyWith(
          color: ColorPath.TextGrey1H212121,
        ),
        textAlign: TextAlign.left,
      ),
      actions: actions ?? [],
    );
  }
}
