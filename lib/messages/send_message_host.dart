import 'package:flutter/material.dart';
import 'package:putko/messages/message_home.dart';
import 'package:putko/widget/common_button.dart';

class SendMessageHost extends StatefulWidget {
  const SendMessageHost({super.key});

  @override
  State<SendMessageHost> createState() => _SendMessageHostState();
}

class _SendMessageHostState extends State<SendMessageHost> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Experience in Buda",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tiny home",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Image.asset(
                      "images/bed.jpg",
                      width: 100,
                      height: 100,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Dates",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Sep 8 - 13",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Guests",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "1 guest",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Message the Host",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Hi {Host}! I'll be visiting...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                    maxLines: 3,
                  ),
                )
              ],
            ),
            Spacer(),
            Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),
            CommonButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessageHome()),
                  );
                }
              },
              buttonText: "Send Message",
            )
          ],
        ),
      ),
    );
  }
}