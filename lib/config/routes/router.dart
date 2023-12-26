import 'package:financemanagement/src/presentation/home/add_transaction_page.dart';
import 'package:financemanagement/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../src/presentation/auth/login_page.dart';
import '../../src/presentation/auth/signUp_page.dart';

class AppRouter {
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String homeRoute = '/home';
  static const String addTransactionPageRoute = '/addTransactionPage';

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case addTransactionPageRoute:
        return MaterialPageRoute(builder: (_) => const AddTransactionPage());
      default:
        return null;
    }
  }
}
