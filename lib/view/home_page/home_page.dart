import 'package:floating_animation/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

import '../component/custom_bottom_navigation_bar.dart';
import '../component/floating_action_icon.dart';
import '../component/list_view_item/post_item.dart';
import '../component/list_view_item/profile_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _paddingAnimation;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _circleColor;
  bool _showMenu = false;
  @override
  void initState() {
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: (pi * 1.5),
      end: pi * 2,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.linear,
      ),
    );

    _sizeAnimation = Tween<double>(
      begin: 60,
      end: 50,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.linear,
      ),
    );
    _paddingAnimation = Tween<double>(
      begin: 40,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.linear,
      ),
    );
    _iconColor = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_rotationController);

    _circleColor = ColorTween(
      begin: Colors.white,
      end: const Color(0xff404a53),
    ).animate(_rotationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff13161f),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 19, 21, 23),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.share_location_rounded,
                ),
              ),
            ],
            title: Text('Floating Button',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontSize: 16)),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProfileItem(
                                person: AppConstant.persons[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 24,
                            );
                          },
                          itemCount: AppConstant.persons.length),
                    ),
                    ListView.separated(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (conte, index) {
                          return PostItem(post: AppConstant.post[index]);
                        },
                        separatorBuilder: (conte, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: AppConstant.post.length),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                  animation: _rotationController,
                  builder: (context, _) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: _paddingAnimation.value),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 150,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              FloatingMenuIcon(
                                  backgroundColor: const Color(0xffda8c03),
                                  icon: Icons.enhance_photo_translate_rounded,
                                  rotation: _rotationAnimation.value -
                                      ((_rotationAnimation.value - pi * 1.5) /
                                          1.7)),
                              FloatingMenuIcon(
                                  backgroundColor: const Color(0xffd61844),
                                  icon: Icons.access_alarm_outlined,
                                  rotation: _rotationAnimation.value),
                              FloatingMenuIcon(
                                  backgroundColor: const Color(0xff7800f7),
                                  icon: Icons.handyman,
                                  rotation: _rotationAnimation.value +
                                      ((_rotationAnimation.value - pi * 1.5) /
                                          1.7)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              const Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavigationBar(),
              ),
              AnimatedBuilder(
                  animation: _rotationController,
                  builder: (context, _) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          if (_showMenu) {
                            _showMenu = false;
                            _rotationController.reverse();
                          } else {
                            _showMenu = true;
                            _rotationController.forward();
                          }
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(bottom: _paddingAnimation.value),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ(
                                _rotationAnimation.value +
                                    ((_rotationAnimation.value - pi * 1.5) /
                                        1.7),
                              ),
                            child: Container(
                              width: _sizeAnimation.value,
                              height: _sizeAnimation.value,
                              decoration: BoxDecoration(
                                color: _circleColor.value,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: _sizeAnimation.value / 2,
                                  color: _iconColor.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
