// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/mainscreen_provider.dart';
import '../shared/bottom_nav.dart';
import 'account_page.dart';
import 'cart_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    CartPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: _pages[mainScreenNotifier.pageIndex],
          bottomNavigationBar: BottoNavBar(),
        );
      },
    );
  }
}
