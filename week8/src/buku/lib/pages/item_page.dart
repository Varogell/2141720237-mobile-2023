import 'package:week8/models/item.dart';
import 'package:flutter/material.dart';
import 'package:week8/widgets/footer_widget.dart';
import 'package:intl/intl.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    final priceFormat = NumberFormat("#,##0.00", "en_US");

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'imageHero${item.name}${item.price}',
              child: SizedBox(
                height: 320,
                child: Image.network(
                  item.photo.toString(),
                  fit: BoxFit.cover,
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
                      constraints: const BoxConstraints(maxWidth: 320),
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
                    Text(
                      'Rp${priceFormat.format(item.price)}',
                      style: TextStyle(
                        color: Colors.green[800],
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
      bottomNavigationBar: const MyFooter(),
    );
  }
}