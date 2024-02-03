import 'package:flutter/material.dart';
import 'package:st_anna_goc_app/view/donate_view_components/donate_view.dart';

import '../home/home_view.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        //elevation: 160,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        // indicatorColor: theme.colorScheme.secondaryContainer,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[

          NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home"
          ),

          NavigationDestination(
              icon: Icon(Icons.favorite),
              label: "Donate"
          ),

          NavigationDestination(
              icon: Icon(Icons.question_mark),
              label: "About"
          ),

        ],
      ),
      body: <Widget>[
        const HomeView(title: 'St Anna GOC'),
        const DonateView(),
      ][currentPageIndex],
    );
  }

}