import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/custom_button.dart';

late List<CameraDescription> _cameras;


class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned data here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Scan successful!")),
      );
      controller.pauseCamera();
      Navigator.pop(context); // Go back to the main screen after scan
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        
      ),
      body: Column(children: [ 
        Row(children: [SizedBox(), Column(mainAxisAlignment: MainAxisAlignment.center, children: [IconButton(onPressed: (){showQR(context);}, icon: Icon(Icons.qr_code_sharp))])],),
        Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
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
          ],
        ),
      ),SizedBox(height: 30,),
      Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [Text('Powered By'),Image.asset('assets/icons/matera.png',height: 20,)],)

    ]));
  }

    void showQR(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Name: Tanisha Verma"),
        content: Image.asset('assets/images/qr.png',height: 50,),
        actions: [
          CustomButton('Done', () {Navigator.of(context).pop(); })
        ],
      ),
    );
  }
}
