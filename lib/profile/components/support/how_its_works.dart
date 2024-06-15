import 'package:flutter/material.dart';
import 'package:putko/screens/home_screen.dart';

import '../../../widget/video_player.dart';

class HowItsWorks extends StatefulWidget {
  const HowItsWorks({super.key});

  @override
  State<HowItsWorks> createState() => _HowItsWorksState();
}

class _HowItsWorksState extends State<HowItsWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        margin: const EdgeInsets.only(left: 15,right: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  children: [
                    Image.asset("images/putko_gree_logo.png",width: 40,),
                  ],
                ),
              ),

              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 15,bottom: 30),
                child: Text("You're just 3 steps away from your next getaway",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                ),
              ),


              // VideoPlayerWidget(videoPath: 'assets/videos/video1.mp4'),

              const Padding(
                padding: EdgeInsets.only(top:10,bottom:10),
                child: Row(
                  children: [
                    Text("1.Browse",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              const Text("Start by exploring Stays or Experiences. Apply filters like entire homes, self check-in, or pets allowed to narrow your options. You can also save favorites to a wislist.",
              style: TextStyle(fontSize: 16),),

              // VideoPlayerWidget(videoPath: 'images/how_its_work.mp4'),

              const Padding(
                padding: EdgeInsets.only(top:10,bottom:10),
                child: Row(
                  children: [
                    Text("2.Book",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              const Text("Once you've found what you're looking for, learn about your reviews, and get the details on cancellation options-then book in just a few clicks.",
                style: TextStyle(fontSize: 16),),


              // VideoPlayerWidget(videoPath: 'assets/videos/video1.mp4'),
              //
              const Padding(
                padding: EdgeInsets.only(top:10,bottom:10),
                child: Row(
                  children: [
                    Text("3.Go",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

              const Text("You're all set! Connect with your host through the app for local tips, questions or advice. You can also contact Putko anytime for additional support.",
                style: TextStyle(fontSize: 16),),


              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 40),
                child: Text("Wherever you go, we're her to help",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),),
              ),


              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shield, color: Colors.green, size: 48, ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Health and safety is a', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('priority', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Hosts are committing to \nenhanced COVID-19 cleaning \nprotocols, and listings are \nrated for cleanliness.', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.cancel_outlined, color: Colors.green, size: 48),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('More cancellation options', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Hosts can offer a range of \nflexible cancellation options \nwhich are clearly stated at \nbooking.', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.green, size: 48),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Support anytime, day or \nnight', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text("With 24/7 global customer \nsupport, we're there for you \nwhenever you need \nassistance", style: TextStyle(fontSize: 16, )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 80,
              ),

              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/introduction.jpg',),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 50),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Ready to start\nsearching?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Add your navigation logic here
                          },
                          label: const Text('Explore now'),
                          icon: const Icon(Icons.arrow_forward),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4FBE9F),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 70,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    Text("Still have questions?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                  ],
                ),
              ),

        Column(
          children: [
            FaqItem(
              question: 'Do I need to meet my host?',
              answer:
              'Options like self check-in or booking an entire home allow you to interact with your host mainly through in-app messaging - you can message them anytime if something comes up.',
            ),
            FaqItem(
              question: "What's Putko doing about COVID-19?",
              answer: 'Get the latest info on our COVID-19 response and resources for guests, including policy updates, travel restrictions, flexible travel options, and more', // Replace with actual answer
            ),
            FaqItem(
              question:
              'What if I need to cancel due to a problem with the listing or host?',
              answer: "In most cases, you can resolve any issues directly by messaging your host. If they can't help, simply contact Putko within 24 hours of discovering the issue.", // Replace with actual answer
            ),
            FaqItem(
              question: 'When am I charged for a reservation?',
              answer: 'You will be charged as soon as your reservation is confirmed, but we hold payment to your host until 24 hours after check-in to give you time to ensure everything is as expected.', // Replace with actual answer
            ),
            FaqItem(
              question: 'Help Center',
              answer: "Almost anyone can be a host of a stay or an experience. It's free to sign up and share either your space or your skills with the world. To get started, visit our Host Center.", // Replace with actual answer
            ),
            FaqItem(
                question: "Need more information?",
                answer: "Visit our Help Center to get additional answers to your questions."
            ),
          ],
        ),


              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    // border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => const HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color(0xFF4FBE9F), // Text color
                            elevation: 5, // Elevation
                          ),
                          child: const Text('Start your search'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  FaqItem({super.key, required this.question, required this.answer});

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        title: Text(widget.question),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}