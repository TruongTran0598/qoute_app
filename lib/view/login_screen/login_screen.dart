import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/cavas/canvas_login_sign_up.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';
import 'package:qoute_app/view/common/common_images/image_assets.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';

import 'package:qoute_app/view/common/common_widgets/input_field_common.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/view/main_page/main_app_page.dart';
import 'package:qoute_app/view/sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController userEmailPhoneNumberCtrl;
  late TextEditingController userPasswordCtrl;

  @override
  void initState() {
    super.initState();
    userEmailPhoneNumberCtrl = TextEditingController();
    userPasswordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    userEmailPhoneNumberCtrl.dispose();
    userPasswordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                    padding: const EdgeInsets.only(bottom: k32Size),
                    child: Image.asset(
                      AppImageAssets.imageLoginScreen,
                      width: sizeWidth * 0.2,
                    ),
                  ),
                  InputFieldCommon(
                    ctrlInputField: userEmailPhoneNumberCtrl,
                    nameField: "Email",
                    isHasPoint: true,
                    isFirstField: true,
                  ),
                  InputFieldCommon(
                    ctrlInputField: userPasswordCtrl,
                    nameField: "Mật khẩu",
                    isHasPoint: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: k32Size),
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
                          "Đăng nhập",
                          style: AppTextStyle.nunito20White,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: k32Size,
                      bottom: k08Size,
                    ),
                    child: Text(
                      "Đăng nhập với",
                      style: AppTextStyle.nunito20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: k16Size),
                    child: InkWell(
                      onTap: () {
                        ///TODO: sign up with google account
                      },
                      child: Image.asset(AppImageAssets.imageGoogle, width: 30),
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
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Đăng ký tài khoản ",
                          style: AppTextStyle.nunito16Blue,
                        ),
                      ),
                      const Text(
                        "nếu bạn là thành viên mới.",
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
