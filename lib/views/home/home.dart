import 'package:flutter/material.dart';
import 'package:trust/views/home/widget/balance_in_market.dart';
import 'package:trust/views/home/widget/current_date.dart';
import 'package:trust/views/home/widget/customer.dart';
import 'package:trust/views/home/widget/customer_collection_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentDate(),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlanceInMarket(
                    name: 'Market Blance',
                    money: '4242424000',
                  ),
                  BlanceInMarket(
                    name: 'Supplier Blance',
                    money: '2323232000',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Daily payment collection schedule"),
                  )),
              CustomerCollectionList(),
              SizedBox(height: 8),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Customers"),
                  )),
              ListView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
