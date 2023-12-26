import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign up",
          style: TextStyle(
              color: kprimaryColor,
              fontSize: 28,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold),
        ),
        const Text(
          "Sign up to live in your dream",
          style: TextStyle(
              color: kforthColor,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}
