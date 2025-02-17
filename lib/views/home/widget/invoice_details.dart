import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final Map<String, dynamic> invoice;

  const InvoiceDetailsPage({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice #${invoice['invoiceNumber']}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Date: ${invoice['date']}'),
            const SizedBox(height: 8),
            Text(
              'Total Amount: \$${invoice['totalAmount']}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${invoice['status']}',
              style: TextStyle(
                color:
                    invoice['status'] == 'Paid' ? Colors.green : Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Items:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...invoice['items'].map<Widget>((item) {
              return ListTile(
                title: Text(item['item']),
                subtitle: Text('Quantity: ${item['quantity']}'),
                trailing: Text('\$${item['price'] * item['quantity']}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
