import 'package:bido/apps/home/screen/home_screen.dart';
import 'package:bido/apps/sell/sell_screen.dart';
import 'package:bido/apps/settings/settings_screen.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const [HomeScreen(), SellScreen(), SettingsScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        containerHeight: 65,
        items: [
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.home, size: 27),
            title: const Text('Home'),
            activeColor: KColor.primary,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.add, size: 27),
            title: const Text('Sell'),
            activeColor: KColor.primary,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.gear_alt_fill, size: 27),
            title: const Text('Settings'),
            activeColor: KColor.primary,
          ),
        ],
      ),
    );
  }
}
