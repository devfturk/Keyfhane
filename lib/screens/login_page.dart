import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyfhane/constants/constants.dart';
import 'package:keyfhane/models/User.dart';
import 'package:keyfhane/services/AuthService.dart';
import 'package:keyfhane/services/FirestoreServisi.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "", _password = "";
  bool downloading = false;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Constants.linearStart,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Constants.linearStart,
        elevation: 0,
      ),
      body: Stack(children: [
        _pageElements(),
        downloadingAnimation(),
      ]),
    );
  }

  Widget downloadingAnimation() {
    if (downloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      height: 0.0,
    );
  }

  Form _pageElements() {
    return Form(
      key: _formState,
      child: ListView(children: [
        SizedBox(height: 10.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150),
            const SizedBox(height: 10),
            SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text("E-mail", style: Constants.formTitleFont),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (entryValue) {
                      if (entryValue!.isEmpty) {
                        return "email alanı bos bırakılamaz";
                      }
                    
                    },
                    onChanged: (entryValue) {
                      setState(() {
                        _email = entryValue;
                      });
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.white, fontSize: 16),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'E-mail adresinizi girin',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("ŞİFRE", style: Constants.formTitleFont),
                  TextFormField(
                    obscureText: true,
                    validator: (entryValue) {
                      if (entryValue!.isEmpty) {
                        return "sifre alanı boş bırakılamaz";
                      }
                      if (entryValue.length < 8) {
                        return "sifre 8 karakterden fazla olmalıdır";
                      }
                    },
                    onChanged: (entryValue) {
                      setState(() {
                        _password = entryValue;
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.white, fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      hintText: 'Şifrenizi Giriniz',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                      child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.green,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'GİRİŞ YAP',
                        ),
                        onPressed: _signIn,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.orange,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'KAYIT OL',
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register-page');
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.yellow.shade700,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'MİSAFİR GİRİŞİ',
                        ),
                        onPressed: () {
                          //MİSAFİR GİRİŞİ
                          Navigator.pushNamed(context, '/home-page');
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.red,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'GOOGLE',
                        ),
                        onPressed: _googleilegiris,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.blueAccent.shade700,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'FACEBOOK',
                        ),
                        onPressed: _facebookilegiris,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.red[900],
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'ÇIKIŞ',
                        ),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            primary: Colors.white,
                            fixedSize: const Size(300, 40)),
                        child: const Text(
                          'ŞİFREMİ UNUTTUM',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }

  void _signIn() async {
    final AuthService _authService = Provider.of(context, listen: false);

    if (_formState.currentState!.validate()) {
      print(_email);
      print(_password);
      setState(() {
        downloading = true;
      });
      try {
        MyUser? kullanici =
            await _authService.signInWithEmailAndPassword(_email, _password);
      } catch (error) {
        setState(() {
          downloading = false;
        });
        print(error);
        hatagoster(error.toString());
      }
    }
  }

  void _googleilegiris() async {
    setState(() {
      downloading = true;
    });
    try {
      MyUser? kullanici = await AuthService().signInWithGoogle();
      if (kullanici != null) {
        MyUser? kullanicivarmi =
            await FirestoreServisi().kullanicigetir(kullanici.id!);
        if (kullanicivarmi == null) {
          await FirestoreServisi().kullaniciolustur(
              email: kullanici.email,
              id: kullanici.id,
              photourl: kullanici.photoUrl,
              userName: kullanici.userName);
          print("kullanıcı kaydı oldu");
        }
      }
    } catch (hata) {
      setState(() {
        downloading = false;
      });
      hatagoster(hata.toString());
    }
  }
  void _facebookilegiris() async {
    setState(() {
      downloading = true;
    });
    try {
      MyUser? kullanici = await AuthService().signInWithFacebook();
      if (kullanici != null) {
        MyUser? kullanicivarmi =
            await FirestoreServisi().kullanicigetir(kullanici.id!);
        if (kullanicivarmi == null) {
          await FirestoreServisi().kullaniciolustur(
              email: kullanici.email,
              id: kullanici.id,
              photourl: kullanici.photoUrl,
              userName: kullanici.userName);
          print("kullanıcı kaydı oldu");
        }
      }
    } catch (hata) {
      setState(() {
        downloading = false;
      });
      hatagoster(hata.toString());
    }
  }

  hatagoster(String hatakodu) {
    SnackBar snackBar = SnackBar(content: Text(hatakodu));
    _scaffoldState.currentState?.showSnackBar(snackBar);
  }

}
