import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:putko/messages/host_message.dart';
import 'package:putko/profile/profile_home.dart';
import 'package:putko/calendar_screen/calendar.dart';
import 'package:putko/listing_screen/listings.dart';
import 'package:putko/today_screen/today_screen.dart';

import '../shared/theme/colors.dart';

class HostNavbar extends StatefulWidget {
  const HostNavbar({super.key});

  @override
  State<HostNavbar> createState() => _HostNavbarState();
}

class _HostNavbarState extends State<HostNavbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: appBlack.withOpacity(0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, -1.0),
          )
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.bodySmall!.copyWith(color: appRed),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const TodayScreen(),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const Calendar(),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const Listings(),
                  ),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const HostMessage(),
                  ),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (e) => const ProfileHome(),
                  ),
                );
                break;
            }
          },
          indicatorColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          height: 56.0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.today_outlined),
              label: 'Today',
              selectedIcon: Icon(
                Icons.today_outlined,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              selectedIcon: Icon(
                Icons.calendar_month,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.library_add_check),
              label: 'Listings',
              selectedIcon: Icon(
                Icons.library_add_check,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
              selectedIcon: Icon(
                Icons.message_outlined,
                color: appRed,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: 'Menu',
              selectedIcon: Icon(
                Icons.menu,
                color: appRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
