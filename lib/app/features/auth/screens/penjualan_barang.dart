import 'package:flutter/material.dart';
import 'package:rudy_project/app/data/models/product_model.dart';
import 'package:rudy_project/app/features/auth/widgets/common_app_bar.dart';
import 'package:rudy_project/app/features/auth/widgets/search_bar.dart';
import 'package:rudy_project/theme/style.dart';

class PenjualanBarangScreen extends StatefulWidget {
  const PenjualanBarangScreen({super.key});

  @override
  State<PenjualanBarangScreen> createState() => _PenjualanBarangScreenState();
}

class _PenjualanBarangScreenState extends State<PenjualanBarangScreen> {

  List<Product> products = [
    Product(
      imagePath: 'assets/images/glass_1.jpg',
      type: 'CUTLINE',
      code: 'SP633846-0011',
      description: 'Mandarin Fade/Coral Matte - RP Optics Multilaser Red',
      price: 'Rp 1.000.000',
    ),
    Product(
      imagePath: 'assets/images/glass_2.jpg',
      type: 'CUTLINE',
      code: 'SP631054-0000',
      description: 'Fire Red Matte - RP Optics Smoke Black',
      price: 'Rp 3.000.000',
    ),
    Product(
      imagePath: 'assets/images/glass_3.jpg',
      type: 'CUTLINE',
      code: 'SP637569-0008',
      description: 'White Gloss - ImpactX Photochromic 2 Laser Purple',
      price: 'Rp 1.500.000',
    ),
    Product(
      imagePath: 'assets/images/glass_4.jpg',
      type: 'CUTLINE',
      code: 'SP637306-0000',
      description: 'Black Matte - ImpactX Photochromic 2 Black',
      price: 'Rp 2.000.000',
    ),
    Product(
      imagePath: 'assets/images/glass_5.jpg',
      type: 'CUTLINE',
      code: 'SP637306-0000',
      description: 'Black Matte - ImpactX Photochromic 2 Black',
      price: 'Rp 2.000.000',
    ),
    Product(
      imagePath: 'assets/images/glass_6.jpg',
      type: 'CUTLINE',
      code: 'SP637306-0000',
      description: 'Black Matte - ImpactX Photochromic 2 Black',
      price: 'Rp 2.000.000',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: 'Penjualan',
        iconPath: 'assets/icons/filter_icon.svg',
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: commonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white,),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: commonColor, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 12),

            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: commonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Masuk Keranjang',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CommonSearchBar(),
            SizedBox(height: 16),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.55
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(product.imagePath),
                            Spacer(),
                            Text(product.type.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black,)),
                            SizedBox(height: 4),

                            Text(product.code,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: 4),

                            Text(
                              product.description,
                              style: TextStyle(fontSize: 11),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              product.price,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),

                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: commonColor,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Icon(Icons.remove, color: Colors.white, size: 20),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF0F0F0),
                                    borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(6),
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
                  },
                )
            ),
          ],
        )
      ),
    );
  }
}
