import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? iconPath;
  final VoidCallback? whereToGo;

  const CommonAppBar({
    super.key,
    required this.title,
    this.iconPath,
    this.whereToGo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          onPressed:() {
            whereToGo!();
          },
          icon: SvgPicture.asset(
            iconPath!,
            color: Colors.black,
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
