import 'package:flutter/material.dart';
import 'package:putko/profile/components/support/share_feedback.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Column(
            children: [
        
              const Row(
                children: [
                  Text("Legal terms",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
        
              const Row(
                children: [
                  Text("Putko Privacy",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
        
              Container(
                width: double.infinity, // full width
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // rounded edge on all corners
                ),
                child: Image.asset(
                  "images/privacy.png",
                  fit: BoxFit.cover, // scale the image to fit the container
                ),
              ),
        
              const SizedBox(
                height: 50,
              ),
        
              const Row(
                children: [
                  Text("Privacy Policy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
        
              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Text("Our Privacy Policy explain what personal information we collect, how we use personal information, how personal information is shared, and privacy rights.",
                style: TextStyle(
                  fontSize: 16
                ),
                ),
              ),
        
        
              const Padding(
                padding: EdgeInsets.only(bottom: 20,top: 20),
                child: Row(
                  children: [
                    Text("Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    ),
                  ],
                ),
              ),
        
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>const PrivacyPolicy()),
                                    );
                                  },
                                  child: const Text('• Privacy Policy', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
              const Text("Please review the supplemental privacy policies linked within the privacy policy documents, such as for certain Airbnb services, that may be applicable to you.",
              style: TextStyle(
                fontSize: 16
              ),
              ),
        
              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Supplemental Privacy Policy Documents",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
              ),
        
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Outside the United States',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• State-specific Supplements',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Cookie Policy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Enterprise Customers and Putko \nfor Work',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Colombia Only',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Turkiye Only',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 10),
                    child: Row(
                      children: [
                        Text('• Non-User DAC7 Privacy Notice',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              
              
              const Row(
                children: [
                  Text("Ralated Articles", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: (){

                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Text("Putko basics", style: TextStyle(color: Colors.grey,fontSize: 14),),
                        ],
                      ),

                      Row(
                        children: [
                          Text("Verifying your identity on Putko", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,decoration: TextDecoration.underline),),
                        ],
                      ),

                      Text("At Putko, trust is the cornerstone of our community - where millions of people across t...")
                    ],
                  ),
                ),
              ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              InkWell(
                onTap: (){

                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Text("Host", style: TextStyle(color: Colors.grey,fontSize: 14),),
                        ],
                      ),

                      Row(
                        children: [
                          Text("Create a Danish unique code", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,decoration: TextDecoration.underline),),
                        ],
                      ),

                      Text("As of October 31, 2023, Danish tax authorities (Skat.dk) have turned off the ability to create a..")
                    ],
                  ),
                ),
              ),


              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),


              InkWell(
                onTap: (){

                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Text("About the updates to our Terms", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,decoration: TextDecoration.underline),),
                        ],
                      ),

                      Text("Please review this information about updates to our Terms.")
                    ],
                  ),
                ),
              ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),


              const SizedBox(
                height: 80,
              ),

              const Row(
                children: [
                  Text("Need to get in touch?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ],
              ),

              const Text("We'll start with some questions and get you to the right place.",),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {

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


              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const ShareFeedback()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Text("You can also give us feedback", style: TextStyle(fontSize: 16),),
                    ],
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
