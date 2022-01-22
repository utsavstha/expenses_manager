import 'package:expense_manager/routes/app_pages.dart';

import '../../utils/constants.dart';
import 'package:flutter/material.dart';

import 'budget_page.dart';
import 'daily_transactions.dart';
import 'profile_page.dart';
import 'stats_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const List<Widget> _widgetOptions = <Widget>[
    DailyTransaction(),
    StatsPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
  ];
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Registration Error"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        //Floating action button on Scaffold
        onPressed: () {
          Navigator.pushNamed(context, Routes.add_transaction);
        },
        child: const Icon(
          Icons.add,
        ), //icon inside button
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey.shade500,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.print,
                color: Colors.grey.shade500,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.people,
                color: Colors.grey.shade500,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
