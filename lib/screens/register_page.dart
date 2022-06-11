import 'package:flutter/material.dart';
import 'package:keyfhane/constants/constants.dart';
import 'package:keyfhane/models/User.dart';
import 'package:keyfhane/services/AuthService.dart';
import 'package:keyfhane/services/FirestoreServisi.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String _email = "", _password = "",_nameSurname="", _repeatPassword="";
  bool downloading = false;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Constants.linearStart,
      resizeToAvoidBottomInset: false,
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
      child: ListView(
        children: [
          SizedBox(height: 10.0,),
          Center(
              child: Column(
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
                        const Text("AD SOYAD", style: Constants.formTitleFont),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (entryValue) {
                      if (entryValue!.isEmpty) {
                        return "ad soyad alanı boş bırakılamaz";
                      }
                      if (entryValue.length < 3) {
                        return "ad soyad 3 karakterden fazla olmalıdır";
                      }
                    },
                    onChanged: (entryValue) {
                      setState(() {
                        _nameSurname = entryValue;
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: 'Ad Soyad giriniz',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("EMAIL",
                            style: Constants.formTitleFont),
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
                            hintText: 'email giriniz',
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Colors.white)),
                            hintText: 'şifrenizi giriniz',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("ŞİFREYİ TEKRAR YAZINIZ",
                            style: Constants.formTitleFont),
                        TextFormField(
                          obscureText: true,
                           validator: (entryValue) {
                      if (entryValue!=_password) {
                        return "şifre aynı olmalıdır";
                      }
                    },
                    onChanged: (entryValue) {
                      setState(() {
                        _repeatPassword = entryValue;
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Colors.white)),
                            hintText: 'Şifrenizi giriniz',
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
                                'KAYIT OL',
                              ),
                              onPressed: _signUp,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0)),
                                  primary: Colors.white,
                                  fixedSize: const Size(300, 40)),
                              child: const Text(
                                'GİRİŞ EKRANI',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/login-page');
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          
        ],
      ),
    );
  }

  void _signUp() async {
    if (_formState.currentState!.validate()) {
      setState(() {
        downloading = true;
      });
      try {
        MyUser? kullanici = await AuthService().createUserWithEmailAndPassword(_email, _password);
        if (kullanici != null) {
          await FirestoreServisi().kullaniciolustur(
              id: kullanici.id,
              email: kullanici.email,
              userName: _nameSurname);
        }
        Navigator.pop(context);
      } catch (hata) {
        setState(() {
          downloading = false;
        });
        print(hata);
        hatagoster(hata.toString());
      }
    }
  }

  hatagoster(String hatakodu) {
    String hatamesaji="";
    if (hatakodu == "ERROR_INVALID_EMAIL") {
      hatamesaji = "Geçersiz bir email";
    } else if (hatakodu == "ERROR_WEAK_PASSWORD") {
      hatamesaji = "Şifreniz zayıf bir şifredir";
    } else if (hatakodu == "ERROR_EMAIL_ALREADY_IN_USE") {
      hatamesaji = "Bu email kullanılmıştır";
    }
    SnackBar snackBar = SnackBar(content: Text(hatamesaji));
    _scaffoldState.currentState!.showSnackBar(snackBar);
  }
}
