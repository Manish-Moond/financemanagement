import 'package:financemanagement/src/presentation/auth/widgets/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 200),
                const LoginHeader(),
                const LoginForm(),
                const LoginFooter()
              ],
            ),
          ),
        );
      }, listener: (context, state) {
        if (state.isSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state.error.isNotEmpty) {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }),
    );
  }
}
