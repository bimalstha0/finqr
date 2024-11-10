import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.greenAccent, size: 100),
            SizedBox(height: 20),
            Text('Payment Success!', style: TextStyle(color: greenDark, fontSize: 24)),
            SizedBox(height: 10),
            Text('Your payment has been completed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(color: greenDark)),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // G
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // G
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
