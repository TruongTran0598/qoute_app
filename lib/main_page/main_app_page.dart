import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qoute_app/category_screen/category_screen.dart';
import 'package:qoute_app/common/common_colors/app_colors.dart';
import 'package:qoute_app/constant.dart';
import 'package:qoute_app/create_status/create_status_page.dart';
import 'package:qoute_app/home_screen/home_page.dart';
import 'package:qoute_app/personal_screen/personal_screen.dart';
import 'package:qoute_app/search_screen/search_screen.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  late PageController _pageController;
  int _selectedIndex = 0;
  String _nameScreen = "Trang chủ";

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    PersonalScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      if (index == 0) {
        _nameScreen = "Trang chủ";
      }
      if (index == 1) {
        _nameScreen = "Danh mục";
      }
      if (index == 2) {
        _nameScreen = "Cá nhân";
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _nameScreen,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: k24Size,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateStatusPage(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(k20Size),
            child: Padding(
              padding: kPadding08.copyWith(top: 0, bottom: 0),
              child: const Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(k20Size),
            child: Padding(
              padding: kPadding08.copyWith(top: 0, bottom: 0),
              child: const Icon(
                CupertinoIcons.search,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
          ),
          const SizedBox(width: k08Size),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rectangle_3_offgrid_fill),
            label: "Danh mục",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt),
            label: "Cá nhân",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
