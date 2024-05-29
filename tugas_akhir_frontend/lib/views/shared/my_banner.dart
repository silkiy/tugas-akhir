// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Banner.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
