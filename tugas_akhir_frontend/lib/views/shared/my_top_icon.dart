// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTopIcon extends StatelessWidget {
  const MyTopIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          size: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_bag,
            size: 30,
          ),
        )
      ],
    );
  }
}
