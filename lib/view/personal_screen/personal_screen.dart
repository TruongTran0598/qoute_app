import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qoute_app/view/common/common_colors/app_colors.dart';
import 'package:qoute_app/view/personal_screen/first_tab/first_tab.dart';
import 'package:qoute_app/view/personal_screen/second_tab/second_tab.dart';
import 'package:qoute_app/view/personal_screen/third_tab/third_tab.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(CupertinoIcons.pencil_outline),
            ),
            Tab(
              icon: Icon(CupertinoIcons.heart_fill),
            ),
            Tab(
              icon: Icon(CupertinoIcons.rectangle_stack_badge_person_crop),
            ),
          ],
          indicatorColor: AppColors.primaryColor,
        ),
        const Divider(
          color: AppColors.bgBottomNavigatorColor,
          thickness: 2,
          height: 2,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              FirstTab(),
              SecondTab(),
              ThirdTab(),
            ],
          ),
        ),
      ],
    );
  }
}
