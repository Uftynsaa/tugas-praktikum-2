import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: 'Beras Pandan Wangi', price: 70000, image: 'assets/images/beras.jpg', stock: 15, rating: 4.7),
    Item(name: 'Gula Pasir Premium', price: 15000, image: 'assets/images/gula.jpg', stock: 20, rating: 4.5),
    Item(name: 'Minyak Goreng', price: 18000, image: 'assets/images/minyak.jpg', stock: 12, rating: 4.6),
    Item(name: 'Telur Ayam', price: 28000, image: 'assets/images/telur.jpg', stock: 10, rating: 4.8),
    Item(name: 'Tepung Terigu', price: 12000, image: 'assets/images/tepung.jpg', stock: 18, rating: 4.4),
    Item(name: 'Kopi Bubuk', price: 50000, image: 'assets/images/kopi.jpg', stock: 8, rating: 4.9),
    Item(name: 'Susu UHT', price: 9000, image: 'assets/images/susu.jpg', stock: 25, rating: 4.3),
  ];

  String formatRupiah(int number) {
    return 'Rp' + number.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      /// APPBAR SHOPEE
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        toolbarHeight: 70,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Cari di Toko Madura',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),

      body: Column(
        children: [
          /// HEADER TOKO
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: const Row(
              children: [
                Icon(Icons.storefront, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'Toko Madura',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          /// GRID RESPONSIVE
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;

                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 5;
                } else if (constraints.maxWidth > 900) {
                  crossAxisCount = 4;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 3;
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(6),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        context.push('/item', extra: item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// GAMBAR
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.asset(item.image, fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  top: 6,
                                  left: 6,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      'Diskon',
                                      style: TextStyle(color: Colors.white, fontSize: 9),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /// DETAIL
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const Text(
                                      'Gratis Ongkir',
                                      style: TextStyle(fontSize: 9, color: Colors.red),
                                    ),
                                    Text(
                                      formatRupiah(item.price),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 12),
                                        const SizedBox(width: 2),
                                        Text('${item.rating}', style: const TextStyle(fontSize: 10)),
                                        const Spacer(),
                                        Text(
                                          'Stok ${item.stock}',
                                          style: TextStyle(fontSize: 9, color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          /// FOOTER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: const Text(
              'Nama: Uuf Uftinisatul Khalizah | NIM: 2407072 | Kelas: SIKC 2C',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}