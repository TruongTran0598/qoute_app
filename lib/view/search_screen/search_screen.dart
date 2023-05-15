import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_widgets/app_bar_common.dart';
import 'package:qoute_app/view/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/view/common/common_widgets/widget_item_post_common.dart';
import 'package:qoute_app/constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchInputCtrl;

  @override
  void initState() {
    super.initState();
    searchInputCtrl = TextEditingController();
  }

  @override
  void dispose() {
    searchInputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCommon(titleAppbar: "Tìm kiếm"),
      body: Column(
        children: [
          Padding(
            padding: kPadding16.copyWith(top: 0, bottom: k08Size),
            child: InputFieldCommon(
              ctrlInputField: searchInputCtrl,
              nameField: "Tìm kiếm",
            ),
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
