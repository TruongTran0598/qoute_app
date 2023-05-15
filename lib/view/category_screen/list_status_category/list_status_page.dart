import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_widgets/widget_item_post_common.dart';
import 'package:qoute_app/constant.dart';

class ListStatusPage extends StatefulWidget {
  const ListStatusPage({Key? key}) : super(key: key);

  @override
  State<ListStatusPage> createState() => _ListStatusPageState();
}

class _ListStatusPageState extends State<ListStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cuộc sống", style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: k20Size,
        ),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.separated(
          padding: kPadding16,
          itemBuilder: (context, index) {
            return const WidgetItemStatusCommon();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: k16Size);
          },
          itemCount: 10,
        ),
      )
    );
  }
}
