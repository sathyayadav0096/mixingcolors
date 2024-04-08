import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final Function leadingOnPressed;
  final List<Widget> actions;

  const CommonAppBar({
    required Key key,
    required this.title,
    required this.leadingIcon,
    required this.leadingOnPressed,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade200,
      leading: IconButton(
        onPressed: (){},
        icon: Icon(leadingIcon),
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
