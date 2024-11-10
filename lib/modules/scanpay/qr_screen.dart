import 'package:flutter/material.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  // final _nativeQr = NativeQr();
  String? qrString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // onPressed: () async {
                // try {
                //   var result = await _nativeQr.get();
                //   setState(() {
                //     qrString = result;
                //   });
                // } catch (err) {
                //   setState(() {
                //     qrString = err.toString();
                //   });
                // }
              onPressed: ()  {
        Navigator.pushNamed(context, '/payment');
                
              },
              child: const Text("Scan"),
            ),
            if (qrString != null) 
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Result: $qrString',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
