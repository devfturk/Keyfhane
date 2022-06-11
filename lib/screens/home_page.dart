import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyfhane/constants/constants.dart';
import 'package:keyfhane/services/AuthService.dart';
import 'package:keyfhane/widgets/options.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            const Options(),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                  child: const Text('ÇIKIŞ', style: Constants.exitButtonFont),
                  onPressed: () {
                    AuthService authService =
                        Provider.of(context, listen: false);

                    authService.signOut();
                  },
                ),
              ),
            )
          ],
        ));
  }
}
