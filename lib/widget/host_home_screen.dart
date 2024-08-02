// import 'package:flutter/material.dart';
// import 'package:flutter_lucide/flutter_lucide.dart';
// import 'package:putko/messages/host_message.dart';
// import 'package:putko/profile/profile_home.dart';
// import 'package:putko/calendar_screen/calendar.dart';
// import 'package:putko/listing_screen/listings.dart';
// import 'package:putko/today_screen/today_screen.dart';
//
// import '../shared/theme/colors.dart';
//
// class HostNavbar extends StatefulWidget {
//   const HostNavbar({super.key});
//
//   @override
//   State<HostNavbar> createState() => _HostNavbarState();
// }
//
// class _HostNavbarState extends State<HostNavbar> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 80),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: appBlack.withOpacity(0.1),
//             blurRadius: 1.0,
//             spreadRadius: 1.0,
//             offset: const Offset(0.0, -1.0),
//           )
//         ],
//       ),
//       child: NavigationBarTheme(
//         data: NavigationBarThemeData(
//           labelTextStyle: MaterialStatePropertyAll(
//             Theme.of(context).textTheme.bodySmall!.copyWith(color: appGreen),
//           ),
//         ),
//         child: NavigationBar(
//           backgroundColor: Colors.white,
//           surfaceTintColor: Colors.white,
//           labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//           onDestinationSelected: (int index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//             switch (index) {
//               case 0:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const TodayScreen(),
//                   ),
//                 );
//                 break;
//               case 1:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const Calendar(),
//                   ),
//                 );
//                 break;
//               case 2:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const Listings(),
//                   ),
//                 );
//                 break;
//               case 3:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const HostMessage(),
//                   ),
//                 );
//                 break;
//               case 4:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const ProfileHome(),
//                   ),
//                 );
//                 break;
//             }
//           },
//           indicatorColor: Colors.transparent,
//           selectedIndex: _selectedIndex,
//           height: 56.0,
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Icons.today_outlined),
//               label: 'Today',
//               selectedIcon: Icon(
//                 Icons.today_outlined,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.calendar_month),
//               label: 'Calendar',
//               selectedIcon: Icon(
//                 Icons.calendar_month,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.library_add_check),
//               label: 'Listings',
//               selectedIcon: Icon(
//                 Icons.library_add_check,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.message_outlined),
//               label: 'Message',
//               selectedIcon: Icon(
//                 Icons.message_outlined,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.menu),
//               label: 'Menu',
//               selectedIcon: Icon(
//                 Icons.menu,
//                 color: appGreen,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:putko/calendar_screen/calendar.dart';
import 'package:putko/listing_screen/listings.dart';
import 'package:putko/messages/host_message.dart';
import 'package:putko/today_screen/today_screen.dart';

import '../profile/profile_home.dart';
import '../shared/theme/colors.dart';

class HostHomeScreen extends StatefulWidget {
  const HostHomeScreen({super.key});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

class _HostHomeScreenState extends State<HostHomeScreen> {

  int selectedIndex = 0;

  final List<String> screenTitles = [
    "Today",
    "Calender",
    "Listings",
    "Message",
    "Menu",
  ];

  final List<Widget> screens = [
    TodayScreen(),
    Calendar(),
    Listings(),
    HostMessage(),
    ProfileHome(),
  ];

  BottomNavigationBarItem customNavigationBarItem(int index, IconData iconData, String title)
  {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: Colors.black,
      ),
      activeIcon: Icon(
        iconData,
        color: appGreen,
      ),
      label: title,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i)
          {
            setState(() {
              selectedIndex = i;
            });
          },
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>
          [
            customNavigationBarItem(0, Icons.today, screenTitles[0]),
            customNavigationBarItem(1, Icons.calendar_month, screenTitles[1]),
            customNavigationBarItem(2, Icons.add_box_sharp, screenTitles[2]),
            customNavigationBarItem(3, Icons.message, screenTitles[3]),
            customNavigationBarItem(4, Icons.menu, screenTitles[4]),
          ],
        )
    );
  }
}
