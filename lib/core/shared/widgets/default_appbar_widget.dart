import 'package:flutter/material.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @required
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? height;
  final double? elevation;
  final Widget? leading;
  final Color? backGroundColor;
  const DefaultAppBarWidget(
      {Key? key,
      required this.title,
      this.actions,
      this.leading,
      this.backGroundColor,
      this.height,
      this.elevation,
      this.bottom})
      : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      elevation: elevation ?? 0,
      actionsIconTheme: Theme.of(context).iconTheme,
      iconTheme: Theme.of(context).iconTheme,
      toolbarTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: actions,
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white)
                .color),
      ),
      leading: leading != null
          ? GestureDetector(child: leading, onTap: () => Navigator.pop(context))
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
