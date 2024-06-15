import 'package:flutter/material.dart';

class LoginSecurity extends StatefulWidget {
  const LoginSecurity({super.key});

  @override
  State<LoginSecurity> createState() => _LoginSecurityState();
}

class _LoginSecurityState extends State<LoginSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove the elevation to make the app bar flat
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Login & security",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(), // Add a Spacer to push the icon to the right
                    Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue[100],
                                ),
                                child: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.blue,
                                  size: 24.0,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              const Expanded(
                                child: Text(
                                  'Set up 2-step authentication',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'You\'ll need this to access important parts of your account.',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Learn more',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  side: const BorderSide(color: Colors.black),
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Set up now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 30),
                child: Row(
                  children: [
                    Text("Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Last updated a year ago',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                      const SizedBox(height: 16.0),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),


              const Divider(
                thickness: 1,
                color: Colors.grey,
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Device history",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.computer, size: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Session'),
                    Text('March 14, 2024 at 20:28'),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
              child: const Text('Log out device'),
            ),
          ],
        ),

              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: Image.asset("images/putko_gree_logo.png",width: 50,height: 50,),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        'Let\'s make your account more secure',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                       Text(
                        'Your account security: Medium',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "We're always working on ways to increase safety in our community. That's why we look at every account to make sure it's as secure as possible.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/security_improvement');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4FBE9F),
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text('Improve'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),

              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text("Deactivate your account"),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.teal,
                        ),
                        child: const Text('Deactivate'),
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
