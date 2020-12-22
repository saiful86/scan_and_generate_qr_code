import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  ScanQRCode({Key key}) : super(key: key);

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Scan Result',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'QR Code',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              onPressed: () {
                scanQrCode();
              },
              textColor: Colors.white,
              color: Colors.blue,
              padding: const EdgeInsets.all(10.0),
              child: const Text('  Strat Scanning    ',
                  style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> scanQrCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
