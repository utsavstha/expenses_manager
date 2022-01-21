import '../../ui/components/primary_button.dart';
import '../../ui/components/toolbar_with_back_component.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({Key? key}) : super(key: key);

  @override
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ToolbarWithBackComponent(title: 'Create Budget'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Budget Title',
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700),
                  ),
                  const TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: 'GTWalsheimPro',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Please enter budget title',
                        hintStyle: TextStyle(
                            fontFamily: 'GTWalsheimPro',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Budget Amount',
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
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                      title: "Save", color: primaryColor, onPress: null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
