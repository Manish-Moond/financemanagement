import 'package:financemanagement/src/presentation/home/cubit/transaction_cubit.dart';
import 'package:financemanagement/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: size.width * .3,
            child: TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kalertPink)),
                labelText: '₹',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            width: size.width * 0.7,
            child: TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.7,
              child: Row(
                children: [
                  const Text("Expence"),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.lightGreenAccent,
                  ),
                  const Text("Income")
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TransactionCubit>().add(
                    note: _noteController.text,
                    date: DateTime.now().toString().substring(0, 11),
                    time: DateTime.now().toString().substring(11, 19),
                    price: _priceController.text,
                    type: isSwitched ? 'inc' : "exp",
                  );

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3.0, // Elevation
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(18.0, 4, 18, 4),
              child: Text(
                "ADD",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
