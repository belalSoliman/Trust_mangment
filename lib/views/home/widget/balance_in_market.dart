import 'package:flutter/material.dart';

class BlanceInMarket extends StatelessWidget {
  final String name;
  final String money;
  const BlanceInMarket({super.key, required this.name, required this.money});

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
              'EGP$money',
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
