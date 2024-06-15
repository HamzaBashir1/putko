import 'package:flutter/material.dart';

class NeighborhoodSupport extends StatefulWidget {
  const NeighborhoodSupport({super.key});

  @override
  State<NeighborhoodSupport> createState() => _NeighborhoodSupportState();
}

class _NeighborhoodSupportState extends State<NeighborhoodSupport> {

  String _feedbackText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
        
              Row(
                children: [
                  Text("How-to",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  ),
                ],
              ),
        
              Text("Neighborhood Support",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
              ),
        
              Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Text("You can report a party, noise coplaint, or neighborhood concern here.",
                style: TextStyle(
                  fontSize: 17
                ),
                ),
              ),
              SizedBox(height: 5),
              Text("For Help with a reservation, hosting, or your account, contact Putko Support- our Neighborhood Support team is only available to help with concerns related to home sharing in your community.",
              style: TextStyle(
                fontSize: 17
              ),
              ),
              SizedBox(
                height: 40,
              ),
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.orange,
                            size: 30,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                text: TextSpan(
        
                                    children: [
                                      TextSpan(text: "For emergencies:",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: " If you feel unsafe or are concerned about your or someone else's well-being, please contact local emergency services immediately.",style: TextStyle(color: Colors.black))
                                    ]
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        
                ),
              ),
        
        
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Text("Urgent neighborhood situations",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
              ),
              
              Text("Reach out to Neighboorhood Support if there's party or disturbance happening nearby.",style: TextStyle(fontSize: 17),),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // TODO: Handle adding tax info
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Request a call'),
                  ),
                ],
              ),


              SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Text("Other neighborhood concerns",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Text("Send us a message using the button below. Our team will investigate and follow up via email.",style: TextStyle(fontSize: 17),),
              ),

              // SizedBox(
              //   height: 20,
              // ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // TODO: Handle adding tax info
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Report a concern'),
                  ),
                ],
              ),

              SizedBox(height: 25),
              Column(
                children: [
                  _feedbackText.isEmpty
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text('Did this article help?', style: TextStyle(fontSize: 17),),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          setState(() {
                            _feedbackText = 'Thanks for your feedback.';
                          });
                        },
                        child: Text('Yes', style: TextStyle(color: Colors.black),),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: BorderSide.none,
                        ),
                        onPressed: () {
                          setState(() {
                            _feedbackText = 'Thanks for letting us know.';
                          });
                        },
                        child: Text('No', style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  )
                      : Text(_feedbackText),
                ],
              ),


              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              Column(
                children: [

                  Row(
                    children: [
                      Text("Related articles",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),

                  Text("How-to • Guest",style: TextStyle(color: Colors.grey), ),

                  Text("When a neighbor report an issue",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                  Text("Guidance for Hosts for when a neighbor reports an issue.",)

                ],
              ),

              Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),



              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text("Need to get in touch?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),

              Text("We'll start some questions and get you to the right place.",style: TextStyle(fontSize: 17),),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        // TODO: Handle adding tax info
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 32,
                        ),
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      child: Text('Contact us'),
                    ),


                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Text("You can also give us feedback"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
