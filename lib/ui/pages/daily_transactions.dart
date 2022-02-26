import 'dart:async';

import 'package:expense_manager/controller/daily_transaction_controller.dart';
import 'package:expense_manager/model/transaction_model.dart';
import 'package:expense_manager/provider/database_provider.dart';
import 'package:expense_manager/ui/components/no_data.dart';
import 'package:expense_manager/ui/components/progress_dialog.dart';
import 'package:expense_manager/utils/connection_status.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/toolbar_component.dart';
import '../components/transaction_list_component.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

final dailyTransactionProvider =
    ChangeNotifierProvider.autoDispose<DailyTransactionController>(
        (ref) => DailyTransactionController());

class DailyTransaction extends ConsumerStatefulWidget {
  const DailyTransaction({Key? key}) : super(key: key);

  @override
  _DailyTransactionState createState() => _DailyTransactionState();
}

class _DailyTransactionState extends ConsumerState<DailyTransaction> {
  late StreamSubscription _connectionChangeStream;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final dao = ref.read(databaseProvider.state).state;
      DateTime now = DateTime.now();
      if (connectionStatus.hasConnection) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          ref.read(dailyTransactionProvider).getTransaction(
              now.year.toString() +
                  "-" +
                  (now.month > 9
                      ? now.month.toString()
                      : "0" + now.month.toString()) +
                  "-" +
                  now.day.toString());
        });
      } else {
        _fetchLocal();
      }
    });
  }

  _fetchLocal() async {
    final dao = ref.read(databaseProvider.state).state;
    if (dao != null) {
      DateTime now = DateTime.now();
      final all = await dao.findAllTransaction();
      final localTransactions = await dao.findTransactionByDate(now.year
              .toString() +
          "-" +
          (now.month > 9 ? now.month.toString() : "0" + now.month.toString()) +
          "-" +
          now.day.toString() +
          "T00:00:00.000Z");
      ref.read(dailyTransactionProvider).transactions = localTransactions;
    }
  }

  void connectionChanged(dynamic hasConnection) {
    DateTime now = DateTime.now();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(dailyTransactionProvider).getTransaction(now.year.toString() +
          "-" +
          (now.month > 9 ? now.month.toString() : "0" + now.month.toString()) +
          "-" +
          now.day.toString());
    });
  }

  void onDateSelect(BuildContext context, WidgetRef ref) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2000, 3, 5),
        maxTime: DateTime.now(), onConfirm: (date) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        ref.read(dailyTransactionProvider).getTransaction(date.year.toString() +
            "-" +
            (date.month > 9
                ? date.month.toString()
                : "0" + date.month.toString()) +
            "-" +
            date.day.toString());
        ref.read(dailyTransactionProvider).apiResponse.isLoading = false;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final provider = ref.watch(dailyTransactionProvider);
        if (provider.apiResponse.isLoading) {
          return const ProgressDialog();
        } else {
          return Column(
            children: [
              ToolbarComponent(
                title: 'Daily Transactions',
                onPress: () {
                  onDateSelect(context, ref);
                },
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (provider.transactions.isEmpty
                    ? const NoData()
                    : TransactionListComponent(
                        transaction: (provider.transactions))),
              ))
            ],
          );
        }
      },
    );
  }
}
