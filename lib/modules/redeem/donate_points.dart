
import 'package:flutter/material.dart';
import 'package:soltech/modules/widgets/custom_button.dart';

import '../../constants.dart';

class DonatePointsScreen extends StatelessWidget {
  final int totalPoints;

  const DonatePointsScreen({Key? key, required this.totalPoints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Charity'),
        backgroundColor: greenDark,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.spa_outlined,color: greenDark,size: 50,),
            SizedBox(height: 20,),
            Text(
              'Who would you like to send your donation?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            buildDonationOption(context, 'Toronto Children Charity'),
            buildDonationOption(context, 'Scarborough Food Bank'),
            buildDonationOption(context, 'Ontario Fund for Women Health'),
          ],
        ),
      ),
    );
  }

  Widget buildDonationOption(BuildContext context, String cause) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(cause),
        trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
              _showDonationConfirmationDialog(context,cause);
          }
        ),
    );
  }

  void completion(BuildContext context, String cause) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Donation Successful"),
        content: Text("Thank you for donating to $cause!"),
        actions: [
          TextButton(
            onPressed: () { Navigator.of(context).pop();Navigator.of(context).pop();},
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
  void _showDonationConfirmationDialog(BuildContext context, String cause) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Donation to $cause"),
        content: Container(height:90,child: Column(children:[Text("Number of points to donate?"),TextField(keyboardType: TextInputType.number)])),
        actions: [
          CustomButton('Donate', () {Navigator.of(context).pop(); completion(context,cause);})
        ],
      ),
    );
  }
}