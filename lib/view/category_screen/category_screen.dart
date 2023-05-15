import 'package:flutter/material.dart';
import 'package:qoute_app/view/category_screen/list_status_category/list_status_page.dart';
import 'package:qoute_app/view/common/common_text_style/text_style.dart';
import 'package:qoute_app/constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeWidthItem = MediaQuery.of(context).size.width - 44;

    return GridView.builder(
      padding: kPadding16.copyWith(top: k08Size),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: k12Size,
        mainAxisSpacing: k12Size,
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return itemCategory(sizeWidthItem);
      },
    );
  }

  Widget itemCategory(double sizeWidthItem) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListStatusPage(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: sizeWidthItem,
            height: sizeWidthItem * 0.5,
            padding: kPadding16.copyWith(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/quoteapp-b75e7.appspot.com/o/img_status_life.png?alt=media&token=cd4e376b-a48c-4ab3-84ac-f1cc3e2745e1",
            ),
          ),
          const Padding(
            padding: kPadding12,
            child: Text(
              "Cuộc sống",
              style: AppTextStyle.nunito16Bold,
            ),
          ),
        ],
      ),
    );
  }
}
