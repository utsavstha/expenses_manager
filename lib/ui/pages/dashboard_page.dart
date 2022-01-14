import '../../constants.dart';
import 'package:flutter/material.dart';

import 'budget_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: const Icon(
          Icons.add,
        ), //icon inside button
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(4),
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
