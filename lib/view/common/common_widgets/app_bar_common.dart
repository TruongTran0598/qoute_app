import 'package:flutter/material.dart';
import 'package:qoute_app/constant.dart';

class AppBarCommon extends StatefulWidget implements PreferredSizeWidget{
  final String titleAppbar;
  const AppBarCommon({Key? key, required this.titleAppbar}) : super(key: key);

  @override
  State<AppBarCommon> createState() => _AppBarCommonState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarCommonState extends State<AppBarCommon> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.titleAppbar,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: k20Size,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
