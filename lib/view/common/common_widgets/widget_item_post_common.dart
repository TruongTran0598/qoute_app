import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/view/create_status/create_status_page.dart';

class WidgetItemStatusCommon extends StatefulWidget {
  final bool isMineStatus;

  const WidgetItemStatusCommon({
    Key? key,
    this.isMineStatus = false,
  }) : super(key: key);

  @override
  State<WidgetItemStatusCommon> createState() => _WidgetItemStatusCommonState();
}

class _WidgetItemStatusCommonState extends State<WidgetItemStatusCommon> {
  bool isLikePost = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      width: double.infinity,
      height: 200,
      padding: kPadding16,
      child: Column(
        children: [
          const Expanded(
            child: Text(
              "Trên app store có rất nhiều trò chơi. bla bla. Nhưng trò chơi em thích nhất đó là trò chơi đùa tình cảm :))))",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.nunito20,
            ),
          ),
          Row(
            children: [
              const Text(
                "01/02/2023",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.cara16,
              ),
              const Spacer(),
              !widget.isMineStatus
                  ? const Icon(Icons.copyright, size: k16Size)
                  : const SizedBox(),
              !widget.isMineStatus
                  ? const Text(
                      ": min1001",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.cara16,
                    )
                  : const SizedBox(),
            ],
          ),
          const Divider(
            color: Colors.red,
          ),
          Row(
            children: [
              !widget.isMineStatus
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isLikePost = !isLikePost;
                        });
                      },
                      child: Padding(
                        padding: kPadding08.copyWith(top: 0),
                        child: isLikePost
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                color: AppColors.unSelectColor,
                              ),
                      ),
                    )
                  : const SizedBox(),
              widget.isMineStatus
                  ? InkWell(
                      onTap: optionOfPost,
                      child: Padding(
                        padding: kPadding08.copyWith(top: 0),
                        child: const Icon(
                          Icons.keyboard_control_sharp,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const Spacer(),
              InkWell(
                onTap: copyTextToClipboard,
                child: Padding(
                  padding: kPadding08.copyWith(top: 0),
                  child: const Icon(Icons.copy),
                ),
              ),
              InkWell(
                onTap: shareOption,
                child: Padding(
                  padding: kPadding08.copyWith(top: 0),
                  child: const Icon(Icons.share),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void copyTextToClipboard() {
    Clipboard.setData(
      const ClipboardData(text: "ahihihihihihihih text copy text"),
    ).then(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Mục đã được sao chép vào Bộ nhớ tạm",
            style: AppTextStyle.nunito16Black,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orangeAccent.withOpacity(0.2),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: kPadding16.copyWith(left: 48, right: 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(k24Size),
          ),
        ),
      ),
    );
  }

  void shareOption() async {
    FlutterShare.share(
      title: "ahihihihi",
    );
  }

  void optionOfPost() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(k24Size),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: kPadding16,
            child: Column(
              children: [
                optionButton(
                  Icons.edit,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateStatusPage(
                          isEditPost: true,
                        ),
                      ),
                    );
                  },
                  "Sửa bài đăng",
                  AppColors.primaryColor,
                ),
                const Divider(color: AppColors.primaryColor),
                optionButton(
                  Icons.delete,
                  () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text(
                            "Xoá bài đăng",
                            style: AppTextStyle.nunito20,
                          ),
                          content: const Text(
                            "Bạn chắc chắn muốn xoá bài đăng này chứ?",
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
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: const Text(
                                "Đồng ý",
                                style: AppTextStyle.nunito20,
                              ),
                              onPressed: () {
                                ///TODO: confirm action
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  "Xoá bài đăng",
                  Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget optionButton(
    IconData icon,
    void Function()? onTap,
    String title,
    Color colorIcon,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(k12Size),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: k04Size),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: k08Size),
              child: Icon(icon, color: colorIcon),
            ),
            Text(
              title,
              style: AppTextStyle.nunito16,
            ),
          ],
        ),
      ),
    );
  }
}
