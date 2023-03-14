import 'package:flutter/material.dart';
import 'package:qoute_app/common/common_widgets/widget_item_post_common.dart';
import 'package:qoute_app/constant.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: kPadding16,
      itemBuilder: (context, index) {
        return const WidgetItemStatusCommon();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: k16Size);
      },
      itemCount: 10,
    );
  }
}
