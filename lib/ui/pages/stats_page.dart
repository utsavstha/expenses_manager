import 'package:expense_manager/controller/stat_controller.dart';
import 'package:expense_manager/model/stats_detail.dart';
import 'package:expense_manager/model/transaction_model.dart';
import 'package:expense_manager/routes/app_pages.dart';
import 'package:expense_manager/ui/components/no_data.dart';
import 'package:expense_manager/ui/components/progress_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants.dart';
import '../../ui/components/chart_component.dart';
import '../../ui/components/toolbar_component.dart';
import 'package:flutter/material.dart';

final statsNotifierProvider =
    ChangeNotifierProvider.autoDispose<StatsController>(
        (ref) => StatsController());
final totalIncomeProvider = StateProvider<double>((ref) {
  return 0;
});
final totalExpenseProvider = StateProvider<double>((ref) {
  return 0;
});

class StatsPage extends ConsumerStatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StateState createState() => _StateState();
}

class _StateState extends ConsumerState<StatsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(statsNotifierProvider).getExpenses();
    });
  }

  double _calculateTotal(List<Data> data, String type) {
    double total = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i].type == type) {
        total += double.parse(data[i].amount);
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(statsNotifierProvider);

    if (provider.apiResponse.isLoading) {
      return const Scaffold(body: SafeArea(child: ProgressDialog()));
    }
    if (provider.apiResponse.model == null ||
        (provider.apiResponse.model as Transaction).data.isEmpty) {
      return const Scaffold(body: SafeArea(child: NoData()));
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        ref.read(totalIncomeProvider.state).state = _calculateTotal(
            (provider.apiResponse.model as Transaction).data, "INCOME");

        ref.read(totalExpenseProvider.state).state = _calculateTotal(
            (provider.apiResponse.model as Transaction).data, "EXPENSE");
      });

      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ToolbarComponent(
                title: 'Stats',
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Net balance',
                        style: TextStyle(
                            fontFamily: 'GTWalsheimPro',
                            color: Colors.grey.shade400,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rs ' +
                            (ref.read(totalExpenseProvider.state).state -
                                    ref.read(totalIncomeProvider.state).state)
                                .toString(),
                        style: const TextStyle(
                            fontFamily: 'GTWalsheimPro',
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                          height: 300,
                          child: ChartComponent(
                            transaction:
                                (provider.apiResponse.model as Transaction)
                                    .data,
                          )),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.statsDetail,
                            arguments: StatsDetail(
                                (provider.apiResponse.model as Transaction)
                                    .data,
                                'Income',
                                ref.read(totalIncomeProvider.state).state));
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
                                    color: secondaryColor,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Income',
                                style: TextStyle(
                                    fontFamily: 'GTWalsheimPro',
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Rs ' +
                                    ref
                                        .read(totalIncomeProvider.state)
                                        .state
                                        .toString(),
                                style: const TextStyle(
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
                        Navigator.pushNamed(context, Routes.statsDetail,
                            arguments: StatsDetail(
                                (provider.apiResponse.model as Transaction)
                                    .data,
                                'Expense',
                                ref.read(totalExpenseProvider.state).state));
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
                                    color: primaryColor,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Expense',
                                style: TextStyle(
                                    fontFamily: 'GTWalsheimPro',
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Rs ' +
                                    ref
                                        .read(totalExpenseProvider.state)
                                        .state
                                        .toString(),
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
        ),
      );
    }
  }
}
