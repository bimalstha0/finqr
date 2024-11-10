import 'package:flutter/material.dart';
import 'package:soltech/constants.dart';

class RecentTransactions extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "icon": Icons.apple,
      "title": "Apple Services",
      "amount": "\$4.99",
      "location": "Pending - Card Number Used",
      "date": "22 minutes ago",
      "reward": "3%"
    },
    {
      "icon": Icons.local_cafe,
      "title": "Mc-Cafe",
      "amount": "\$3.24",
      "location": "Donation",
      "date": "1 hour ago",
      "reward": "3%"
    },
    {
      "icon": Icons.local_cafe,
      "title": "La Colombe Coffee",
      "amount": "\$1.50",
      "location": "Donation",
      "date": "Yesterday",
      "reward": "2%"
    },
    {
      "icon": Icons.store,
      "title": "Apple Store",
      "amount": "\$168.94",
      "location": "Toronto,CA",
      "date": "Yesterday",
      "reward": "3%"
    },
    {
      "icon": Icons.shopping_cart,
      "title": "South Loop Market",
      "amount": "\$135.46",
      "location": "Toronto,CA",
      "date": "Monday",
      "reward": "2%"
    },
    {
      "icon": Icons.apple,
      "title": "Apple Services",
      "amount": "\$2.15",
      "location": "Card Number Used",
      "date": "Thursday",
      "reward": "3%"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
          child: Text(
            "Latest Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(transaction["icon"], color: greenDark),
                  ),
                  title: Text(
                    transaction["title"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction["location"]),
                      Text(transaction["date"], style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transaction["amount"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        transaction["reward"],
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}