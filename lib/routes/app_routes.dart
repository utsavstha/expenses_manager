import 'package:expense_manager/ui/pages/dashboard_page.dart';
import 'package:expense_manager/ui/pages/forgot_password_page.dart';
import 'package:expense_manager/ui/pages/login_page.dart';
import 'package:expense_manager/ui/pages/signup_page.dart';

import 'app_pages.dart';

class AppPages {
  static const initial = Routes.login;
  static final routes = {
    Routes.login: (context) => const LoginPage(),
    Routes.home: (context) => const DashboardPage(),
    Routes.register: (context) => const SignUpPage(),
    Routes.forgotPassword: (context) => const ForgotPasswordPage()
  };
}