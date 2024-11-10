
import 'package:flutter/material.dart';

import '../../data/api/store.dart';

class StorePage extends StatelessWidget {
  const StorePage({required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Store 1"),
        ),
        );
  }
}
