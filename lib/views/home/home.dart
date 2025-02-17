import 'package:flutter/material.dart';
import 'package:trust/views/home/widget/balance_in_market.dart';
import 'package:trust/views/home/widget/current_date.dart';
import 'package:trust/views/home/widget/customer.dart';
import 'package:trust/views/home/widget/customer_collection_day.dart';
import 'package:trust/views/home/widget/customer_collection_list.dart';
import 'package:trust/views/home/widget/floating_btn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
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
                ),
              ),
              CustomerCollectionList(),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Customers"),
                ),
              ),
              CustomerCollectionDay(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingBtn(),
    );
  }
}
