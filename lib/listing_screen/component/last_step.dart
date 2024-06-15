import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/thanks.dart';

class LastStep extends StatefulWidget {
  const LastStep({super.key});

  @override
  State<LastStep> createState() => _LastStepState();
}

class _LastStepState extends State<LastStep> {

  bool _securityCameras = false;
  bool _decibelMonitors = false;
  bool _weapons = false;

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
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to previous screen
                },
                child: Text('Back', style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Thanks()),
                  );
                },
                child: Text('Publish Listing', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [


            Row(
              children: [
                Text("Just One last step!", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text("Does your place have any of these?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Column(
              children: [

                CheckboxListTile(
                  title: Text('Exterior security cameras'),
                  value: _securityCameras,
                  onChanged: (bool? value) {
                    setState(() {
                      _securityCameras = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text('Noise decible monitor'),
                  value: _decibelMonitors,
                  onChanged: (bool? value) {
                    setState(() {
                      _decibelMonitors = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text('Weapons'),
                  value: _weapons,
                  onChanged: (bool? value) {
                    setState(() {
                      _weapons = value!;
                    });
                  },
                ),
              ],
            ),

            Divider(
              thickness: 1,
              color: Colors.grey,
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: [
                  Text("Important things to know", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              ),
            ),

            Text("Security cameras that monitor indoor spaces are not allowed even if they're turned off. All exterior security cameras must be disclosed.",
            style: TextStyle(
              fontSize: 16,
            ),
            ),

            SizedBox(
              height: 20,
            ),

            Text("Be sure to comply with your laws and review Putko's anti-discrimination policy and guest and Host fees."
              , style: TextStyle(
                fontSize: 16
              ),
            ),



          ],
        ),
      ),
    );
  }
}
