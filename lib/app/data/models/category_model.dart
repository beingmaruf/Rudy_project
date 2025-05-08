import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rudy_project/app/features/auth/screens/penjualan_kategori.dart';
import 'package:rudy_project/app/features/auth/widgets/category_card.dart';

class Category {
  final String label;
  final String iconPath;
  final Widget? destinationScreen;

  const Category({
    required this.label,
    required this.iconPath,
    this.destinationScreen,
  });
}



final List<Category> _categories = [
  Category(
    label: 'Penjualan',
    iconPath: 'assets/icons/penjualan_icon.svg',
    destinationScreen: PenjualanKategoriScreen(),
  ),
  Category(
    label: 'Penyimpanan',
    iconPath: 'assets/icons/penyimpanan_icon.svg',
    destinationScreen: null, // not yet implemented
  ),
  Category(
    label: 'Pelanggan',
    iconPath: 'assets/icons/pelanggan_icon.svg',
    destinationScreen: null,
  ),
  Category(
    label: 'Pegawai',
    iconPath: 'assets/icons/pegawai_icon.svg',
    destinationScreen: null,
  ),
  Category(
    label: 'Produk',
    iconPath: 'assets/icons/produk_icon.svg',
    destinationScreen: null,
  ),
  Category(
    label: 'Laporan',
    iconPath: 'assets/icons/laporan_icon.svg',
    destinationScreen: null,
  ),
];


Widget _buildCategoryGrid() {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 1.5,
    children: _categories.map((category) => CategoryCard(category: category)).toList(),
  );
}



