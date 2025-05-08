import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintText: "Cari Barang",
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              height: 24,
              width: 24,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/qrcode_scan_icon.svg',
                color: Colors.black,
                height: 24,
                width: 24,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}