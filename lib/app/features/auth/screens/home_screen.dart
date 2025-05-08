import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rudy_project/app/features/auth/screens/keranjang.dart';
import 'package:rudy_project/app/features/auth/screens/penjualan_barang.dart';
import 'package:rudy_project/app/features/auth/screens/penjualan_kategori.dart';

import 'package:rudy_project/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<String> _carouselImages = [
    'assets/images/image_1.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
  ];


  final List<Map<String, dynamic>> _categories = [
    {
      'label': 'Penjualan',
      'icon': 'assets/icons/penjualan_icon.svg',
      'route': PenjualanKategoriScreen(),
    },
    {
      'label': 'Penyimpanan',
      'icon': 'assets/icons/penyimpanan_icon.svg',
      'route': PenjualanBarangScreen(),
    },
    {
      'label': 'Pelanggan',
      'icon': 'assets/icons/pelanggan_icon.svg',
      'route': KeranjangScreen(),
    },
    {
      'label': 'Pegawai',
      'icon': 'assets/icons/pegawai_icon.svg',
      'route': null,
    },
    {
      'label': 'Produk',
      'icon': 'assets/icons/produk_icon.svg',
      'route': null,
    },
    {
      'label': 'Laporan',
      'icon': 'assets/icons/laporan_icon.svg',
      'route': null,
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCarousel(),
              const SizedBox(height: 24),
              const Text(
                'Menu Kategori',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _buildCategoryGrid(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('John Doe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Kasir Toko A',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/notification_icon.svg'),
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    final pageController = PageController(
      viewportFraction: 0.87,
    );

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: PageView.builder(
        controller: pageController,
        // padEnds: true,
        itemCount: _carouselImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                _carouselImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildCategoryGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: _categories.map((cat) {
        return Material(
          color: Colors.white,
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              final screen = cat['route'];
              screen != null ? Get.to(screen): Get.snackbar('Coming Soon', '${cat['label']} belum tersedia');
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    cat['icon']!,
                    width: 32,
                    height: 32,
                  ),
                  const Spacer(),
                  Text(
                    cat['label']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    return IconButton(
      onPressed: () => setState(() => _currentNavIndex = index),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: _currentNavIndex == index ? commonColor : Colors.grey,
              width: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: _currentNavIndex == index ? commonColor : Colors.grey,
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

