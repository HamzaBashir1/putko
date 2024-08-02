import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:putko/authentication/forgot_password_screen.dart';
import 'package:putko/authentication/signup_screen.dart';
import 'package:putko/screens/home_screen.dart';
import 'package:putko/widget/guest_home_screen.dart';
import 'package:putko/widget/common_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../shared/theme/colors.dart';
import '../widget/custom_scaffold.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,

                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },

                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CommonButton(
                          buttonText: "Login",
                          onTap: () async {
                            try {
                               await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: emailController.text,
                               password: passwordController.text
                               );
                              Fluttertoast.showToast(msg: "Login Successfully",
                                   backgroundColor: appGreen);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const GuestHomeScreen(),
                                ),
                              );
                            } catch (error) {
                              Fluttertoast.showToast(msg: error.toString(),
                                  backgroundColor: Colors.red);
                            }

                            if (_formSignInKey.currentState!.validate() &&
                                rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }


                          },

                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              // try {
                              //   final LoginResult result = await FacebookAuth.instance.login();
                              //   if (result.accessToken!= null) {
                              //     final String token = result.accessToken.toString();
                              //     final AuthCredential credential = FacebookAuthProvider.credential(token);
                              //
                              //     try {
                              //       final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
                              //       final User user = userCredential.user!;
                              //       Fluttertoast.showToast(msg: 'Signed in with Facebook: ${user.uid}');
                              //     } catch (e) {
                              //       Fluttertoast.showToast(msg: 'Error signing in with Facebook: $e');
                              //     }
                              //   } else {
                              //     Fluttertoast.showToast(msg: 'Failed to login with Facebook');
                              //   }
                              // } catch (e) {
                              //   Fluttertoast.showToast(msg: 'Error signing in with Facebook: $e');
                              // }
                            },
                            child: Brand(Brands.facebook),
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                // Create a GoogleAuthProvider instance
                                GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

                                // Initialize the Google sign-in process
                                final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

                                // Get the authentication token from the Google sign-in process
                                final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                                // Create a credential from the authentication token
                                final credential = GoogleAuthProvider.credential(
                                  idToken: googleAuth?.idToken,
                                  accessToken: googleAuth?.accessToken,
                                );

                                // Sign in to Firebase with the credential
                                await FirebaseAuth.instance.signInWithCredential(credential);

                                // Get the current user
                                final user = FirebaseAuth.instance.currentUser;

                                // Create a Firestore document for the user
                                final userData = {
                                  'username': googleUser?.displayName,
                                  'email': googleUser?.email,
                                };

                                await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(userData);


                                // Show a success toast message
                                Fluttertoast.showToast(
                                  msg: "Login Successfully",
                                  backgroundColor: appGreen,
                                );

                                // Navigate to the home screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => const GuestHomeScreen(),
                                  ),
                                );
                              } catch (error) {
                                // Show an error toast message
                                Fluttertoast.showToast(
                                  msg: error.toString(),
                                  backgroundColor: Colors.red,
                                );
                              }
                            },
                            child: Brand(Brands.google),
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                // Request Apple Sign-In
                                final appleCredential = await SignInWithApple.getAppleIDCredential(
                                  scopes: [
                                    AppleIDAuthorizationScopes.email,
                                    AppleIDAuthorizationScopes.fullName,
                                  ],
                                  webAuthenticationOptions: WebAuthenticationOptions(
                                    redirectUri: Uri.parse('https://YOUR_DOMAIN.com/callbacks'),
                                    clientId: 'YOUR_SERVICE_ID', // Replace with your Apple Service ID
                                  ),
                                );

                                // Get the OAuth credential
                                final oauthCredential = OAuthProvider('apple.com').credential(
                                  idToken: appleCredential.identityToken,
                                );

                                // Sign in to Firebase with the OAuth credential
                                final userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);

                                // Get the current user
                                final user = userCredential.user;

                                // Create a Firestore document for the user
                                final userData = {
                                  'username': '${appleCredential.givenName} ${appleCredential.familyName}',
                                  'email': appleCredential.email,
                                };

                                await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(userData);


                                if (user!= null) {
                                  // Show a success message
                                  Fluttertoast.showToast(msg: 'Signed in with Apple ID: ${user.uid}');
                                } else {
                                  // Handle the case where the user is null
                                  Fluttertoast.showToast(msg: 'Error signing in with Apple ID: User is null');
                                }
                              } catch (error) {
                                // Show an error message
                                Fluttertoast.showToast(msg: 'Error signing in with Apple ID: $error');
                              }
                            },
                            child: Brand(Brands.apple_logo),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignupScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}