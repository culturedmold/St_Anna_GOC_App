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
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          return const TextStyle(color: Colors.white);
          }
          )
        ),
        child: NavigationBar(
          selectedIndex: _currentPageIndex,
          //elevation: 160,
          backgroundColor: Theme.of(context).primaryColor,
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          //selectedIndex: currentPageIndex,
          indicatorColor: Theme.of(context).highlightColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

          destinations: const <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home, color: Colors.white,),
                label: "Home",
            ),
            NavigationDestination(
                icon: Icon(Icons.favorite, color: Colors.white),
                label: "Donate"
            ),
            NavigationDestination(
                icon: Icon(Icons.question_mark, color: Colors.white),
                label: "About"
            ),
          ],
        ),
      ),
      body: <Widget>[
        const HomeView(title: 'St Anna GOC'),
        const DonateView(),
      ][_currentPageIndex],
    );
  }

}