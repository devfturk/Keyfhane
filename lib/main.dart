import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keyfhane/Direct.dart';
import 'package:keyfhane/screens/home_page.dart';
import 'package:keyfhane/screens/kitap.dart';
import 'package:keyfhane/screens/login_page.dart';
import 'package:keyfhane/screens/oyun.dart';
import 'package:keyfhane/screens/profil.dart';
import 'package:keyfhane/screens/qr_kod.dart';
import 'package:keyfhane/screens/register_page.dart';
import 'package:keyfhane/screens/sesli_sohbet.dart';
import 'package:keyfhane/screens/takvim.dart';
import 'package:keyfhane/services/AuthService.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (context) => AuthService(),
      child: MaterialApp(
        routes: {
          '/home-page': (BuildContext context) => const HomePage(),
          '/login-page': (BuildContext context) => const LoginPage(),
          '/register-page': (BuildContext context) => const RegisterPage(),
          '/sesli_sohbet': (BuildContext context) => const SesliSohbet(),
          '/kitap': (BuildContext context) => const Kitap(),
          '/oyun': (BuildContext context) => const Oyun(),
          '/takvim': (BuildContext context) => const Takvim(),
          '/profil': (BuildContext context) => const Profil(),
          '/qr_kod': (BuildContext context) => const QrKod(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Keyfhane',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashScreen(
            splashIconSize: 500,
            duration: 3000,
            splash: Image.asset('assets/images/splash.gif'),
            nextScreen: const Direct()),
      ),
    );
  }
}
