import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ExplorePanel extends StatelessWidget {
  const ExplorePanel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.to(() => PlantDetailScreen(plant: plant)),
      child: Container(
        margin: EdgeInsets.only(bottom: 6),
        color: bgColor,
        height: 400,
        child: Stack(
          children: [
            Positioned(
                right: -15,
                top: 50,
                bottom: 0,
                child: Container(
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FAVORABLE',
                    style: TextStyle(
                      color: greenDark,
                      fontSize: 12,
                    ),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlurryContainer(
                borderRadius: BorderRadius.zero,
                bgColor: greenDark,
                blur: 15,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Get suitable fertilizer for this plant.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'BUY',
                            style: TextStyle(color: greenDark, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
