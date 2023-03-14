import 'package:flutter/material.dart';
import 'package:qoute_app/common/cavas/canvas_login_sign_up.dart';
import 'package:qoute_app/common/common_colors/app_colors.dart';
import 'package:qoute_app/common/common_images/image_assets.dart';
import 'package:qoute_app/common/common_text_style/text_style.dart';
import 'package:qoute_app/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/login_screen/login_screen.dart';
import 'package:qoute_app/main_page/main_app_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController userEmailCtrl;
  late TextEditingController userPhoneCtrl;
  late TextEditingController userNameCtrl;
  late TextEditingController userPseudonymCtrl;
  late TextEditingController userPasswordCtrl;

  @override
  void initState() {
    super.initState();
    userEmailCtrl = TextEditingController();
    userPhoneCtrl = TextEditingController();
    userNameCtrl = TextEditingController();
    userPseudonymCtrl = TextEditingController();
    userPasswordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userEmailCtrl.dispose();
    userPhoneCtrl.dispose();
    userNameCtrl.dispose();
    userPseudonymCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Color(0xFFf9c990),
      backgroundColor: AppColors.primaryColor,
      body: CustomPaint(
        painter: LoginScreenPainter(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: sizeHeight * 0.2,
                top: sizeHeight * 0.05,
                right: k16Size,
                left: k16Size,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: k16Size),
                    child: Image.asset(
                      AppImageAssets.imageLoginScreen,
                      width: sizeWidth * 0.2,
                    ),
                  ),
                  InputFieldCommon(
                    ctrlInputField: userEmailCtrl,
                    nameField: "Email",
                    isHasPoint: true,
                    isFirstField: true,
                  ),
                  InputFieldCommon(
                    ctrlInputField: userPhoneCtrl,
                    nameField: "Số điện thoại",
                    isHasPoint: true,
                  ),
                  InputFieldCommon(
                    ctrlInputField: userPseudonymCtrl,
                    nameField: "Bút danh",
                    isHasPoint: true,
                  ),
                  InputFieldCommon(
                    ctrlInputField: userPseudonymCtrl,
                    nameField: "Mật khẩu",
                    isHasPoint: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: k32Size,
                      bottom: k16Size,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainAppPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: sizeWidth * 0.5,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Đăng ký",
                          style: AppTextStyle.nunito20White,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Đăng nhập ",
                          style: AppTextStyle.nunito16Blue,
                        ),
                      ),
                      const Text(
                        "nếu bạn đã có tài khoản.",
                        style: AppTextStyle.nunito16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: sizeHeight * 0.05,
              left: sizeWidth * 0.075,
              child: Hero(
                tag: "primary_image",
                child: Image.asset(
                  AppImageAssets.imageAppPrimary,
                  width: sizeWidth * 0.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
