import 'package:flutter/material.dart';
import 'package:random/view/chat/chatview.dart';
import 'package:random/view/home/homePage.dart';
import 'package:random/view/profile/Profile.dart';
import 'package:random/widgets/buildNavigation.dart';

// import home page file
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  //add widgets of all relevant screens here
  final List<Widget> _children = [
    HomePage(),
    ChatPage(),
    Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _children[index];
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //bottom navbar
      bottomNavigationBar:
          buildBottomNavigationBar(context, onTabTapped, _currentIndex),
    );
  }
}
