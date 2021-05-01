import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, void Function(int) onTap, int currentIndex) {
  return BottomNavigationBar(
    onTap: onTap,
    currentIndex: currentIndex,
    selectedFontSize: 14,
    selectedItemColor: Theme.of(context).primaryColor,
    unselectedItemColor: Colors.black,
    items: [
      new BottomNavigationBarItem(
        icon: Icon(Feather.home),
        label: 'Home',
      ),
      new BottomNavigationBarItem(
        icon: Icon(Feather.message_square),
        label: 'Chat',
      ),
      new BottomNavigationBarItem(
        icon: Icon(Feather.user),
        label: 'Profile',
      ),
    ],
  );
}
