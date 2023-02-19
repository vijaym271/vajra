import 'package:flutter/material.dart';
import 'package:vajra/pages/discounts_page.dart';
import 'package:vajra/pages/home_page.dart';
import 'package:vajra/pages/more_page.dart';
import 'package:vajra/pages/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vajra/utils/color_utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    DiscountsPage(),
    MorePage()
  ];
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Home', '/', FontAwesomeIcons.house, ColorUtils.black),
    Destination(1, 'Search', '/search', FontAwesomeIcons.magnifyingGlass,
        ColorUtils.black),
    Destination(
        2, 'Discounts', '/discounts', FontAwesomeIcons.tag, ColorUtils.black),
    Destination(3, 'More', '/more', FontAwesomeIcons.ellipsisVertical,
        ColorUtils.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
          backgroundColor: ColorUtils.white,
          height: 60.0,
          destinations: allDestinations
              .map((Destination destination) => NavigationDestination(
                    selectedIcon: FaIcon(
                      destination.icon,
                      size: 20.0,
                      color: ColorUtils.white,
                    ),
                    icon: FaIcon(
                      destination.icon,
                      size: 20.0,
                    ),
                    label: destination.title,
                  ))
              .toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) => setState(() {
                selectedIndex = value;
              })),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.path, this.icon, this.color);
  final int index;
  final String title;
  final String path;
  final IconData icon;
  final Color color;
}
