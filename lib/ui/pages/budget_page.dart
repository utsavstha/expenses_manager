import '../../ui/components/toolbar_component.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14))),
            padding: const EdgeInsets.all(8),
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Budget',
                  style: const TextStyle(
                      fontFamily: 'GTWalsheimPro',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.add,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.calendar_today_rounded,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Budget Name',
                                  style: TextStyle(
                                      fontFamily: 'GTWalsheimPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  'Rs 400',
                                  style: TextStyle(
                                      fontFamily: 'GTWalsheimPro',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Rs 3000',
                              style: TextStyle(
                                  fontFamily: 'GTWalsheimPro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            LinearProgressIndicator(
                              value: 10,
                              semanticsLabel: 'Linear progress indicator',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}
