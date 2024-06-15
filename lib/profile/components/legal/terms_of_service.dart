import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Terms of service"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
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
                  Text("Terms of Service",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
        
              const SizedBox(
                height: 30,
              ),
        
        
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If your country of residence or establishment is within the European Economic Area ("EEA"), Switzerland or the United Kingdom, the Terms of Service for European Users apply to you.',
                  // style: TextStyle(fontSize: 16),
                ),
                // SizedBox(height: 16),
                Text(
                  'If your country of residence or establishment is outside of Australia, the EEA, Switzerland, and the United Kingdom, the Terms of Service for Non-European Users apply to you.',
                  // style: TextStyle(fontSize: 16),
                ),
                // SizedBox(height: 16),
                Text(
                  'If your country of residence or establishment is within Australia, the Terms of Service for Australian Users apply to you.',
                  // style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),

              const SizedBox(
                height: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms of Service Users outside of the EEA, UK, and Australia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Section 22 of these Terms contains an arbitration agreement and class action waiver that apply to all claims brought against Putko in the United States. Please read them carefully.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Last Updated: January 25, 2024',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Thank you for using Putko!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'These Terms of Service ("Terms") are a binding legal agreement between you and Putko that govern the right to use the websites, applications, and other offerings from Putko (collectively, the "Putko Platform"). When used in these Terms, "Putko," "we," "us," or "our" refers to the Putko entity set out on Schedule 1 with whom you are contracting.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'The Airbnb Platform enables users ("Members") to publish, offer, search for, and book services. Members who publish and offer services are "Hosts" and Members who search for, book, or use services are "Guests. Hosts offer accommodations (“Accommodations"), activities, excursions, and events ("Experiences"), and a variety of travel and other services (collectively, “Host Services," and each Host Service offering, a "Listing"). As the provider of the Airbnb Platform, Airbnb does not own, control, offer or manage any Listings or Host Services. Airbnb is not a party to the contracts entered into directly between Hosts and Guests, nor is Airbnb a real estate broker, travel agency, or insurer. Airbnb is not acting as an agent in any capacity for any Member, except as specified in the Payments Terms of Service ("Payment Terms"). To learn more about Airbnb’s role see Section 15."',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                  Text('We maintain other terms and policies that supplement these terms like our Privacy Policy, which describes our collection and use of personal data, and our Payments Terms, which govern any payment services provided to Members by the Putko payment entities (collectively "Putko Payments"',
                      style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 24),

                  Text(
                    'Terms of service for Users outside of the EEA, UK, and Australia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 24),

                  Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 30),
                    child: Text("Guest Terms",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24
                    ),
                    ),
                  ),

                  Text("1. Searching and Booking on Putko",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Text("1.1 Searching.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  ),
                  
                  Text("You can search for Host Services by using criteria like the type of Host Service, type of listing, travel destination, travel dates, and number of guests. You can also use filters to refine your search results. Search results are based on their relevance to your search and other criteria. Relevance considers factors like price, availability, Reviews, customer service and cancellation history, popularity, previous trips and saved Listings, Host requirements (e.g. minimum or maximum nights), and more. Learn more about search results in our Help Center.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 30,
                  ),


                  Text("1.2 Booking.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  
                  Text("When you book a Listing, you are agreeing to pay all charges for your booking including the Listing price, applicable fees like Airbnb’s service fee, offline fees, taxes, and any other items identified during checkout (collectively, “Total Price”). If you choose to pay using a currency that differs from the currency set by the Host for their Listing, the price displayed to you is based on a currency conversion rate determined by us. You are also agreeing that Airbnb via Airbnb Payments may charge the Payment Method (as defined in the Payment Terms) used to book the Listing in order to collect Damage Claim (as defined in Section 14) amounts.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  
                  Text('When you receive the booking confirmation, a contract for Host Services (a "Reservation") is formed directly between you and the Host. By making a Reservation you are agreeing to the terms of the contract. The terms of the contract include these Terms, all terms of the Reservation, including without limitation, the cancellation policy and any other rules, standards, policies, or requirements identified in the Listing or during checkout that apply to the Reservation. It is your responsibility to read and understand these terms of the contract including these Terms and all terms of the Reservation including all rules, standards, policies, and requirements prior to booking a Listing. Be aware that some Hosts work with a co-host or as part of a team to provide their Host Services.',
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text("1.3 Booking.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  Text("An Accommodation Reservation is a limited license to enter, occupy, and use the Accommodation. The Host retains the right to re-enter the Accommodation during your stay, to the extent: (i) it is reasonably necessary, (ii) permitted by your contract with the Host, and (iii) permitted by applicable law. If you stay past checkout, the Host has the right to make you leave in a manner permitted with applicable law, including by imposing reasonable overstay penalties. You may not exceed the maximum number of allowed Guests.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text("1.4 Reservations for Experiences and Other Host Services.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  Text("An Experience or other Host Service Reservation entitles you to participate in, attend, or use that Host Service. You are responsible for confirming that you, and anyone you invite, meet minimum age, proficiency, fitness, or other requirements. You are responsible for informing the Host of any medical or physical conditions, or other circumstances that may impact your ability to participate, attend, or use the Experience or Host Service. Except where expressly authorized, you may not allow any person to join an Experience or Host Service unless they are included as an additional guest during the booking process.",
                  style: TextStyle(
                  fontSize: 16  
                  ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: Text("2.Cancellations,Reservation Issues,Refunds and Booking Modifications.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: Text("2.1 Cancellations,Reservation Issues,and Refunds.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                  
                  Text("In general, if you cancel a Reservation, the amount refunded to you is determined by the Host's cancellation policy that applies to that Reservation. But, in certain situations, other policies take precedence and determine what amount is refunded to you. If something outside your control forces you to cancel a Reservation, you may be eligible for a partial or full refund under our Extenuating Circumstances Policy. If the Host cancels, or you experience a Reservation Issue (as defined in our Rebooking and Refund Policy), you may be eligible for rebooking assistance or a partial or full refund under the Rebooking and Refund Policy. Different policies apply to certain categories of Listings; for example Experiences Reservations are governed by the Experiences Guest Refund Policy. See each Additional Legal Term or Policy for details about what is covered, and what refund applies in each situation.  You may appeal a decision by Airbnb by contacting our customer service.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text("2.2 Booking Modifications.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  
                  Text('Guests and Hosts are responsible for any booking modifications they agree to make via the Airbnb Platform or direct Airbnb customer service to make on their behalf ("Booking Modifications"), and agree to pay any additional amounts, fees, or taxes associated with any Booking Modification.',
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: Text("3. Your Responsibilities and Assumption of Risk.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),


                  Text("3.1 Your Responsibilities.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  Text("You are responsible and liable for your own acts and omissions and are also responsible for the acts and omissions of anyone you invite to join or provide access to any Accommodation, all areas and facilities where the Accommodation is located that the Host and Guest are legally entitled to use in connection with the Accommodation (“Common Areas”), or any Experience or other Host Service. For example, this means: (i) you are responsible for leaving an Accommodation (and related personal property) or Common Areas in the condition it was in when you arrived, (ii) you are responsible for paying all reasonable Damage Claim amounts, and (iii) you must act with integrity, treat others with respect, and comply with applicable laws at all times. If you are booking for an additional guest who is a minor or if you bring a minor to a Host Service, you must be legally authorized to act on behalf of the minor and you are solely responsible for the supervision of that minor.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  Text("3.2 Your Assumption of Risk.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  Text("You acknowledge that many activities carry inherent risks and agree that, to the maximum extent permitted by applicable law, you assume the entire risk arising out of your access to and use of the Airbnb Platform and any Content (as defined in Section 9), including your stay at any Accommodation, participation in any Experience, use of any other Host Service, or any other interaction you have with other Members whether in person or online. This means it is your responsibility to investigate a Host Service to determine whether it is suitable for you. For example, Host Services may carry risk of illness, bodily injury, disability, or death, and you freely and willfully assume those risks by choosing to participate in those Host Services.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Text("Host Terms",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Text("4. Hosting on Putko",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Text("4.1 Host ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  
                  Text("As a Host, Airbnb offers you the right to use the Airbnb Platform in accordance with these Terms to share your Accommodation, Experience, or other Host Service with our vibrant community of Guests - and earn money doing it. It’s easy to create a Listing and you are in control of how you host - set your price, availability, and rules for each Listing.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Text("4.2 Contracting with Guest ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  
                  Text("When you accept a booking request, or receive a booking confirmation through the Airbnb Platform, you are entering into a contract directly with the Guest, and are responsible for delivering the Host Service under the terms and at the price specified in your Listing. You are also agreeing to pay applicable fees like Airbnb’s service fee (and applicable guest taxes) for each booking. Airbnb Payments will deduct amounts you owe from your payout unless we and you agree to a different method. Any terms or conditions that you include in any supplemental contract with Guests must: (i) be consistent with these Terms, our Additional Legal Terms, Policies, and the information provided in your Listing, and (ii) be prominently disclosed in your Listing description.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Text("4.3 Independence of Hosts ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  
                  
                  Text("Your relationship with Airbnb is that of an independent individual or entity and not an employee, agent, joint venturer, or partner of Airbnb, except that Airbnb Payments acts as a payment collection agent as described in the Payments Terms. Airbnb does not direct or control your Host Service, and you understand that you have complete discretion whether and when to provide Host Services, and at what price and on what terms to offer them.",
                  style: TextStyle(
                    fontSize: 16
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
