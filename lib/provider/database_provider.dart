import 'package:expense_manager/dao/transaction_dao.dart';
import 'package:riverpod/riverpod.dart';

final databaseProvider = StateProvider<TransactionDao?>((ref) {
  return null;
});
