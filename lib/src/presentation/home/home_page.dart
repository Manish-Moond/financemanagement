import 'package:financemanagement/src/presentation/home/cubit/transaction_cubit.dart';
import 'package:financemanagement/src/presentation/home/widgets/balance_card.dart';
import 'package:financemanagement/src/presentation/home/widgets/transaction_card.dart';
import 'package:financemanagement/utils/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Account/account_page.dart';
import '../tranasction/transaction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static List<Map<String, String>> transactionList = [
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'sub'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'add'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'sub'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'add'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'sub'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'add'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'sub'
    },
    {
      'name': 'Food & Drinks',
      'price': '500',
      'date': '12/12/2033',
      'type': 'add'
    },
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const TransactionPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money tracker"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0
                    ? FluentIcons.home_12_filled
                    : FluentIcons.home_20_regular,
                color: _selectedIndex == 0 ? kprimaryColor : kiconGrey,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1
                    ? FluentIcons.arrow_swap_16_filled
                    : FluentIcons.arrow_swap_20_regular,
                color: _selectedIndex == 1 ? kprimaryColor : kiconGrey,
              ),
              label: "Transaction"),
          BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? FluentIcons.person_20_filled
                    : FluentIcons.person_20_regular,
                color: _selectedIndex == 2 ? kprimaryColor : kiconGrey,
              ),
              label: "Account"),
        ],
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          })
        },
        backgroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTransactionPage');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BalanceCard(),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 40, 8, 8),
                child: Text(
                  "Transactions",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              Expanded(
                child: BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    return state.transactionList.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.transactionList.length,
                            itemBuilder: (context, index) => TransactionCard(
                                  item: state.transactionList[index],
                                ))
                        : const Center(
                            child: Text(
                              "Add transaction",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          );
                  },
                ),
              )
            ],
          ),
          Positioned(
              top: size.height * .17,
              left: size.width * .2,
              child: Container(
                width: size.width * 0.5,
                height: size.height * .08,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 122, 122, 122),
                        spreadRadius: 1, // Spread radius
                        blurRadius: 10, // Blur radius
                        offset: Offset(0, 3),
                      )
                    ]),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                  color: kthirdColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "12000",
                              style: TextStyle(
                                  color: kthirdColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Color.fromARGB(255, 127, 127, 127),
                        thickness: 1.0,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Expense",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: ksecondryColor),
                            ),
                            Text(
                              "10000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: ksecondryColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
