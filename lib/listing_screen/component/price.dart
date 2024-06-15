import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:putko/listing_screen/component/last_step.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {

  final TextEditingController _priceController = TextEditingController();

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
                onPressed: () {
                  if (_priceController.text.isNotEmpty) {
                    // Navigate to next page if the description is not empty
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LastStep()),
                    );
                  } else {
                    // Show an error message or alert if the description is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a title'),
                      ),
                    );
                  }
                },
                child: Text('Next', style: TextStyle(color: Colors.white),),
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
                Text("Now, set your price", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              ],
            ),
            
            
            Row(
              children: [
                Text("You can change it anytime",style: TextStyle(fontSize: 16,color: Colors.grey),),
              ],
            ),

            Spacer(),


            Padding(
              padding: const EdgeInsets.only(left: 90,right: 90),
              child: Center(
                child: TextField(
                  controller: _priceController,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove underline
                    prefixText: '€', // Add fixed euro sign
                    prefixStyle: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Add this line to change the prefix text color
                    ),
                    hintText: '0',
                    hintStyle: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey, // Add this line to change the hint text color
                    ),
                  ),
                  keyboardType: TextInputType.number, // Show number keyboard
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Allow only digits
                ),
              ),
            ),

            Spacer()

            
          ],
        ),
      ),
    );
  }
}
