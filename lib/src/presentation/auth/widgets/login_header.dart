import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  // final Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Log in",
          style: TextStyle(
              color: kprimaryColor,
              fontSize: 28,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold),
        ),
        const Text(
          "Please log in to continue ",
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
