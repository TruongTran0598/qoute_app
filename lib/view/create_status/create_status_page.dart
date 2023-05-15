import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_widgets/app_bar_common.dart';
import 'package:qoute_app/view/common/common_widgets/bottom_button_common.dart';
import 'package:qoute_app/view/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/constant.dart';

class CreateStatusPage extends StatefulWidget {
  final bool isEditPost;

  const CreateStatusPage({
    Key? key,
    this.isEditPost = false,
  }) : super(key: key);

  @override
  State<CreateStatusPage> createState() => _CreateStatusPageState();
}

class _CreateStatusPageState extends State<CreateStatusPage> {
  late TextEditingController _titleStatusCtrl;
  late TextEditingController _contentStatusCtrl;
  late TextEditingController _pseudonymCtrl;
  late TextEditingController _categoryCtrl;

  @override
  void initState() {
    super.initState();
    _titleStatusCtrl = TextEditingController();
    _contentStatusCtrl = TextEditingController();
    _pseudonymCtrl = TextEditingController();
    _categoryCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCommon(
        titleAppbar:
            widget.isEditPost ? "Chỉnh sửa bài đăng" : "Tạo mới bài đăng",
      ),
      body: Column(
        children: [
          Expanded(child: listInputStatus()),
          BottomButtonCommon(
            nameButton: "Đăng tải",
            onTap: () {
              ///TODO: create new status
            },
          ),
        ],
      ),
    );
  }

  Widget listInputStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: k16Size),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputFieldCommon(
              ctrlInputField: _contentStatusCtrl,
              nameField: "Nội dung",
              isFirstField: true,
              isMultiline: true,
            ),
            InputFieldCommon(
              ctrlInputField: _titleStatusCtrl,
              nameField: "Tiêu đề",
            ),
            InputFieldCommon(
              ctrlInputField: _pseudonymCtrl,
              nameField: "Bút danh của bạn",
            ),
            InputFieldCommon(
              ctrlInputField: _categoryCtrl,
              nameField: "Thể loại",
            ),
          ],
        ),
      ),
    );
  }
}
