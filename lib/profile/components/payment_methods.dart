import 'package:flutter/material.dart';
import 'package:putko/widget/common_button.dart';


class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
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

            const Row(
              children: [
                Text("Payments methods",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              ],
            ),

            const Text("Add a payment method using our secure payment system, then start planning your next trips.",
            style: TextStyle(
              fontSize: 17,
            ),
            ),


            const SizedBox(
              height: 20,
            ),

            CommonButton(
              onTap: (){},
              buttonText: "Add payment method",
            ),

            const SizedBox(
              height: 20,
            ),

            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      const Row(
                        children: [
                          Icon(
                            Icons.payment,
                            size: 80,
                            color: Color(0xFF4FBE9F),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Make all payments through Putko',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Always pay and communicate through Airbnb to ensure you\'re protected under our Terms of Service, Payments Terms of Service, cancellation, and other safeguards.',

                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Learn More'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
