import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class QrKod extends StatelessWidget {
  const QrKod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Kod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('QR KOD TARA'),
              onPressed: () {
                scan();
              },
            )
          ],
        ),
      ),
    );
  }
}

Future scan() async {
  var result = await BarcodeScanner.scan();

  debugPrint('tarama sonucu: ${result.rawContent}');

  return result.rawContent;
}
