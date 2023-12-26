import 'package:financemanagement/src/domain/entities/transaction_entity.dart';
import 'package:financemanagement/utils/constants/colors.dart';
import 'package:flutter/widgets.dart';

class TransactionCard extends StatelessWidget {
  final TransactionEntity item;
  const TransactionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .09,
      width: size.width,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.note,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(item.date)
            ],
          ),
          Text(
            "${item.type == 'sub' ? "- " : "+ "}${item.price}",
            style: TextStyle(
                color: item.type == 'exp' ? ksecondryColor : kthirdColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
