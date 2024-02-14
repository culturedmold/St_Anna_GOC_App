import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/donate_view_components/donate_view.dart';

import '../home/home_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).primaryColor;
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        //elevation: 160,
        //backgroundColor: Theme.of(context).primaryColor,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        //selectedIndex: currentPageIndex,
        indicatorColor: Theme.of(context).highlightColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        destinations: <Widget>[
          NavigationDestination(
              icon: Icon(Icons.home, color: iconColor),
              label: "Home",
          ),
          NavigationDestination(
              icon: Icon(Icons.favorite, color: iconColor),
              label: "Donate"
          ),
          NavigationDestination(
              icon: Icon(Icons.question_mark, color: iconColor),
              label: "About"
          ),
        ],
      ),
      body: <Widget>[
        const HomeView(),
        const DonateView(),
      ][_currentPageIndex],
    );
  }

}