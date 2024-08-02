import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:putko/widget/custom_scaffold.dart';

import '../widget/common_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final emailController = TextEditingController();


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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Fogot Password',
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
        height: 20.0,
      ),
    CommonButton(

    buttonText: "send",
    onTap: () async {

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      Fluttertoast.showToast(
          msg:
          "we have sent you email to recover password, please check email");
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  },
  ),
  ],
  ),
  ),
    ),

    ),
        ],
      ),
    );
 }

}
