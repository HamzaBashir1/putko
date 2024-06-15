import 'package:flutter/material.dart';

class PrivacySharing extends StatefulWidget {
  const PrivacySharing({super.key});

  @override
  State<PrivacySharing> createState() => _PrivacySharingState();
}

class _PrivacySharingState extends State<PrivacySharing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Privacy and sharing",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "Manage your data, third-party tools, and sharing settings",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Request your personal data',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("We'll create a file for you to download your personal data."),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to a screen for requesting personal data
                    },
                  ),

                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),

                  ListTile(
                    title: Text('Delete your account',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("This will permanently delete your account and your data, in accordance with applicable law."),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to a screen for deleting the account
                    },
                  ),

                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),

                  ListTile(
                    title: Text('Sharing',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Decide how your profile and activity are shown to others"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to a screen for sharing settings
                    },
                  ),

                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),

                  ListTile(
                    title: Text('Services',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("View and manage services that you've connected to your Putko account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to a screen for managing connected services
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}