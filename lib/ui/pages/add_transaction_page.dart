import '../../ui/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int _currentStep = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.close,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Add transaction',
                  style: const TextStyle(
                      fontFamily: 'GTWalsheimPro',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          LinearProgressIndicator(color: primaryColor, value: 0.5),
          Expanded(
              child: PageView(
            controller: controller,
            children: [StepTwo(), StepOne()],
          )),
        ],
      ),
    ));
  }
}

class StepOne extends StatelessWidget {
  const StepOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: SvgPicture.asset('assets/saving_illustration.svg',
                  height: 150),
            ),
            const SizedBox(height: 30),
            const Text(
              'What kind of \ntransaction is this?',
              style: TextStyle(
                  fontFamily: 'GTWalsheimPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: secondaryColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Type',
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Expense',
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            'Payee name',
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w700),
          ),
          const TextField(
            keyboardType: TextInputType.name,
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter payee name',
                hintStyle: TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Amount',
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w700),
          ),
          const TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: '0.00',
                hintStyle: TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Date',
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w700),
          ),
          const TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Select Date',
                hintStyle: TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 50,
          ),
          PrimaryButton(title: "FINISH", color: primaryColor, onPress: null),
        ],
      ),
    );
  }
}
