import 'package:flutter/material.dart';
import 'package:week8/models/item.dart';
import 'package:week8/widgets/footer_widget.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Gerakan Perlawanan Buruh',
      price: 70000,
      photo:
          'assets/Buku1.jpeg',
      stock: 8,
      rating: 4.3,
    ),
    Item(
      name: 'Laskar Pelangi',
      price: 85000,
      photo:
          'assets/buku2.jpeg',
      stock: 20,
      rating: 4,
    ),
    Item(
      name: 'Mencapai Indonesia Merdeka',
      price: 102000,
      photo:
          'assets/buku3.jpeg',
      stock: 12,
      rating: 4.5,
    ),
    Item(
      name: 'Anak Rantau',
      price: 52000,
      photo:
          'assets/buku4.jpg',
      stock: 22,
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alvaro BookStore'),
      ),
      body: Container(
        color: Colors.grey,
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final priceFormat = NumberFormat("#,##0.00", "en_US");

            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/item', arguments: item);
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Hero(
                          tag: 'imageHero${item.name}${item.price}',
                          child: SizedBox(
                            height: 150,
                            child: Image.asset(
                              item.photo.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 100),
                                child: Text(
                                  item.name.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 100),
                                child: Text(
                                  'Rp${priceFormat.format(item.price)}',
                                  style: TextStyle(
                                    color: Colors.green[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.blue[800],
                              ),
                              Text(item.rating.toString()),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Stok Tersisa: ',
                            ),
                            TextSpan(
                              text: '${item.stock}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const MyFooter(),
    );
  }
}