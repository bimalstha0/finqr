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
  void initState() {
    super.initState();
    initializeCameras();
  }

  Future<void> initializeCameras() async {
    _cameras = await availableCameras();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      showQR(context);
                    },
                    icon: Icon(Icons.qr_code_sharp),
                  ),
                  Text('Your QR'),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  child: QRView(
                    
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
                SizedBox(height: 20),
                CustomButton('Scan', () {
                    Navigator.pushNamed(context, '/payment');
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Powered By',
                style: TextStyle(color: Color.fromARGB(255, 8, 86, 150)),
              ),
              Image.asset(
                'assets/icons/matera.png',
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showQR(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Name: Tanisha Verma"),
        content: Image.asset('assets/images/qr.webp', height: 100),
        actions: [
          CustomButton('Done', () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
}
