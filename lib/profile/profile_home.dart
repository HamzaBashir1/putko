import 'package:flutter/material.dart';
import 'package:putko/authentication/login_screen.dart';
import 'package:putko/profile/components/accessibility.dart';
import 'package:putko/profile/components/legal/open_source_license.dart';
import 'package:putko/profile/components/legal/privacy_policy.dart';
import 'package:putko/profile/components/legal/terms_of_service.dart';
import 'package:putko/profile/components/login_security.dart';
import 'package:putko/profile/components/personal_information/personal_information.dart';
import 'package:putko/profile/components/privacy_sharing.dart';
import 'package:putko/profile/components/show_profile.dart';
import 'package:putko/profile/components/support/faq.dart';
import 'package:putko/profile/components/support/share_feedback.dart';
import 'package:putko/profile/components/support/how_its_works.dart';
import 'package:putko/profile/components/taxes.dart';
import 'package:putko/profile/components/translation.dart';
import 'package:putko/profile/components/travel_for_work.dart';
import 'package:putko/profile/notification_screen.dart';
import 'package:putko/widget/app_nav_bar.dart';
import 'package:putko/widget/sticky_button.dart';
import 'components/payment_payouts.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        bottomNavigationBar: const Stack(
          children: [
            AppNavBar(), // This will be the main bottom navigation bar
            Positioned(
              right: 16,
              left: 16,
              top: 20,
              child: StickyButton(), // This will be the sticky button
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 70,bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                        Navigator.push(
                         context,
                       MaterialPageRoute(
                        builder: (e) => const NotificationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),


                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.grey),
                      // borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hamza Bashir",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "show Profile",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24, top: 16, bottom: 16, left: 24),
                          child: Container(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                              child: Image.asset("images/person.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShowProfile()),
                    );
                  },
                ),


                 const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 20,
                ),

                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Putko your place",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "It's simple to get set up \nand start earning.",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24, top: 16, bottom: 16, left: 24),
                        child: Container(
                          width: 70,
                          height: 70,
                          // child: ClipRRect(
                          // borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                          child: Image.asset("images/p.png"),
                          // ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Row(
                    children: [
                      Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PersonalInformation()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width: 25,
                          height: 25,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                            child: Image.asset("images/person.png"),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 108, // <-- Spacing between children
                          children: <Widget>[
                            Text(
                              "Personal information",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            // Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginSecurity()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width: 25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.security),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 140, // <-- Spacing between children
                        children: <Widget>[
                          Text("Login & security",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      )
                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentPayouts()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.payments),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 95, // <-- Spacing between children
                        children: <Widget>[
                          Text("Payments and payouts",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Accessibility()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.settings_applications_sharp),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 165,
                        children: <Widget>[
                          Text("Accessibility",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Taxes()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.file_copy),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 212,
                        children: <Widget>[
                          Text("Taxes",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Translation()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.translate),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 188,
                        children: <Widget>[
                          Text("Translate",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                      child: Container(
                        width:25,
                        height: 25,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          child: Icon(Icons.notifications),
                        ),
                      ),
                    ),
                    const Wrap(
                      direction: Axis.horizontal,
                      spacing: 162,
                      children: <Widget>[
                        Text("Notifications",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        // Icon(Icons.keyboard_arrow_right),
                      ],
                    ),


                  ],
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrivacySharing()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.privacy_tip),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 115,
                        children: <Widget>[
                          Text("Privacy and sharing",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                // const Divider(
                //   thickness: 2,
                //   height: 20,
                //   color: Colors.grey,
                // ),

                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const TravelForWork()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //         child: Container(
                //           width:25,
                //           height: 25,
                //           child: const ClipRRect(
                //             borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //             child: Icon(Icons.work),
                //           ),
                //         ),
                //       ),
                //       const Wrap(
                //         direction: Axis.horizontal,
                //         spacing: 148,
                //         children: <Widget>[
                //           Text("Travel for work",
                //             style: TextStyle(
                //               fontSize: 15,
                //             ),
                //           ),
                //           // Icon(Icons.keyboard_arrow_right),
                //         ],
                //       ),
                //
                //
                //     ],
                //   ),
                // ),

                // const Divider(
                //   thickness: 2,
                //   height: 20,
                //   color: Colors.grey,
                // ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 15,bottom: 15),
                //   child: Row(
                //     children: [
                //       Text("Referrals & Credits", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                //     ],
                //   ),
                // ),
                //
                //
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //       child: Container(
                //         width:25,
                //         height: 25,
                //         child: const ClipRRect(
                //           borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //           child: Icon(Icons.card_giftcard),
                //         ),
                //       ),
                //     ),
                //     const Wrap(
                //       direction: Axis.horizontal,
                //       spacing: 180,
                //       children: <Widget>[
                //         Text("Gift Cards",
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         ),
                //         // Icon(Icons.keyboard_arrow_right),
                //       ],
                //     ),
                //
                //
                //   ],
                // ),
                //
                // const Divider(
                //   thickness: 2,
                //   height: 20,
                //   color: Colors.grey,
                // ),
                //
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //       child: Container(
                //         width:25,
                //         height: 25,
                //         child: const ClipRRect(
                //           borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //           child: Icon(Icons.gif_box_outlined),
                //         ),
                //       ),
                //     ),
                //     const Wrap(
                //       direction: Axis.horizontal,
                //       spacing: 165,
                //       children: <Widget>[
                //         Text("Refer a Host",
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         ),
                //         // Icon(Icons.keyboard_arrow_right),
                //       ],
                //     ),
                //
                //
                //   ],
                // ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Row(
                    children: [
                      Text("Support", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                    ],
                  ),
                ),

                // InkWell(
                //   onTap: (){
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => VisitTheHelpCenter()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //         child: Container(
                //           width:25,
                //           height: 25,
                //           child: const ClipRRect(
                //             borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //             child: Icon(Icons.question_mark),
                //           ),
                //         ),
                //       ),
                //       const Wrap(
                //         direction: Axis.horizontal,
                //         spacing: 110,
                //         children: <Widget>[
                //           Text("Visit the Help Center",
                //             style: TextStyle(
                //               fontSize: 15,
                //             ),
                //           ),
                //           // Icon(Icons.keyboard_arrow_right),
                //         ],
                //       ),
                //
                //
                //     ],
                //   ),
                // ),

                // const Divider(
                //   thickness: 2,
                //   height: 20,
                //   color: Colors.grey,
                // ),

                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //       child: Container(
                //         width:25,
                //         height: 25,
                //         child: const ClipRRect(
                //           borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //           child: Icon(Icons.safety_check),
                //         ),
                //       ),
                //     ),
                //     const Wrap(
                //       direction: Axis.horizontal,
                //       spacing: 63,
                //       children: <Widget>[
                //         Text("Get help with a safety issue",
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         ),
                //         // Icon(Icons.keyboard_arrow_right),
                //       ],
                //     ),
                //
                //
                //   ],
                // ),
                //
                // const Divider(
                //   thickness: 2,
                //   height: 20,
                //   color: Colors.grey,
                // ),

                // InkWell(
                //   onTap: (){
                //     Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) =>const  NeighborhoodSupport()),
                //     );
                //   },
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                //         child: Container(
                //           width:25,
                //           height: 25,
                //           child: const ClipRRect(
                //             borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //             child: Icon(Icons.headset_mic_sharp),
                //           ),
                //         ),
                //       ),
                //       const Wrap(
                //         direction: Axis.horizontal,
                //         spacing: 38,
                //         children: <Widget>[
                //           Text("Report a neighborhood concern",
                //             style: TextStyle(
                //               fontSize: 15,
                //             ),
                //           ),
                //           // Icon(Icons.keyboard_arrow_right),
                //         ],
                //       ),
                //
                //
                //     ],
                //   ),
                // ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const  Faq()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.chrome_reader_mode_outlined),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 135,
                        children: <Widget>[
                          Text("FAQ Question",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const  HowItsWorks()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.abc_outlined),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 135,
                        children: <Widget>[
                          Text("How Putko works",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const ShareFeedback()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.feedback),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 135,
                        children: <Widget>[
                          Text("Give us Feedback",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Row(
                    children: [
                      Text("Legal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                    ],
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const TermsOfService()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.chrome_reader_mode_outlined),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 140,
                        children: <Widget>[
                          Text("Terms of Service",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const PrivacyPolicy()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.chrome_reader_mode_outlined),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 160,
                        children: <Widget>[
                          Text("Privacy Policy",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const OpenSourceLicense()),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16, ),
                        child: Container(
                          width:25,
                          height: 25,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            child: Icon(Icons.chrome_reader_mode_outlined),
                          ),
                        ),
                      ),
                      const Wrap(
                        direction: Axis.horizontal,
                        spacing: 110,
                        children: <Widget>[
                          Text("Open source licenses",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          // Icon(Icons.keyboard_arrow_right),
                        ],
                      ),


                    ],
                  ),
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Code to be executed when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (e) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),

                    ),
                  ],
                ),

                const Divider(
                  thickness: 2,
                  height: 20,
                  color: Colors.grey,
                ),

                const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        "Version 1.0",style: TextStyle(
                          fontSize: 15
                      ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
