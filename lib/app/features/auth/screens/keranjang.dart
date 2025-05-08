import 'package:flutter/material.dart';
import 'package:rudy_project/app/features/auth/widgets/common_app_bar.dart';
import 'package:rudy_project/app/features/auth/widgets/search_bar.dart';
import 'package:rudy_project/theme/style.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({super.key});

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  int _qty1 = 2;
  int _qty2 = 2;
  int _qty3 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: 'Keranjang',
        iconPath: 'assets/icons/notes_icon.svg',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonSearchBar(),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: [
                _buildCartItem(
                  image: 'assets/images/glass_1.jpg',
                  code: 'CUTLINE | SP633846-0011',
                  desc: 'Mandarin Fade/Coral Matte – RP Optics Multilaser Red',
                  unitPrice: 1000000,
                  qty: _qty1,
                ),

                _buildCartItem(
                  image: 'assets/images/glass_2.jpg',
                  code: 'CUTLINE | SP631054-0000',
                  desc: 'Fire Red Matte – RP Optics Smoke Black',
                  unitPrice: 3000000,
                  qty: _qty2,
                ),

                _buildCartItem(
                  image: 'assets/images/glass_3.jpg',
                  code: 'CUTLINE | SP637569-0008',
                  desc: 'White Gloss – ImpactX Photochromic 2 Laser Purple',
                  unitPrice: 1500000,
                  qty: _qty3,
                ),
                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Rubah Harga', style: TextStyle(color: commonColor, fontSize: 12),),
                    Text('Simpan Pesanan', style: TextStyle(color: commonColor, fontSize: 12),),

                  ],
                ),

                const SizedBox(height: 12),

                _buildExpandableSection(title: 'Diskon', onTap: () {}),
                const SizedBox(height: 16),

                _buildSummaryRow('Subtotal', 9500000),
                const SizedBox(height: 8),
                _buildSummaryRow('Pajak dan biaya lainnya', 3000),
                const SizedBox(height: 8),
                const Divider(),
                _buildSummaryRow('Total Harga', 9503000, isTotal: false),

                const SizedBox(height: 24),

                _buildExpandableSection(title: 'Pelanggan', onTap: () {}),
                const SizedBox(height: 16),

                _buildExpandableSection(title: 'SPG', onTap: () {}),
                const SizedBox(height: 32),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(color: commonColor),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Custom', style: TextStyle(fontSize: 16, color: commonColor)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: commonColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Konfirmasi', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String code,
    required String desc,
    required int unitPrice,
    required int qty,
  }) {
    final total = unitPrice * qty;
    return Material(
      // elevation: 0.4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        side: BorderSide(

          color: Color(0xFFF5F4F4),
        )
      ),
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xFFF0F0F0), width: 2)
                ),
                child: Image.asset(image, width: 60, height: 60)
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(code,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12)
                  ),
                  const SizedBox(height: 2),
                  Text(desc, style: const TextStyle(fontSize: 10, color: Colors.grey,), ),
                  const SizedBox(height: 3),
                  Text(
                    'Rp $unitPrice x $qty = Rp $total',
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: commonColor,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Icon(Icons.remove, color: Colors.white, size: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(qty.toString(), style: const TextStyle(fontSize: 16)),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: commonColor,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const Spacer(),
            const Icon(Icons.add_circle_outline, color: commonColor),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, int amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              )),
          Text('Rp $amount',
              style: TextStyle(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              )),
        ],
      ),
    );
  }
}

