import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';

class PointsContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            greenDark, // pastel blue end color
            greenColor, // pastel blue start color

          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(25),
      child: Row(children: [Column(mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FinQR Points",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                "4,396",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2
                ),

              ),
              SizedBox(width: 8),
              Text(
                "points",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ))],
              ),
             
      ])
    ]));
  }
}
