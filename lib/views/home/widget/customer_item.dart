import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget {
  final String name;
  final int amount;
  const CustomerItem({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'EGP $amount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
