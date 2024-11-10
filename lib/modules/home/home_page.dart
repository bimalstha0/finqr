
import 'package:flutter/material.dart';
import 'package:soltech/modules/home/widgets/options.dart';
import 'package:soltech/modules/home/widgets/recent_transactions.dart';

import '../../data/api/store.dart';
import 'widgets/explore_header.dart';

final List<Store> recommended = [
  Store(
      name: 'Tim Hortons', address: "SomeAddress", img: "assets/images/tim.png", email: '', top10: List.empty()),
  Store(
      name: 'Starbucks', address: "SomeAddress", img: "assets/images/starbucks.png", email: '', top10: List.empty()),
  Store(
      name: 'Subway', address: "SomeAddress", img: "assets/images/subway.png", email: '', top10: List.empty()),
  Store(
      name: 'Zara', address: "SomeAddress", img: "assets/images/zara.png", email: '', top10: List.empty()),
  Store(
      name: 'Best Buy', address: "SomeAddress", img: "assets/images/bestbuy.png", email: '', top10: List.empty()),
];
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 5, right: 20, top: 30),
                child: ExploreHeader(),
              ),
              ButtonRow(),
              SizedBox(height: 20), // Space between button row and recent transactions
              RecentTransactions(), // Remove the SizedBox wrapping this widget
            ],
          ),
        ),
      ),
    );
  }
}
