import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'main_bottom_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _moveToNextScreen(context);
    super.initState();
  }

  Future<void> _moveToNextScreen(context) async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(MainBottomNavScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1F252F),
        body: Stack(
          children: [
            Center(child: SvgPicture.asset('assets/icons/logo.svg')),
          ],
        )
    );
  }
}
