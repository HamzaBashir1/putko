import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:putko/authentication/signup_screen.dart';

import '../widget/common_button.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   Timer(const Duration(seconds: 2),(){
  //     Get.to(LoginScreen());
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset("images/introduction.jpg", fit: BoxFit.cover),
              ),
              Column(
                children: <Widget>[
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).dividerColor,
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Image.asset("images/appIcon.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Putko",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 420),
                    child: Text(
                      "Welcome To Putko, Apartment & Flats Booking App",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: SizedBox(),
                  ),
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 680),
                    child: CommonButton(
                      padding: const EdgeInsets.only(
                          left: 48, right: 48, bottom: 8, top: 8),
                      buttonText: "Get Started",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                            builder: (e)=> const SignupScreen(),
                            ),
                        );
                      },
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


