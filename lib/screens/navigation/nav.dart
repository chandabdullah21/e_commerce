import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/profile/more_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/search/search_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
// import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const CartScreen(),
      const ProfileScreen(),
      const MoreScreen(),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _buildScreens(),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: const Text('Home'),
            icon: const Icon(
              EvaIcons.homeOutline,
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryColor,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: const Text('Search'),
            icon: const Icon(
              EvaIcons.searchOutline,
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryColor,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: const Text('Cart'),
            icon: const Icon(
              EvaIcons.shoppingCartOutline,
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryColor,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: const Text('Profile'),
            icon: const Icon(
              EvaIcons.personOutline,
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryColor,
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: const Text('More'),
            icon: const Icon(
              EvaIcons.menu2Outline,
            ),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}
