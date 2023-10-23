import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget get titleSection => Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: const Text(
                      'Wisata Coban di Batu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Batu, Malang, Indonesia',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            const Text('41'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Coban talun merupakan tempat pembuangan jenazah pemberontak yang terlibat dalam peristiwa G30S/PKI di Malang. Kini, Coban Talun telah bersih dan menjadi destinasi wisata yang tidak pernah sepi dari pengunjung.'
        'Di tempat wisata ini juga terdapat taman bunga dengan berbagai jenis koleksinya.'
        'Berbagai aktivitas dapat dilakukan di kawasa ini, mulai selfie hingga camping di tempat wisata ini.\n'
        'Alvaro Hegel Ivanka - 2141720237',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Alvaro Hegel Ivanka / 2141720237',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset('asset/talun.jpeg'),
            titleSection,
            buttonSection,
            textSection,
          ],
        )
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}