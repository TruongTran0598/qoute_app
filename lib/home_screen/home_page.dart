import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qoute_app/common/common_text_style/text_style.dart';
import 'package:qoute_app/common/common_widgets/widget_item_post_common.dart';
import 'package:qoute_app/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ItemSpecialPost(index: index);
            },
            itemCount: 5,
            itemWidth: double.infinity,
            itemHeight: 180,
            layout: SwiperLayout.TINDER,
          ),
          const Padding(
            padding: kPadding16,
            child: Text(
              "Mới nhất",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              return const WidgetItemStatusCommon();
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: k24Size),
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: kPadding16.copyWith(top: 0),
          ),
        ],
      ),
    );
  }
}

class ItemSpecialPost extends StatefulWidget {
  final int index;
  const ItemSpecialPost({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemSpecialPost> createState() => _ItemSpecialPostState();
}

class _ItemSpecialPostState extends State<ItemSpecialPost> {

  bool isLikePost = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: listGradientColors[widget.index],
        ),
      ),
      padding: kPadding16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Trên app store có rất nhiều trò chơi. bla bla. Nhưng trò chơi em thích nhất đó là trò chơi đùa tình cảm :))))",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.nunito20White,
          ),
          const Spacer(),
          Row(
            children: const [
              Icon(
                Icons.copyright,
                size: k16Size,
                color: Colors.white,
              ),
              Text(
                ": min1001",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.cara16White,
              ),
            ],
          ),
          InkWell(
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
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

