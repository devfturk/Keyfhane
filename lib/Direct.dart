import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:keyfhane/models/User.dart';
import 'package:keyfhane/screens/home_page.dart';
import 'package:keyfhane/screens/login_page.dart';
import 'package:keyfhane/services/AuthService.dart';
import 'package:provider/provider.dart';

class Direct extends StatelessWidget {
  const Direct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = Provider.of(context, listen: false);
    return StreamBuilder<MyUser?>(
        stream: _authService.signFollow,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            _authService.currentUSer = snapshot.data!.id;
            print(snapshot.data!.id);
            return HomePage();
          }
          return LoginPage();
        });
  }
}
