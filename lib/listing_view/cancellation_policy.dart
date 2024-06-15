import 'package:flutter/material.dart';

class CancellationPolicy extends StatefulWidget {
  const CancellationPolicy({super.key});

  @override
  State<CancellationPolicy> createState() => _CancellationPolicyState();
}

class _CancellationPolicyState extends State<CancellationPolicy> {
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
          child: const Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Cancellation policy", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Make sure you're comfortable with this Host's policy. In rare cases, you may be eligible for a refund outside of this policy under Putko's Major Disruptive Ecvent Policy.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Before", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Aug 16", style: TextStyle(fontSize: 16),),
                      SizedBox(
                        height: 5,
                      ),
                      Text("3:00 PM", style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Full refund", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Get back 100% of what you paid.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Before", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Jun 16", style: TextStyle(fontSize: 16),),
                      SizedBox(
                        height: 5,
                      ),
                      Text("3:00 PM", style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Partial refund", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Get back 50% of every night but the first one. No refund of the first night or the service fee.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Cleaning fees are refunded if you cancel before check-in.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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