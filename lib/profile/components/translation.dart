import 'package:flutter/material.dart';

class Translation extends StatefulWidget {
  const Translation({super.key});

  @override
  State<Translation> createState() => _TranslationState();
}

class _TranslationState extends State<Translation> {

  bool _isTranslationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [


            Row(
              children: [
                Text(
                  "Translation",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Text(
              "Automatically translate the reviews, descriptions, and messages written by guests and Hosts to English. Turn this feature off if you'd like to show the original language."
            ,style: TextStyle(
              fontSize: 16
            ),
            ),

      SizedBox(
        height: 50,
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Translation',style: TextStyle(fontSize: 18),),
          Switch(
            value: _isTranslationOn,
            onChanged: (value) {
              setState(() {
                _isTranslationOn = value;
              });
            },
            activeColor: Colors.black,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          ),
        ],
      ),
          ],
        ),
      ),
    );
  }
}
