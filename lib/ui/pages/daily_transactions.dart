import '../components/toolbar_component.dart';
import '../components/transaction_list_component.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DailyTransaction extends StatefulWidget {
  const DailyTransaction({Key? key}) : super(key: key);

  @override
  _DailyTransactionState createState() => _DailyTransactionState();
}

class _DailyTransactionState extends State<DailyTransaction> {
  final items = [
    {'title': 'Breakfast', 'price': 'Rs 100', 'date': '2022-01-10'}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ToolbarComponent(
          title: 'Daily Transactions',
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TransactionListComponent()),
        )
      ],
    );
  }
}
