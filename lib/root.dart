import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlinic/core/utils/app_colors.dart';
import 'package:qlinic/core/utils/size_config.dart';
import 'package:qlinic/features/book/book_view.dart';
import 'package:qlinic/features/chat/chat_view.dart';
import 'package:qlinic/features/home/presentation/view/home_view.dart';
import 'package:qlinic/features/favourite/favourite_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _pageController;
  late List<Widget> screens;
  int _selectedIndex = 0;

  ///list BottomNavigationBarItem
  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: '',
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
      ),
    );
  }

  @override
  void initState() {
    ///list screens
    screens = [HomeView(), BookView(), FavouriteView(), ChatView()];
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.sp),
          topRight: Radius.circular(30.sp),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.wihteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp),
            ),
          ),

          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _pageController.jumpToPage(_selectedIndex);
            },
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            iconSize: 20.sp,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: [
              _buildNavItem(CupertinoIcons.home, 0),
              _buildNavItem(Icons.book, 1),
              _buildNavItem(CupertinoIcons.heart, 2),
              _buildNavItem(CupertinoIcons.chat_bubble, 3),
            ],
          ),
        ),
      ),
    );
  }
}
