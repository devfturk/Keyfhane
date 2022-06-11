import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              const CircleAvatar(
                  radius: 84,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      child: Icon(Icons.person, size: 150))),
              const SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('AD', style: Constants.profileTitleFont),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  color: Constants.linearStart,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('SOYAD', style: Constants.profileTitleFont),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  color: Constants.linearStart,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Doğum\nTarihi',
                            style: Constants.profileTitleFont),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  color: Constants.linearStart,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Memleket',
                            style: Constants.profileTitleFont),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  color: Constants.linearStart,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hakkımda',
                            style: Constants.profileTitleFont),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            maxLines: null,
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  color: Constants.linearStart,
                                  width: 2,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[900]),
                        child: const Text('KAYDET',
                            style: Constants.profileButtonFont),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[900]),
                        child: const Text('ÇIKIŞ',
                            style: Constants.profileButtonFont),
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
        ));
  }
}
