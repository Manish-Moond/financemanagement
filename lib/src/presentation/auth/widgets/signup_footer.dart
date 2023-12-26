import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(
        height: size.height * 0.02,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              indent: 20.0,
              endIndent: 10.0,
              thickness: 1,
              color: ktextColorsSecondry,
            ),
          ),
          Text(
            "OR",
            style: TextStyle(
              color: ktextColorsSecondry,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 10.0,
              endIndent: 20.0,
              thickness: 1,
              color: ktextColorsSecondry,
            ),
          ),
        ],
      ),
      // const SizedBox(
      //   height: 24,
      // ),
      // InkWell(
      //   onTap: () {
      //     context.read<AuthCubit>().signInWithGoogle();
      //   },
      //   child: const Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text(
      //         "Signup with Google",
      //         style: TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.w500,
      //             fontFamily: "Poppins"),
      //       ),
      //       Image(
      //         image: AssetImage("assets/images/googleLogo.png"),
      //         height: 28,
      //       )
      //     ],
      //   ),
      // ),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account",
            style: TextStyle(color: ktextColorsSecondry, fontFamily: "Poppins"),
          ),
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/login");
            },
            style: TextButton.styleFrom(foregroundColor: kprimaryColor),
            child: const Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  fontFamily: "Poppins"),
            ),
          ),
        ],
      )
    ]);
  }
}
