import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

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
    HomeRouteNames.search,
    HomeRouteNames.generator,
    HomeRouteNames.myDomains,
    HomeRouteNames.more,
  ];

  void _onDestinationSelected(int index) {
    getNavigationService().go(_routes[index]);
    // don't setState here; index updates via router listener
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routerDelegate = getNavigationService().router.routerDelegate
      ..addListener(_onRouteChanged);

    // Initialize once
    _updateIndex(routerDelegate.currentConfiguration.uri.toString());
  }

  void _onRouteChanged() {
    final routerDelegate = getNavigationService().router.routerDelegate;
    final location = routerDelegate.currentConfiguration.uri.toString();
    _updateIndex(location);
  }

  void _updateIndex(String location) {
    // Match based on prefix: "/generator/details/123" → "/generator"
    final index = _routes.indexWhere(
      (r) => location == r || location.startsWith('$r/'),
    );

    if (index != -1 && index != _currentIndex) {
      setState(() => _currentIndex = index);
    }
  }

  @override
  void dispose() {
    getNavigationService().router.routerDelegate.removeListener(
      _onRouteChanged,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final destinations = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        label: context.k3voL10n.home,
      ),
      const NavigationDestination(
        icon: Icon(Icons.search),
        label: 'Lookup',
      ),
      const NavigationDestination(
        icon: Icon(Icons.auto_awesome_outlined),
        label: 'Generator',
      ),
      const NavigationDestination(
        icon: Icon(Icons.bookmarks_outlined),
        label: 'Domains',
      ),
      const NavigationDestination(
        icon: Icon(Icons.more_horiz),
        label: 'More',
      ),
    ];

    final destinationsNavRail = [
      NavigationRailDestination(
        icon: const Icon(Icons.home_outlined),
        label: Text(context.k3voL10n.home),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.search),
        label: Text('Lookup'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.auto_awesome_outlined),
        label: Text('Generator'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.bookmarks_outlined),
        label: Text('Domains'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.more_horiz),
        label: Text('More'),
      ),
    ];

    if (MediaQuery.of(context).size.width > 600 &&
        MediaQuery.of(context).size.height > 400) {
      return Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              NavigationRail(
                leading: const K3voLogo(size: 60),
                selectedIndex: _currentIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: destinationsNavRail,
                labelType: NavigationRailLabelType.all,
                groupAlignment: 0,
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: widget.child),
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
