import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/texts.dart';

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
    this.elevation = 1,
    this.center = true,
    this.leadingIcon = const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Colors.black,
      size: 24,
    ),
    this.isLeadingVisible = true,
    this.onBack,
    this.actions,
  });

  final AppBar appBar;
  final String title;
  final double elevation;
  final bool center;
  final Icon leadingIcon;
  final bool isLeadingVisible;
  final Function? onBack;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(38);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: elevation,
        leading: isLeadingVisible
            ? IconButton(
                padding: EdgeInsets.zero,
                icon: leadingIcon,
                onPressed: () =>
                    onBack != null ? onBack!() : Navigator.pop(context),
              )
            : const SizedBox.shrink(),
        // leading: Transform.scale(
        //   scale: 0.5,
        //   child: IconButton(
        //     padding: EdgeInsets.zero,
        //     icon: const Icon(
        //       Icons.arrow_back_ios_new_rounded,
        //       color: Colors.black,
        //       size: 44,
        //     ),
        //     // icon: Image.asset('assets/icons/btn_arrow_back.webp'),
        //     onPressed: () => Get.back(),
        //   ),
        // ),
        centerTitle: center,
        title: Text(
          title,
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
          textAlign: TextAlign.left,
        ),
        actions: actions ?? [],
      ),
    );
  }
}
