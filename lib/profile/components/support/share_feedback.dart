import 'package:flutter/material.dart';

import '../../../screens/home_screen.dart';

class ShareFeedback extends StatefulWidget {
  const ShareFeedback({super.key});

  @override
  State<ShareFeedback> createState() => _ShareFeedbackState();
}

class _ShareFeedbackState extends State<ShareFeedback> {

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
        
              const Row(
                children: [
                  Text("Share your Feedback",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
        
              const Text("Thanks for sending us your ideas, issues, or appreciations. We can't respond individually, but we'll pass it on to the teams who are working to help make Putko better for everyone.",
              style: TextStyle(
                fontSize: 16
              ),
              ),
              const SizedBox(
                height: 20,
              ),
        
              const Text("If you do have a specific question, or need help resolving a problem, you can visit our Help Center or contact us to connect with our support team.",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
        
              const SizedBox(
                height: 40,
              ),
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What's your feedback about?",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Please select',
                ),
                items: <String>[
                  'Please select',
                  'Experiences',
                  'Hosting',
                  'Travelling'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // handle onchange event
                },
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your feedback',
                ),
                maxLines: 5,
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF4FBE9F), // Text color
                  elevation: 5, // Elevation
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
              const SizedBox(
                height: 20,
              ),
        
        
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
        
              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Need to get in touch?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
        
              const Text("We'll start with some questions and get you to the right place",
              style: TextStyle(
                fontSize: 16
              ),
              ),
        
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //         pageBuilder: (context, animation1, animation2) => const HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0xFF4FBE9F), // Text color
                        elevation: 5, // Elevation
                      ),
                      child: const Text('Contact us'),
                    ),
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
