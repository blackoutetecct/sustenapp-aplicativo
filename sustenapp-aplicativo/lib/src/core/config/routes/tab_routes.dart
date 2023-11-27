import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';
import 'package:susten_app/src/core/widgets/dialog.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/energy_screen.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/home_screen.dart';
import 'package:susten_app/src/features/consumption/presentation/screens/water_screen.dart';
import 'package:susten_app/src/features/perfil/presentation/screens/profile_screen.dart';

class TabRoutes extends StatefulWidget {
  const TabRoutes({Key? key}) : super(key: key);

  @override
  State<TabRoutes> createState() => _TabRoutesState();
}

class _TabRoutesState extends State<TabRoutes> {
  List<Widget> pages = [
    const HomeScreen(),
    const WaterScreen(),
    const EnergyScreen(),
    const ProfileScreen()
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      floatingActionButton: Opacity(
        opacity: currentPageIndex != 3 ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {
            final dialog = MyCustomDialog();
            dialog.showMyDialog(context, MyCustomDialogType.ROOM, null);
          },
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home_filled,
          Icons.water_drop,
          Icons.power,
          Icons.person,
        ],
        activeIndex: currentPageIndex,
        inactiveColor: const Color(0xFFC3CDE6),
        activeColor: primaryColor,
        iconSize: 35,
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => currentPageIndex = index),
        //other params
      ),
    );
  }
}
