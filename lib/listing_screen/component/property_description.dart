import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/reservation_type.dart';

class PropertyDescription extends StatefulWidget {
  const PropertyDescription({super.key});

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription> {
  final _descriptionController = TextEditingController();

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
            decoration: const BoxDecoration(
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
                  child: const Text('Back', style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FBE9F), // Add background color
                  ),
                  onPressed: () {
                    if (_descriptionController.text.isNotEmpty) {
                      // Navigate to next page if the description is not empty
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReservationType()),
                      );
                    } else {
                      // Show an error message or alert if the description is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a description'),
                        ),
                      );
                    }
                  },
                  child: Text('Next', style: TextStyle(color: Colors.white),),
                )
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
                  const Text("Create your description", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                ],
              ),

              Row(
                children: [
                  const Text("Share what makes your place special.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: SizedBox(
                    child: TextField(
                      maxLines: 7,
                      maxLength: 500,
                      controller: _descriptionController, // Add a controller to the TextField
                      decoration: const InputDecoration(
                        hintText: 'Enter your title here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
