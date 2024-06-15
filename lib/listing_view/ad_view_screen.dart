import 'package:flutter/material.dart';
import 'package:putko/messages/send_message_host.dart';
import 'package:putko/listing_view/availability.dart';
import 'package:putko/listing_view/cancellation_policy.dart';
import 'package:putko/listing_view/confirm_and_pay.dart';
import 'package:putko/listing_view/show_amenities.dart';
import 'package:putko/widget/common_button.dart';

class AdViewScreen extends StatefulWidget {
  const AdViewScreen({super.key});

  @override
  State<AdViewScreen> createState() => _AdViewScreenState();
}

class _AdViewScreenState extends State<AdViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  '£109 night',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Sep 8 - 13',
                  style: TextStyle(fontSize: 16,decoration: TextDecoration.underline),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfirmAndPay()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FBE9F),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              child: const Text('Reserve',style: TextStyle(color: Colors.white,fontSize: 14),),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
        
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              //get data from photos screen
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28, // Set the height to 28% of the screen height
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.asset(
                    "images/bed.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        
              const SizedBox(
                height: 20,
              ),
        
              //get data from property_title screen
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("(Property Title) Beautiful House Great Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.05, // Set font size based on screen width
                    ),
                  ),
                ],
              ),
        
              const SizedBox(
                height: 20,
              ),
        
        
              //get data from place type and place_location screen
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("(Place type)+(Property type) in (town),(Country)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.035, // Set font size based on screen width
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        
              const SizedBox(
                height: 5,
              ),
        
              //get data from basic_your_place screen
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "2 guest • 1 bedroom • 1 bed • 1 bathroom",
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04, // Set font size based on screen width
                            ),
                            textAlign: TextAlign.center, // Center the text
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
        
              const SizedBox(
                height: 20,
              ),
        
        
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  '5.0',
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
        
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 12), // Use a fixed size for the Icon
                                Icon(Icons.star, color: Colors.amber, size: 12),
                                Icon(Icons.star, color: Colors.amber, size: 12),
                                Icon(Icons.star, color: Colors.amber, size: 12),
                                Icon(Icons.star, color: Colors.amber, size: 12),
                              ],
                            )
                          ],
                        ),
                      ),
        
                      Row(
        
                        children: <Widget>[
                          Image.asset("images/guest_favorite.jpeg", width: 120,)
                        ],
                      ),
                      const SizedBox(width: 28), // Use a fixed width for the SizedBox
                      Row(
                        children: [
                          Text(
                            '49\nReviews',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        
        
              const SizedBox(
                height: 5,
              ),
        
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0), // add some padding around the image
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15, // take 25% of the screen width
                      height: MediaQuery.of(context).size.width * 0.15, // take 25% of the screen width
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle, // make the container a circle
                        image: DecorationImage(
                          image: AssetImage('images/person.jpg'),
                          fit: BoxFit.cover, // scale the image to fit the container
                        ),
                      ),
                    ),
                  ),
                  const Expanded( // take the remaining space
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hosted by Ahmed',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Superhost',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              ' · ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '1 year hosting',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
        
              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              const SizedBox(
                height: 15,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      Icons.desk_outlined,
                    ),
                  ),
                  SizedBox(width: 16), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dedicated workspace',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'A common area with wifi that\'s well-suited for working.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      Icons.door_front_door_outlined,
                    ),
                  ),
                  SizedBox(width: 16), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Self check-in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Check yourself in with the lockbox.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(
                height: 15,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  SizedBox(width: 16), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Free Cancellation {specific date}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Get a full refund if you change your mind.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(
                height: 15,
              ),

              const Divider(
                height: 20,
              ),
              
              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Column(
                  children: [

                    Text("A website (also written as a web site) is a collection of web pages and related content that is identified by a common domain name and published on at least one web server. Websites are typically dedicated to a particular topic or purpose, such as news, education, commerce, entertainment, or social media.",
                    style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20),
                child: Row(
                  children: [

                    Text("What this place offers", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                  ],
                ),
              ),

              const Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(
                height: 20,
              ),
              
              CommonButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShowAmenities()),
                  );
                },
                buttonText: "Show all {number} amenities",
              ),
              
              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              const SizedBox(
                height: 20,
              ),
              
              const Column(
                children: [
                  Row(
                    children: [
                      Text("Where you'll be", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  )
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Complete address of property",style: TextStyle(fontSize: 18),),
                      ],
                    )
                  ],
                ),
              ),

              Image.asset("images/map.jpeg"),

              const SizedBox(
                height: 20,
              ),

              Container(
                color: const Color(0xFFfaf7f0),
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4.98',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Guest favorite',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'This home is in the top 10% of eligible listings based on ratings, reviews, and reliability',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),


                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300, // provide a fixed height
                    child: PageView.builder(
                      itemCount: 2, // number of ReviewCard widgets
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return ReviewCard(
                            rating: 5,
                            date: '1 week ago',
                            review: 'I recommend 100%, beautiful accommodation in beautiful surroundings',
                            author: 'Melisa',
                            yearsOnAirbnb: 3,
                          );
                        } else {
                          return ReviewCard(
                            rating: 5,
                            date: '',
                            review: 'Everyth\nCommu\nThanks',
                            author: '',
                            yearsOnAirbnb: null,
                          );
                        }
                      },
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFfaf7f0), // set the background color
                    ),
                  ),
                  const SizedBox(height: 40), // add space at the bottom
                ],
              ),


              const Column(
                children: [

                  Row(
                    children: [
                      Text("Meet your Host", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                    ],
                  )

                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 10, // add shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // add border radius
                ),
                color: Colors.white, // set background color to white
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20), // add padding top and bottom
                  child: Row(
                    children: [
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100, // adjust the width to your liking
                            height: 100, // adjust the height to your liking
                            child: ClipOval(
                              child: Image.asset('images/person.png'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Martin',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 5),
                              Text(
                                'Superhost',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Spacer(),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '63',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Reviews',
                            style: TextStyle(fontSize: 16),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.98',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 24),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                            height: 20,
                          ),
                          Text(
                            '11',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Months hosting',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer()

                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.language, ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Speaks English'),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.location_on, ),
                        ],
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'StromDom Two Duby is a two-story, independent work in perfect symbiosis with the surrounding nature.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),


                  SizedBox(height: 32.0),
                  Text(
                    'In today\'s bustling modern world, nature may seem out of our reach.',
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    'We invite you to leave everything behind for a moment and connect your feelings with the true wilderness.',
                  ),
                ],
              ),

              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Text("Great Escape is a superhost",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  Text("Superhosts are experienced, highly rated hosts who are commited to providing great stays for guests."),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              CommonButton(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ManageHost()),
                  );
                },
                buttonText: "Manage Host",
              ),
              
              const Padding(
                padding: EdgeInsets.only(top: 10,bottom: 20),
                child: Row(
                  children: [


                    Column(
                      children: [
                        Icon(Icons.payments),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Text("To protect your payment, never transfer money \nor communicate outside of the Putko website or \napp", style: TextStyle(color: Colors.grey,fontSize: 12),),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              const Divider(height: 20,thickness: 1,color: Colors.grey,),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Availability()),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Availability',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Sep 8 - 13',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CancellationPolicy()),
              );
            },
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cancellation policy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Free cancellation before Aug 9.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  'Review the Host\'s full cancellation policy which applies even if you cancel for illness or disruptions caused by COVID-19.',
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),
          ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Availabil()),
                  // );
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'House rules',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Check-in after 2:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Checkout before 10:00 AM",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "4 guests maximum",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Availabil()),
                  // );
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Safety & property',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Carbon monoxide alarm not reported',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Smoke alarm not reported",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Pet(s) live on property",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



