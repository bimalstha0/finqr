import 'package:flutter/material.dart';
import 'package:soltech/modules/home/widgets/points.dart';

import '../../../constants.dart';
import 'custom_search_diligate.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Tanisha,",
                  style: TextStyle(fontSize: 18, color: greenDark),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: greenDark,
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: PointsContainer(),
      ),
    ],
  );
}
}