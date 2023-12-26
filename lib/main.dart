import 'package:financemanagement/config/routes/router.dart';
import 'package:financemanagement/config/theme/theme.dart';
import 'package:financemanagement/firebase_options.dart';
import 'package:financemanagement/src/presentation/auth/cubit/auth_cubit.dart';
import 'package:financemanagement/src/presentation/home/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    appRouter: AppRouter(),
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.prefs});
  final AppRouter appRouter;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = prefs.getBool('isLoggedInFin') ?? false;
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => di.sl<AuthCubit>()),
        BlocProvider<TransactionCubit>(
            create: (_) => di.sl<TransactionCubit>()),
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: isLoggedIn ? AppRouter.homeRoute : AppRouter.loginRoute,
        title: 'Finance Management',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
