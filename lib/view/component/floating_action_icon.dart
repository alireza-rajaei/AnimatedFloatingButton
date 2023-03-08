import 'package:floating_animation/view/component/sub_floating_action_menu.dart';
import 'package:flutter/material.dart';

class FloatingMenuIcon extends StatelessWidget {
  const FloatingMenuIcon({
    super.key,
    required this.rotation,
    required this.backgroundColor,
    required this.icon,
  });

  final double rotation;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()
        ..rotateZ(
          rotation,
        ),
      child: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: ClipPath(
          clipper: SubFloatingActionMenu(),
          child: Container(
            alignment: Alignment.center,
            color: backgroundColor,
            width: 80,
            height: 80,
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
