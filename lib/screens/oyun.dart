import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Oyun extends StatelessWidget {
  const Oyun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List games = [
      {'title': 'tavla'},
      {'title': 'satranç'},
      {'title': 'dama'},
      {'title': 'batak'},
      {'title': 'okey'},
    ];
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 24,
              child: ListView.separated(
                itemCount: games.length,
                separatorBuilder: (c, i) => const Divider(),
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ListTile(
                        leading: const Icon(Icons.emoji_events),
                        title: Text(
                          games[i]['title'].toUpperCase(),
                          style: Constants.chatTitleFont,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
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
