import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rudy_project/app/features/auth/screens/home_screen.dart';
import 'package:rudy_project/app/features/auth/screens/keranjang.dart';
import 'package:rudy_project/app/features/auth/screens/profile_screen.dart';
import 'package:rudy_project/theme/style.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // Beranda
    const HomeScreen(), // Rekap Kas
    const KeranjangScreen(),
    const ProfileScreen(), // Akun
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          backgroundColor: commonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
          onPressed: () {},
          child: SvgPicture.asset(
            'assets/icons/qrcode_scan_icon.svg',
            width: 28,
            height: 28,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 80.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'assets/icons/beranda_icon.svg', 'Beranda'),
            _buildNavItem(1, 'assets/icons/RekapKas_icon.svg', 'Rekap Kas'),
            const SizedBox(width: 45),
            _buildNavItem(2, 'assets/icons/keranjang_icon.svg', 'Keranjang'),
            _buildNavItem(3, 'assets/icons/akun_icon.svg', 'Akun'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    return IconButton(
      onPressed: () => setState(() => _currentIndex = index),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: _currentIndex == index ? commonColor : Colors.grey,
              width: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: _currentIndex == index ? commonColor : Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
