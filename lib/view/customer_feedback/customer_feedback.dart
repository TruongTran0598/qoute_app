import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';
import 'package:qoute_app/view/common/common_widgets/app_bar_common.dart';
import 'package:qoute_app/view/common/common_widgets/bottom_button_common.dart';
import 'package:qoute_app/view/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/constant.dart';

class CustomerFeedBack extends StatefulWidget {
  const CustomerFeedBack({Key? key}) : super(key: key);

  @override
  State<CustomerFeedBack> createState() => _CustomerFeedBackState();
}

class _CustomerFeedBackState extends State<CustomerFeedBack> {
  late TextEditingController feedbackInputCtrl;

  @override
  void initState() {
    super.initState();
    feedbackInputCtrl = TextEditingController();
  }

  @override
  void dispose() {
    feedbackInputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCommon(
        titleAppbar: "Góp ý, phản hồi",
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: kPadding16,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Chào bạn, Min1001.\n\nTrong quá trình sử dụng ứng dụng. Nếu bạn có gặp bất kỳ vấn đề nào hoặc có ý tưởng góp ý. Xin vui lòng cho chúng tôi biết điểu đó.\n\nChúng tôi sẽ phản hồi bạn sớm nhất qua mail: minhtrong@gmail.com\n\nXin cảm ơn bạn. ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 11,
                      style: AppTextStyle.nunito20,
                    ),
                    const SizedBox(height: k16Size),
                    InputFieldCommon(
                      nameField: "Góp ý, phản hồi",
                      ctrlInputField: feedbackInputCtrl,
                      isFirstField: true,
                      isMultiline: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButtonCommon(
            nameButton: "Gửi",
            onTap: (){
              ///TODO: send feedback
            },
          ),
        ],
      )
    );
  }
}
