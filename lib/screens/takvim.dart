import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Takvim extends StatelessWidget {
  const Takvim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List events = [
      {'time': '10:00', 'title': 'Etkinlik 1'},
      {'time': '11:00', 'title': 'Etkinlik 2'},
      {'time': '12:00', 'title': 'Etkinlik 3'},
      {'time': '13:00', 'title': 'Etkinlik 4'},
      {'time': '14:00', 'title': 'Etkinlik 5'},
    ];
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 24,
              child: ListView.separated(
                itemCount: events.length,
                separatorBuilder: (c, i) => const Divider(),
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ListTile(
                        title: Text(events[i]['time'].toUpperCase(),
                            style: Constants.chatTitleFont),
                        trailing: Text(events[i]['title'].toUpperCase(),
                            style: Constants.chatTitleFont),
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
