import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:putko/today_screen/all_reservation.dart';
import 'package:putko/widget/host_home_screen.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  String label = 'Today';
  int count = 0;
  bool isSelected = true;

  User? user;
  String? username;


  @override
  void initState() {
    super.initState();
    _getUsername();
  }


  _getUsername() async {
    user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      setState(() {
        username = userData.get('username'); // Use get() method to retrieve data from Firestore
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notification logic here
            },
          ),
        ],
      ),
      // bottomNavigationBar: const HostNavbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                children: [
                  Text(
                    "Welcome Back,\n$username",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Your reservations",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'Checking out (0)'),
                        Tab(text: 'Currently hosting (0)'),
                      ],
                    ),
                    const SizedBox(height: 20), // add some space between the tab bar and the tab bar view
                    Container(
                      height: 300, // adjust the height to your needs
                      child: const TabBarView(
                        children: [
                          CheckingOutBody(),
                          CurrentlyHostingBody(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // TabBarScreen(),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "We're here to help",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ],
              ),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_outline),
                                SizedBox(width: 16),
                                Text(
                                  'Guidance from a Superhost',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'We\'ll match you with an experienced Host who can help you get started.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.support_agent),
                                SizedBox(width: 16),
                                Text(
                                  'Contact specialized support',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'As a new Host, you get one-tap access to a specially trained support team.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "Resources and tips",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  ResourceCard(
                    imageUrl: 'images/introduction.jpg',
                    title: 'The Messages tab is your new inbox',
                  ),
                  SizedBox(height: 16),
                  ResourceCard(
                    imageUrl: 'images/introduction.jpg',
                    title: 'Earnings dashboard adds interactive charts and reporting...',
                  ),
                  SizedBox(height: 16),
                  ResourceCard(
                    imageUrl: 'images/introduction.jpg',
                    title: 'Upgraded profiles tell you more about your guests',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ResourceCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ResourceCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 1),
        // borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckingOutBody extends StatelessWidget {
  const CheckingOutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9, // 80% of the screen width
          height: 250, // Fixed height
          child: Card(
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 60,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You don\'t have any guests\nchecking out today or tomorrow.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllReservation()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text('All reservations (0)', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                ],
              ),
            )
        ),
      ],
    );
  }
}

class CurrentlyHostingBody extends StatelessWidget {
  const CurrentlyHostingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9, // 80% of the screen width
          height: 250, // Fixed height
          child: Card(
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 60,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'You don\'t have any guests\staying with you right now.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllReservation()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text('All reservations (0)', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
                ],
              ),
            )
        ),
      ],
    );
  }
}