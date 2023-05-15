import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_widgets/widget_item_post_common.dart';
import 'package:qoute_app/constant.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: kPadding16,
      itemBuilder: (context, index) {
        return const WidgetItemStatusCommon(isMineStatus: true);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: k16Size);
      },
      itemCount: 10,
    );
  }
}
