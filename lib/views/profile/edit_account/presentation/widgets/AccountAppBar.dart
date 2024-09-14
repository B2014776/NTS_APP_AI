import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
