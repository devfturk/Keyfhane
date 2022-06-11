import 'package:flutter/material.dart';
import 'package:keyfhane/constants/constants.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pages = [
      {
        'title': 'Sesli Sohbet',
        'image': 'assets/images/sesli_sohbet.png',
        'route': '/sesli_sohbet',
      },
      {
        'title': 'Kitap',
        'image': 'assets/images/kitap.png',
        'route': '/kitap',
      },
      {
        'title': 'Oyun',
        'image': 'assets/images/oyun.png',
        'route': '/oyun',
      },
      {
        'title': 'Takvim',
        'image': 'assets/images/takvim.png',
        'route': '/takvim',
      },
      {
        'title': 'Profil',
        'image': 'assets/images/profil.png',
        'route': '/profil',
      },
      {
        'title': 'QR Kod',
        'image': 'assets/images/qr_kod.png',
        'route': '/qr_kod',
      },
    ];
    return Expanded(
      flex: 4,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 24,
        width: double.infinity,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, pages[index]['route']);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          pages[index]['image'],
                          height: 120,
                        ),
                        Text(pages[index]['title'],
                            style: Constants.optionsFont),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
