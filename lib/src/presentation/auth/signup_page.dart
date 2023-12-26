import 'package:financemanagement/src/presentation/auth/cubit/auth_cubit.dart';
import 'package:financemanagement/src/presentation/auth/widgets/signup_footer.dart';
import 'package:financemanagement/src/presentation/auth/widgets/signup_form.dart';
import 'package:financemanagement/src/presentation/auth/widgets/signup_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 200),
                  const SignupHeader(),
                  const SignupForm(),
                  const SignupFooter()
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.pushReplacementNamed(context, "/home");
          } else if (state.error.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
      ),
    );
  }
}
