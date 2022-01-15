import 'package:flutter/material.dart';

import '../../constants.dart';

class TransactionListComponent extends StatefulWidget {
  const TransactionListComponent({Key? key}) : super(key: key);

  @override
  _TransactionListComponentState createState() =>
      _TransactionListComponentState();
}

class _TransactionListComponentState extends State<TransactionListComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
                    'Breakfast',
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Rs 400',
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 16,
                        color: accentColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Friday 10:00 AM',
                style: TextStyle(
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
