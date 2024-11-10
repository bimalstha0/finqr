import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';
import 'package:soltech/modules/widgets/custom_button.dart';
import 'package:soltech/modules/widgets/input_field.dart';

class ManageAccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: greenDark,
        foregroundColor: Colors.white,
        title: Text('Manage Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Account: Tanisha Verma',
                  style: TextStyle(
                    fontSize: 18,
                    
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Form(
              child: Column(
                children: [
                  InputField(label: 'Transit Code',inputType: TextInputType.number,textInputAction: TextInputAction.next,),
                  SizedBox(height: 20,),
                  InputField(label: 'Bank Code',inputType: TextInputType.number,textInputAction: TextInputAction.next,),
                  SizedBox(height: 20,),
                  InputField(label: 'Account Number',inputType: TextInputType.number,textInputAction: TextInputAction.done,),
                  SizedBox(height: 20,),
                  InputField(label: 'Create PIN',inputType: TextInputType.number,textInputAction: TextInputAction.next,),
                  SizedBox(height: 20,),
                  InputField(label: 'Confirm PIN',inputType: TextInputType.number,textInputAction: TextInputAction.next,),
                  SizedBox(height: 20,),
                  Padding(child: Text("Please refer to your bank's website or customer service for your banking information"),padding: EdgeInsets.symmetric(horizontal: 20),),
                  SizedBox(height: 40,),
                  
                  Padding(child:Row(children: [
                  Checkbox(
                        value: true,
                        activeColor: greenDark,
                        onChanged: (value) {
                          // setState(() {
                          //   remember = value;
                          // });
                        },
                      ),
                      const Text("I agree to the terms and conditions of FinQR"),]),padding: EdgeInsets.symmetric(horizontal: 20),),
                  
                  ],
              ),
            ),
            SizedBox(height: 30),
            CustomButton('Save', (){_showPaymentDialog(context);})
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Processed"),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.0, // Adjust size as needed
              ),
              SizedBox(height: 16),
              Text("Thank you! Now You can start paying from the app and earn points."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the previous screen
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}


  