import 'package:expense_manager/controller/transaction_controller.dart';
import 'package:expense_manager/ui/components/progress_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../ui/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';

class AddTransactionPage extends ConsumerStatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

final currentPageStateProvider = AutoDisposeStateProvider<double>((ref) {
  return 0.5;
});

final expenseTypeProvider = StateProvider<String>((ref) {
  return "";
});

final pickedDateProvider = AutoDisposeStateProvider<String>((ref) {
  return "";
});

final createTransactionNotifierProvider =
    ChangeNotifierProvider.autoDispose<TransactionController>(
        (ref) => TransactionController());

class _AddTransactionPageState extends ConsumerState<AddTransactionPage> {
  PageController controller = PageController();
  void onPageChange() {
    controller.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    ref.watch(currentPageStateProvider.state).state = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final counter = ref.watch(currentPageStateProvider.state);
          return Column(
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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Add transaction',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              LinearProgressIndicator(
                  color: primaryColor, value: counter.state),
              Expanded(
                  child: PageView(
                controller: controller,
                children: [
                  StepOne(
                    onPress: onPageChange,
                  ),
                  StepTwo(
                    onPress: onPageChange,
                  )
                ],
              )),
            ],
          );
        },
      ),
    ));
  }
}

class StepOne extends ConsumerWidget {
  final onPress;
  const StepOne({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Center(
            child:
                SvgPicture.asset('assets/saving_illustration.svg', height: 150),
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
                child: GestureDetector(
                  onTap: () {
                    ref.watch(expenseTypeProvider.state).state = "Income";
                    onPress();
                  },
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
                            padding: const EdgeInsets.all(3.0),
                            decoration: const BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.watch(expenseTypeProvider.state).state = "Expense";
                    onPress();
                  },
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
                            padding: const EdgeInsets.all(3.0),
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StepTwo extends ConsumerWidget {
  final onPress;
  var dateController = TextEditingController();
  var payeeController = TextEditingController();
  var amountController = TextEditingController();

  StepTwo({Key? key, required this.onPress}) : super(key: key);
  void onDateSelect(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2000, 3, 5),
        maxTime: DateTime.now(), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
      dateController.text = date.year.toString() +
          "-" +
          date.month.toString() +
          "-" +
          date.day.toString();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context, ref) {
    final expenseType = ref.watch(expenseTypeProvider.state).state;
    final transactionController = ref.watch(createTransactionNotifierProvider);
    if (transactionController.apiResponse.isLoading) {
      return const ProgressDialog();
    } else if (transactionController.apiResponse.model != null &&
        (transactionController.apiResponse.model as bool)) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
      return const ProgressDialog();
    } else {
      return Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: expenseType == "Income"
                            ? secondaryColor
                            : primaryColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      expenseType == "Income"
                          ? Icons.keyboard_arrow_left_rounded
                          : Icons.keyboard_arrow_right_rounded,
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
                      const Text(
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
                        expenseType,
                        style: const TextStyle(
                            fontFamily: 'GTWalsheimPro',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
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
              TextField(
                controller: payeeController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
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
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontFamily: 'GTWalsheimPro',
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
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
              GestureDetector(
                onTap: () {
                  onDateSelect(context);
                },
                child: TextField(
                  controller: dateController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'GTWalsheimPro',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                      enabled: false,
                      border: UnderlineInputBorder(),
                      hintText: 'Select Date',
                      hintStyle: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              PrimaryButton(
                  title: "FINISH",
                  color: primaryColor,
                  onPress: () {
                    if (amountController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter amount')));
                      return;
                    }

                    if (payeeController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please enter Payee Name')));
                      return;
                    }

                    if (dateController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select date')));
                      return;
                    }

                    if (expenseType.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please select expense type')));
                      return;
                    }
                    transactionController.transaction(
                        payeeController.text,
                        amountController.text,
                        dateController.text,
                        expenseType);
                  }),
            ],
          ),
        ),
      );
    }
  }
}
