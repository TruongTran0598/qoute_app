import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';
import 'package:qoute_app/view/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/view/customer_feedback/customer_feedback.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  State<ThirdTab> createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  late TextEditingController pseudonymCtrl;
  late TextEditingController yourNameCtrl;
  late TextEditingController emailCtrl;

  @override
  void initState() {
    super.initState();
    pseudonymCtrl = TextEditingController();
    yourNameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding16,
      child: Column(
        children: [
          InputFieldCommon(
            ctrlInputField: pseudonymCtrl,
            nameField: "Bút danh của bạn",
            isFirstField: true,
            isHasPoint: true,
          ),
          InputFieldCommon(
            ctrlInputField: yourNameCtrl,
            nameField: "Tên của bạn",
            isHasPoint: true,
          ),
          InputFieldCommon(
            ctrlInputField: emailCtrl,
            nameField: "Email của bạn",
            isHasPoint: true,
          ),
          const Spacer(),
          logoutAndLicense(),
        ],
      ),
    );
  }

  Widget logoutAndLicense() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text(
                    "Đăng xuất?",
                    style: AppTextStyle.nunito20,
                  ),
                  content: const Text(
                    "Bạn có chắc muốn đăng xuất khỏi tài khoản?",
                    style: AppTextStyle.nunito16,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text(
                        "Huỷ",
                        style: AppTextStyle.nunito20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text(
                        "Đăng xuất",
                        style: AppTextStyle.nunito20,
                      ),
                      onPressed: () {
                        ///TODO: confirm action
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(
            "Đăng xuất",
            style: AppTextStyle.nunito24RedBold,
          ),
        ),
        const SizedBox(height: k20Size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.copyright, size: k20Size, color: Colors.blueAccent),
            SizedBox(width: k04Size),
            Text(
              "Trần Minh Trường - min1001",
              style: AppTextStyle.nunito12Bold,
            ),
          ],
        ),
        const Text(
          "Version: 1.0.0",
          style: AppTextStyle.nunito12,
        ),
        const SizedBox(height: k08Size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Góp ý, phản hồi về ứng dụng vui lòng ",
              style: AppTextStyle.nunito12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerFeedBack(),
                  ),
                );
              },
              child: const Text(
                "gửi tại đây.",
                style: AppTextStyle.nunito12Blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
