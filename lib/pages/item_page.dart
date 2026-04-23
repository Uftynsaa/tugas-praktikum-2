import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({super.key, required this.item});

  /// FORMAT RUPIAH
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

      /// APPBAR
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: const Text('Detail Produk'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),

      /// BODY
      body: Column(
        children: [
          /// SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// GAMBAR PRODUK
                  Hero(
                    tag: item.name,
                    child: Image.asset(
                      item.image,
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// DETAIL PRODUK
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// NAMA
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// HARGA (BESAR)
                        Text(
                          formatRupiah(item.price),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// RATING + TERJUAL + STOK
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text('${item.rating}'),

                            const SizedBox(width: 16),
                            const Text('1rb+ terjual'),

                            const SizedBox(width: 16),
                            Text('Stok ${item.stock}'),
                          ],
                        ),

                        const SizedBox(height: 16),

                        /// DESKRIPSI
                        const Text(
                          'Deskripsi Produk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          '${item.name} tersedia di Toko Madura dengan kualitas terbaik dan harga terjangkau. Cocok untuk kebutuhan sehari-hari.',
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// BUTTON BAWAH (SHOPEE STYLE)
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                /// ICON CHAT
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat, color: Colors.orange),
                ),

                /// ICON CART
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart,
                      color: Colors.orange),
                ),

                const SizedBox(width: 8),

                /// BUTTON BELI
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Beli Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}