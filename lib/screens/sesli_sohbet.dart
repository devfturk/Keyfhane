import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyfhane/constants/constants.dart';

class SesliSohbet extends StatelessWidget {
  const SesliSohbet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List persons = [
      {
        'name': 'Ahmet Özdemir',
      },
      {
        'name': 'Ayşe Yılmaz',
      },
      {
        'name': 'Halil Yollu',
      },
      {
        'name': 'Kemal Yıldız',
      },
      {
        'name': 'Merve Yıldız',
      },
      {
        'name': 'Sümeyye Yıldız',
      },
      {
        'name': 'Sarp Adalı',
      },
      {
        'name': 'Samet Yıldız',
      },
      {
        'name': 'Tarık Yıldız',
      },
      {
        'name': 'Kemal Akbudak',
      },
      {
        'name': 'Recep Yıldız',
      },
      {
        'name': 'Ayşe Yılmaz',
      }
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 24,
              width: double.infinity,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2) *
                        .8,
                  ),
                  itemCount: persons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: double.infinity,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 36,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 32,
                                child: Icon(Icons.person, size: 64),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              persons[index]['name'].toUpperCase(),
                              style: Constants.chatTitleFont,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(width: 1, color: Colors.black)),
                    child:
                        const Icon(Icons.mic, size: 100, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                    child: const Text('ÇIKIŞ', style: Constants.exitButtonFont),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
