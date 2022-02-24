import 'package:expense_manager/model/transaction_model.dart';
import 'package:expense_manager/ui/pages/add_transaction_page.dart';
import 'package:expense_manager/ui/pages/create_budget_page.dart';
import 'package:expense_manager/ui/pages/dashboard_page.dart';
import 'package:expense_manager/ui/pages/forgot_password_page.dart';
import 'package:expense_manager/ui/pages/login_page.dart';
import 'package:expense_manager/ui/pages/signup_page.dart';
import 'package:expense_manager/ui/pages/stat_detail_page.dart';
import 'package:expense_manager/ui/pages/transaction_detail.dart';

import 'app_pages.dart';

class AppPages {
  static const initial = Routes.login;
  static final routes = {
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const DashboardPage(),
    Routes.register: (context) => const SignUpPage(),
    Routes.forgotPassword: (context) => const ForgotPasswordPage(),
    Routes.add_transaction: (context) => const AddTransactionPage(),
    Routes.transactionDetail: (context) => const TransactionDetail(),
    Routes.addBudget: (context) => const CreateBudgetPage(),
    Routes.statsDetail: (context) => const StatDetailPage()
  };
}
