import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:putko/messages/message_home.dart';
import 'package:putko/profile/profile_home.dart';
import 'package:putko/screens/home_screen.dart';
import 'package:putko/trips/trips_home.dart';
import 'package:putko/wishlists/wishlist_screen.dart';

import '../shared/theme/colors.dart';

// class AppNavBar extends StatefulWidget {
//   const AppNavBar({super.key});
//
//   @override
//   _AppNavBarState createState() => _AppNavBarState();
// }
//
// class _AppNavBarState extends State<AppNavBar> {
//   int _selectedIndex = 0;
//
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
//                     builder: (e) => const HomeScreen(),
//                   ),
//                 );
//                 break;
//               // case 1:
//               //   Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //       builder: (e) => const WishlistScreen(),
//               //     ),
//               //   );
//               //   break;
//               case 1:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const TripsHome(),
//                   ),
//                 );
//                 break;
//               case 2:
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (e) => const MessageHome(),
//                   ),
//                 );
//                 break;
//               case 3:
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
//               icon: Icon(Icons.search_outlined),
//               label: 'Explore',
//               selectedIcon: Icon(
//                 LucideIcons.search,
//                 color: appBlack,
//               ),
//             ),
//             // NavigationDestination(
//             //   icon: Icon(Icons.favorite_border_outlined),
//             //   label: 'Wishlist',
//             //   selectedIcon: Icon(
//             //     Icons.favorite,
//             //     color: appRed,
//             //   ),
//             // ),
//             NavigationDestination(
//               icon: Icon(Icons.wb_sunny_outlined),
//               label: 'Trips',
//               selectedIcon: Icon(
//                 Icons.wb_sunny,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.message_outlined),
//               label: 'Inbox',
//               selectedIcon: Icon(
//                 Icons.message,
//                 color: appBlack,
//               ),
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.person_outline),
//               label: 'Profile',
//               selectedIcon: Icon(
//                 Icons.person,
//                 color: appBlack,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {

  int selectedIndex = 0;

  final List<String> screenTitles = [
    "Explore",
    // "Saved",
    "Trips",
    "Inbox",
    "Profile",
  ];

  final List<Widget> screens = [
    HomeScreen(),
    // WishlistScreen(),
    TripsHome(),
    MessageHome(),
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
          customNavigationBarItem(0, Icons.search, screenTitles[0]),
          customNavigationBarItem(1, Icons.hotel, screenTitles[1]),
          customNavigationBarItem(2, Icons.message, screenTitles[2]),
          customNavigationBarItem(3, Icons.person_outlined, screenTitles[3]),
        ],
      )
    );
  }
}
