import 'package:flutter/material.dart';
import 'package:trust/views/home/widget/customer.dart';

class CustomerCollectionDay extends StatelessWidget {
  const CustomerCollectionDay({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> customers = [
      {
        'name': 'John Doe',
        'address': '123 Main St, Springfield',
        'balance': '\$1,200.00',
      },
      {
        'name': 'Jane Smith',
        'address': '456 Elm St, Shelbyville',
        'balance': '\$2,300.00',
      },
      {
        'name': 'Alice Johnson',
        'address': '789 Oak St, Capital City',
        'balance': '\$3,400.00',
      },
      {
        'name': 'Alice Johnson',
        'address': '789 Oak St, Capital City',
        'balance': '\$3,400.00',
      },
      {
        'name': 'Alice Johnson',
        'address': '789 Oak St, Capital City',
        'balance': '\$3,400.00',
      },
      {
        'name': 'Alice Johnson',
        'address': '789 Oak St, Capital City',
        'balance': '\$3,400.00',
      },
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return Customer(
          name: customer['name']!,
          address: customer['address']!,
          balance: customer['balance']!,
        );
      },
    );
  }
}
