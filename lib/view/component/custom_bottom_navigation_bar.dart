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
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(.2),
              offset: const Offset(1, 0),
              blurRadius: 1),
        ],
      ),
      child: Row(
        children: [
          CustomBottomNavigationBarItem(
            title: 'Ana Sayfa',
            icon: Icons.home,
            onPressed: () {},
          ),
          CustomBottomNavigationBarItem(
            title: 'Hizmetler',
            icon: Icons.list,
            onPressed: () {},
          ),
          const Expanded(child: SizedBox.shrink()),
          CustomBottomNavigationBarItem(
            title: 'Mesajlar',
            icon: Icons.message,
            onPressed: () {},
          ),
          CustomBottomNavigationBarItem(
            title: 'Bildirimler',
            icon: Icons.notifications,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
