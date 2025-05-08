import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rudy_project/app/features/auth/widgets/common_app_bar.dart';
import 'package:rudy_project/app/features/auth/widgets/search_bar.dart';
import 'package:rudy_project/theme/style.dart';

import 'keranjang.dart';

class PenjualanKategoriScreen extends StatefulWidget {
  const PenjualanKategoriScreen({super.key});

  @override
  State<PenjualanKategoriScreen> createState() =>
      _PenjualanKategoriScreenState();
}

class _PenjualanKategoriScreenState extends State<PenjualanKategoriScreen> {
  final List<String> filters = [
    "Semua",
    "CUTLINE",
    "DEFENDER",
    "TRALYX",
  ];

  final List<String> categories = [
    "BIKE",
    "BIKE HELMETS",
    "RX/OPTICAL",
    "RUN",
    "OUTDOOR",
    "GOLF",
    "WATER SPORT",
    "PPE",
    "ACTIVE LIFESTYLE",
    "SNOW/DIRT",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: 'Kategori',
        iconPath: 'assets/icons/keranjang_icon.svg',
        whereToGo: () {
          Get.to(KeranjangScreen());
        }
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 48,
                child: Row(
                  children: filters.map((filter) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: BorderSide(color: Colors.black),
                        backgroundColor: Colors.white,
                        label: Text(
                          filter,
                          style: TextStyle(color: Colors.black),
                        ),
                        selected: filter == "Semua",
                        selectedColor: commonColor,
                        onSelected: (value) {},
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 16),
            CommonSearchBar(),
            SizedBox(height: 16),
            Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      ),
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text(
                          categories[index],
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        trailing: SvgPicture.asset('assets/icons/right_arrow_icon.svg'),
                        onTap: () {},
                      ),
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}


