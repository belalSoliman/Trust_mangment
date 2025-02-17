import 'package:flutter/material.dart';

class CustomerPageView extends StatelessWidget {
  // Dummy data for demonstration
  final String customerName = 'John Doe';
  final String customerAddress = '123 Main St, Springfield';
  final double remainingBalance = 1200.0;

  // Dummy list of items taken from the factory
  final List<Map<String, dynamic>> itemsTaken = [
    {'item': 'Widget A', 'quantity': 10, 'price': 50.0},
    {'item': 'Widget B', 'quantity': 5, 'price': 100.0},
    {'item': 'Widget C', 'quantity': 20, 'price': 25.0},
  ];

  // Dummy list of payments made
  final List<Map<String, dynamic>> paymentsMade = [
    {'date': '2023-10-01', 'amount': 500.0},
    {'date': '2023-10-15', 'amount': 700.0},
  ];

  // Dummy list of invoices
  final List<Map<String, dynamic>> invoices = [
    {
      'invoiceNumber': 'INV-001',
      'date': '2023-10-01',
      'totalAmount': 500.0,
      'status': 'Paid',
      'items': [
        {'item': 'Widget A', 'quantity': 10, 'price': 50.0},
        {'item': 'Widget B', 'quantity': 5, 'price': 100.0},
      ],
    },
    {
      'invoiceNumber': 'INV-002',
      'date': '2023-10-15',
      'totalAmount': 700.0,
      'status': 'Pending',
      'items': [
        {'item': 'Widget C', 'quantity': 20, 'price': 25.0},
      ],
    },
  ];

  CustomerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Information Section
            _buildCustomerInfo(),
            const SizedBox(height: 20),

            // Items Taken Section
            _buildInvoicesPreview(context),
            const SizedBox(height: 20),

            // Payments Made Section
            _buildPaymentsMade(),
            const SizedBox(height: 20),

            // Remaining Balance Section
            _buildRemainingBalance(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget to display customer information
  Widget _buildCustomerInfo() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Name: $customerName'),
            Text('Address: $customerAddress'),
          ],
        ),
      ),
    );
  }

  // Widget to display payments made
  Widget _buildPaymentsMade() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payments Made',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...paymentsMade.map((payment) {
              return ListTile(
                title: Text('Date: ${payment['date']}'),
                trailing: Text('\$${payment['amount']}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  // Widget to display remaining balance
  Widget _buildRemainingBalance() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Remaining Balance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$$remainingBalance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: remainingBalance >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display invoices in preview format
  Widget _buildInvoicesPreview(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoices',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...invoices.map((invoice) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text('Invoice #${invoice['invoiceNumber']}'),
                  subtitle: Text('Date: ${invoice['date']}'),
                  trailing: Text(
                    '\$${invoice['totalAmount']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigate to the detailed invoice screen
                    Navigator.pushNamed(
                      context,
                      '/invoiceDetail',
                      arguments: invoice,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
