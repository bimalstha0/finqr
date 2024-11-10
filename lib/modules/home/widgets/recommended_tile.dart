import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/store.dart';
import '../../store/store_page.dart';
class RecommendedTile extends StatelessWidget {
  const RecommendedTile({required this.recommended});
  final Store recommended;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Get.to(() => StorePage(store: recommended));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20, top: 20),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                offset: Offset(0, 7),
                blurRadius: 10),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "POPULAR",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: Image.asset(recommended.img,)
              ),
            ),
            BlurryContainer(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              bgColor: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      recommended.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
