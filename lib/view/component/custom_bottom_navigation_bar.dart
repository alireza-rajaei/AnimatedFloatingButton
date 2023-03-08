import 'package:floating_animation/view/component/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xff1f2227),
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(.2),
              offset: const Offset(1, 0),
              blurRadius: 1),
        ],
      ),
      child: Row(
        children: const [
          CustomBottomNavigationBarItem(
            title: 'Home',
            icon: Icons.home,
          ),
          CustomBottomNavigationBarItem(
            title: 'Discover',
            icon: Icons.explore_outlined,
          ),
          Expanded(child: SizedBox.shrink()),
          CustomBottomNavigationBarItem(
            title: 'Favourite',
            icon: Icons.favorite_border,
          ),
          CustomBottomNavigationBarItem(
            title: 'Profile',
            icon: Icons.account_circle_outlined,
          ),
        ],
      ),
    );
  }
}