class ReviewCard extends StatelessWidget {
  final int rating;
  final String date;
  final String review;
  final String author;
  final int? yearsOnAirbnb;

  const ReviewCard({
    super.key,
    required this.rating,
    required this.date,
    required this.review,
    required this.author,
    required this.yearsOnAirbnb,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20), // add margin left and right
            width: 300,
            padding: const EdgeInsets.all(20), // add padding top, right, bottom, left
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  review,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Text(
                          author.isNotEmpty? author[0].toUpperCase() : '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (yearsOnAirbnb!= null)
                          Text(
                            '$yearsOnAirbnb years on Airbnb',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // add space between card and button
          ElevatedButton(
            onPressed: () {}, // add your onPressed function here
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFfaf7f0),
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0), // add padding left and right
              child: Text(
                'Show all 63 reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class ManageHost extends StatefulWidget {
  const ManageHost({super.key});

  @override
  State<ManageHost> createState() => _ManageHostState();
}

class _ManageHostState extends State<ManageHost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Still have a questions?', style: TextStyle(color: Colors.black,),),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SendMessageHost()),
                  );
                },
                child: const Text('Message Host', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          child: const Column(
            children: [
        
              Row(
        
                children: <Widget>[
        
                  Column(
                    children: [
                      Text(
                        'Contact Great Escape',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        
                      Text(
                        'Typically responds within an hour',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
        
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0, // adjust the radius to your liking
                        backgroundImage: AssetImage('images/person.png'),
                      ),
                    ],
                  )
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
        
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Most travelers ask about",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
        
        
              Row(
                children: [
                  Text("Getting there", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ],
              ),
        
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • Free Parking on the premises.", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • Check-in time for this home starts at 3:00 PM and checkout is at 11:00 AM", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                ],
              ),
        
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("House details and rules", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),
        
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(" • No smoking. No parties or events. No pets", style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                ],
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("Price and availability",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),
              
              Row(
                children: [
                  Expanded(child: Text("Get a 10% discount on stays longer than a week, or 20% on stays longer than a month.", style: TextStyle(fontSize: 16),)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              
              Row(
                children: [
                  Expanded(child: Text("Cancel up to 5 days before check-in and get a full refund. After that, cancel before check-in and get a 50% refund, minus the first night and service fees", style: TextStyle(fontSize: 16),)),
                ],
              ),
        
              SizedBox(height: 20),
        
              Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),
        
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  children: [
                    Text("This home is available Sep 8 - 13.", style: TextStyle(fontSize: 16),),
                  ],
                ),
              )
        
        
            ],
          ),
        ),
      ),
    );
  }
}
