import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({required this.child, super.key});
  final Widget child;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  static const List<String> _routes = [
    HomeRouteNames.home,
    HomeRouteNames.profile,
    HomeRouteNames.profile,
  ];

  void _onDestinationSelected(int index) {
    getNavigationService().go(_routes[index]);
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    // l10n = context.l10n;

    // Define the destinations once
    final destinations = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        label: "Home",
      ),
      NavigationDestination(
        icon: const Icon(Icons.receipt_outlined),
        label: "Search",
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_outline),
        label: "More",
      ),
    ];

    final destinationsNavRail = [
      NavigationRailDestination(
        icon: const Icon(Icons.home_outlined),
        label: Text("Home"),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.receipt_outlined),
        label: Text("Search"),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.person_outline),
        label: Text("Menu"),
      ),
    ];

    if (MediaQuery.of(context).size.width > 600 &&
        MediaQuery.of(context).size.height > 400) {
      return Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              NavigationRail(
                // leading: const MotyBaseLogo(
                //   size: 60,
                // ),
                selectedIndex: _currentIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: destinationsNavRail,
                labelType: NavigationRailLabelType.all,
                groupAlignment: 0,
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: widget.child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _onDestinationSelected,
          destinations: destinations,
        ),
      );
    }
  }
}
