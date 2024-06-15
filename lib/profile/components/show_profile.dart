import 'package:flutter/material.dart';
import 'package:putko/profile/components/create_profile.dart';
import 'package:putko/profile/components/get_the_badge.dart';
import 'package:putko/widget/common_button.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 40,
              right: 8.0,
              child: ElevatedButton(
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateProfile()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Column(
            children: [
        
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 150,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black,
                              child: Text(
                                'H',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Hamza',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Guest',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    const Text(
                      '1\nYear on Airbnb',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 25),
        
              const Row(
                children: [
                  Text("Hamza Confirmed",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      title: const Text('Email address'),
                      value: true,
                      onChanged: (value) {},
                    ),
                    CheckboxListTile(
                      title: const Text('Phone number'),
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 10),
        
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
        
              const SizedBox(height: 25),
        
              const Row(
                children: [
                  Text(
                    "Identity verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
        
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 20),
                    child: Text(
                      "Show other you're really you with the \nidentity verification badge.",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
        
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black),
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Add this line
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const GetTheBadge(),
                        ),
                      );
                    },
                    child: const Text("Get the badge"),
                  ),
                ],
              ),
        
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
        
              const SizedBox(height: 25),
        
              const Row(
                children: [
                  Text(
                    "It's time to create your Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
        
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Your Putko profile is an important part of every\nreservation. Create yours to help other Hosts\nand guests get to know you.",
                      style: TextStyle(

                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 20),
                child: CommonButton(
                  buttonText: "Create Profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateProfile()),
                    );
                  },
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}

