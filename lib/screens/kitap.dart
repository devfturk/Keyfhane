import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Kitap extends StatelessWidget {
  const Kitap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List books = [
      {'title': 'Tutunamayanlar'},
      {'title': 'Suç ve Ceza'},
      {'title': 'Çocukların İnsanları'},
      {'title': 'Sefiller'},
      {'title': 'Vadideki Zambak'},
      {'title': 'Ana'},
      {'title': 'Karamazov Kardeşler'},
      {'title': 'Gazap Üzümleri'},
      {'title': 'Ölü Canlar'},
      {'title': 'Savaş ve Barış'}
    ];
    return Material(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 24,
              child: ListView.separated(
                itemCount: books.length,
                separatorBuilder: (c, i) => const Divider(),
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: const Icon(Icons.menu_book),
                      title: Text(
                        books[i]['title'].toUpperCase(),
                        style: Constants.chatTitleFont,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[900]),
                child: const Text('ANA SAYFA', style: Constants.exitButtonFont),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
