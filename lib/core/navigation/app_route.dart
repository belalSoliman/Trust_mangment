//routeing methods for the app
import 'package:flutter/material.dart';
import 'package:trust/core/navigation/routes.dart';
import 'package:trust/views/home/home.dart';
import 'package:trust/views/home/widget/customer_page_view.dart';
import 'package:trust/views/home/widget/invoice_details.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.customerView:
        return MaterialPageRoute(builder: (_) => CustomerPageView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Routes.invoiceDetailsPage:
        final invoice = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            builder: (_) => InvoiceDetailsPage(
                  invoice: invoice,
                ));
      default:
        return null;
    }
  }
}
