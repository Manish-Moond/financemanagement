import 'package:financemanagement/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: kprimaryColor, borderRadius: BorderRadius.circular(12.0)),
          width: size.width,
          height: size.height * 0.2,
          child: const Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 34,
              ),
              Text(
                "Balance",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "₹ 15650",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              )
            ],
          )),
    );
  }
}
