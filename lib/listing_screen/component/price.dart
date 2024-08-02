import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:putko/listing_screen/component/last_step.dart';

class Price extends StatefulWidget {
  final String postingId;
  const Price({super.key, required this.postingId});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  final TextEditingController _priceController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TimeOfDay _checkInTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _checkOutTime = const TimeOfDay(hour: 0, minute: 0);

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

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
                onPressed: () async {
                  if (_priceController.text.isNotEmpty) {
                    // Update the Firestore document with the price
                    await _firestore.collection('postings').doc(widget.postingId).set({
                      'price': int.parse(_priceController.text),
                      'check_in_time': _checkInTime.format(context), // Save check-in time
                      'check_out_time': _checkOutTime.format(context), // Save check-out time
                      'start_date': _startDate, // Save start date
                      'end_date': _endDate, // Save end date
                    }, SetOptions(merge: true));

                    // Navigate to next page if the price is not empty
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LastStep(postingId: widget.postingId)),
                    );
                  } else {
                    // Show an error message or alert if the price is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a price'),
                      ),
                    );
                  }
                },
                child: const Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Column(
          children: [

            Text("Now, set your price and time and availability", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),


            const Row(
              children: [
                Text("You can change it anytime",style: TextStyle(fontSize: 16,color: Colors.grey),),
              ],
            ),

            const Spacer(),


            Padding(
              padding: const EdgeInsets.only(left: 90,right: 90),
              child: Center(
                child: TextField(
                  controller: _priceController,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
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

            // Check-in time field
            Row(
              children: [
                const Text("Check-in time", style: TextStyle(fontSize: 16),),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    final TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: _checkInTime,
                    );
                    if (newTime!= null) {
                      setState(() {
                        _checkInTime = newTime;
                      });
                    }
                  },
                  child: Text(_checkInTime.format(context)),
                ),
              ],
            ),

            // Check-out time field
            Row(
              children: [
                const Text("Check-out time", style: TextStyle(fontSize: 16),),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    final TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: _checkOutTime,
                    );
                    if (newTime!= null) {
                      setState(() {
                        _checkOutTime = newTime;
                      });
                    }
                  },
                  child: Text(_checkOutTime.format(context)),
                ),
              ],
            ),

            // Availability dates
            Row(
              children: [
                const Text("Availability", style: TextStyle(fontSize: 16),),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    final DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (newDate!= null) {
                      setState(() {
                        _startDate = newDate;
                      });
                    }
                  },
                  child: Text(_startDate.toString().split(' ').first),
                ),
                const Text(" to "),
                TextButton(
                  onPressed: () async {
                    final DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: _endDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (newDate!= null) {
                      setState(() {
                        _endDate = newDate;
                      });
                    }
                  },
                  child: Text(_endDate.toString().split(' ').first),
                ),
              ],
            ),

            const Spacer()


          ],
        ),
      ),
    );
  }
}