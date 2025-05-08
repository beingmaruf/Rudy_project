import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rudy_project/app/features/auth/widgets/common_app_bar.dart';
import 'package:rudy_project/theme/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<_MenuEntry> _menuEntries = const [
    _MenuEntry(
      label: 'Ubah Akun',
      iconPath: 'assets/icons/square_user_icon.svg',
    ),
    _MenuEntry(
      label: 'Riwayat Transaksi',
      iconPath: 'assets/icons/clipboard_notes.svg',
    ),
    _MenuEntry(
      label: 'Pengaturan',
      iconPath: 'assets/icons/settings_icon.svg',
    ),
    _MenuEntry(
      label: 'Bantuan',
      iconPath: 'assets/icons/lightbulb_icon.svg',
    ),
    _MenuEntry(
      label: 'Kebijakan Privasi',
      iconPath: 'assets/icons/shield_icon.svg',
    ),
    _MenuEntry(
      label: 'Syarat dan Ketentuan',
      iconPath: 'assets/icons/file_info_icon.svg',
    ),
    _MenuEntry(
      label: 'Keluar',
      iconPath: 'assets/icons/signout_icon.svg',
      isDestructive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: 'Akun Saya', iconPath: 'assets/icons/notification_icon.svg',),

      body: Column(
        children: [
          Container(
            height: 182,
            width: 343,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: commonColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset('assets/icons/user_icon.svg'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Kasir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Alex Parkinson',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _menuEntries.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = _menuEntries[index];
                return ListTile(
                  leading: SvgPicture.asset(
                    item.iconPath,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right, size: 24),
                  onTap: () {
                    // TODO: handle navigation
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// simple data-holder for each menu row
class _MenuEntry {
  final String label;
  final String iconPath;
  final bool isDestructive;
  const _MenuEntry({
    required this.label,
    required this.iconPath,
    this.isDestructive = false,
  });
}