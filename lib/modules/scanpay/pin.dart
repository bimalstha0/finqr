import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';
import 'success.dart';

class PinInputScreen extends StatefulWidget {
  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final int pinLength = 4;
  String enteredPin = '';

  void onNumberPress(String number) {
    if (enteredPin.length < pinLength) {
      setState(() {
        enteredPin += number;
      });
      if (enteredPin.length == pinLength) {
        _validatePin();
      }
    }
  }

  void _validatePin() {
    // Here, you could validate the PIN by comparing it to a stored value.
    // For this example, we'll assume any 4-digit PIN is "correct" and navigate to the success screen.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
    );
  }

  void onDeletePress() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenDark,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Input PIN'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter PIN', style: TextStyle(color: greenDark, fontSize: 24)),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pinLength, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  enteredPin.length > index ? Icons.circle : Icons.circle_outlined,
                  color: greenDark,
                  size: 16,
                ),
              );
            }),
          ),
          SizedBox(height: 30),
          GridView.builder(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              String buttonText;
              if (index < 9) {
                buttonText = '${index + 1}';
              } else if (index == 9) {
                buttonText = 'x';  // Delete button
              } else if (index == 10) {
                buttonText = '0';
              } else {
                buttonText = '✓';  // Confirm button
              }

              return ElevatedButton(
                onPressed: () {
                  if (buttonText == 'x') {
                    onDeletePress();
                  } else if (buttonText == '✓') {
                    if (enteredPin.length == pinLength) {
                      _validatePin();
                    }
                  } else {
                    onNumberPress(buttonText);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: greenDark,
                  elevation: 0,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 15),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
