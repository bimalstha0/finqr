import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';
import 'package:soltech/modules/widgets/custom_button.dart';

import 'pin.dart';

class PaymentScreen extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenDark,
        foregroundColor: Colors.white,
        title: Text('Confirmation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 20),
            _buildReadOnlyField('Store Name', 'John Coffee Shop'),
            SizedBox(height: 10),
            _buildReadOnlyField('Email', 'john_pay@gmail.com'),
            SizedBox(height: 10),
            _buildReadOnlyField('Date', '10/11/2024'),
            SizedBox(height: 10),
            Text('Payment Amount:', style: TextStyle(color: Colors.black)),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              style: TextStyle(color: Colors.black45),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: '\$540.00',
                hintStyle: TextStyle(color: Colors.black12),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 50,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Points Gathered:'),Text('54',style: TextStyle(color: greenDark),)],),
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [ CustomButton('Proceed Payment', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PinInputScreen()),
                );})])
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: TextStyle(color: Colors.black)),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value, style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }
}
