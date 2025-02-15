import 'package:flutter/material.dart';
import 'package:trust/views/home/widget/customer_item.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final List<Map<String, dynamic>> customers = [
      {'name': 'John Doe', 'amount': 1000},
      {'name': 'Jane Doe', 'amount': 2000},
      {'name': 'Alice', 'amount': 3000},
      {'name': 'Bob', 'amount': 4000},
      {'name': 'Charlie', 'amount': 5000},
      {'name': 'David', 'amount': 6000},
      {'name': 'Eve', 'amount': 7000},
      {'name': 'Frank', 'amount': 8000},
      {'name': 'Grace', 'amount': 9000},
      {'name': 'Hank', 'amount': 10000},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // Prevents the ListView from scrolling independently
        itemCount: customers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomerItem(
                name: customers[index]['name'],
                amount: customers[index]['amount']),
          );
        },
      ),
    );
  }
}
