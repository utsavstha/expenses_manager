import 'package:expense_manager/model/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TransactionListComponent extends StatefulWidget {
  final Transaction transaction;
  const TransactionListComponent({Key? key, required this.transaction})
      : super(key: key);

  @override
  _TransactionListComponentState createState() =>
      _TransactionListComponentState();
}

class _TransactionListComponentState extends State<TransactionListComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.transaction.data.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.transaction.data[index].payeeName,
                    style: const TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rs. " + widget.transaction.data[index].amount,
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 16,
                        color: widget.transaction.data[index].type == "INCOME"
                            ? accentColor
                            : primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.transaction.data[index].date.split('T')[0],
                style: const TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}
