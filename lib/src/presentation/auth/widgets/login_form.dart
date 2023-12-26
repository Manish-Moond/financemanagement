import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/colors.dart';
import '../cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$')
                      .hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kprimaryColor)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: kforthColor)),
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: kalertPink)),
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            obscureText: passToggle,
            validator: (value) {
              if (value!.length < 6) {
                return "Password must be atleast 6 chr";
              }
              return null;
            },
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child: Icon(passToggle
                    ? FluentIcons.eye_off_20_regular
                    : FluentIcons.eye_20_regular),
              ),
              labelText: 'Password',
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kprimaryColor)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: kforthColor)),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kalertPink)),
            ),
          ),
          const SizedBox(height: 16.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Forgot password?")],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Call the login method from the LoginCubit
                context.read<AuthCubit>().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: kprimaryColor,
                minimumSize: Size(size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
