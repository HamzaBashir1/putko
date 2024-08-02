import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:putko/listing_view/availability.dart';
import 'package:putko/messages/chat_page.dart';
import 'package:putko/widget/common_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pay/pay.dart';
import '../payment_gateway/payment_config.dart';



class ConfirmAndPay extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const ConfirmAndPay({super.key, required this.documentSnapshot});

  @override
  State<ConfirmAndPay> createState() => _ConfirmAndPayState();
}
class _ConfirmAndPayState extends State<ConfirmAndPay> {

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  int index = 0;
  String _groupValue = 'now';
  late double _amount;
  late double _result;
  late double _total;
  final int _nights = 5;

  @override
  void initState() {
    super.initState();
    _amount = widget.documentSnapshot['price'] != null ? widget.documentSnapshot['price'].toDouble() : 0.0;
    _result = _amount * _nights;
    _total = _result + 55.19 + 6.74;
    _retrieveSelectedDaysLocally();
  }

  void _calculateResult() {
    setState(() {
      _result = _amount * _nights;
      _total = _result + 55.19 + 6.74;
    });
  }

  List<DateTime> _selectedDays = [];

  Future<void> _retrieveSelectedDaysLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedDaysJson = prefs.getStringList('selected_days');
    if (selectedDaysJson!= null) {
      setState(() {
        _selectedDays = selectedDaysJson.map((json) => DateTime.parse(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.documentSnapshot == null) {
      return const Center(child: Text('No document snapshot available'));
    }

    final snap = widget.documentSnapshot;
    _calculateResult();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Confirm and pay"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            children: [



              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(widget.documentSnapshot['photos'][index], width: 120, fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // add some space between the image and the text
                  Expanded(
                    flex: 2, // make the text column take up more space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.documentSnapshot['title']}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text("${widget.documentSnapshot['placeType']} in ${widget.documentSnapshot['propertyType']}", style: const TextStyle(fontSize: 14)),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.black, size: 14),
                            SizedBox(width: 4),
                            Text('4.89 ', style: TextStyle(fontSize: 14)),
                            SizedBox(width: 10),
                            Icon(Icons.verified_user, color: Colors.black, size: 14),
                            SizedBox(width: 4),
                            Text('Superhost', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // const SizedBox(
              //   height: 15,
              // ),
              //
              // const Divider(
              //   thickness: 1,
              //   color: Colors.grey,
              //   height: 20,
              // ),
              const SizedBox(
                height: 15,
              ),

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween, // add this
              //   children: [
              //     Expanded( // wrap with Expanded
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start, // add this
              //         children: [
              //           Text("Free cancellation before Aug 8.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              //           Text("Get a full refund if you change your mind.", style: TextStyle(fontSize: 16),)
              //         ],
              //       ),
              //     ),
              //     Padding( // add some padding around the icon
              //       padding: EdgeInsets.only(left: 16),
              //       child: Icon(Icons.calendar_month, size: 24), // adjust icon size
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Your trip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    children: [
                      Text("Dates",style: TextStyle(fontSize: 20),),

                      Text("",style: TextStyle(fontSize: 16),)
                    ],
                  ),

                  GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Availability(documentSnapshot: snap)),
                        );
                      },
                      child: const Text("Edit",style: TextStyle(fontSize: 18,decoration: TextDecoration.underline))
                  ),

                ],
              ),


              const SizedBox(
                height: 20,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      const Text("Guests",style: TextStyle(fontSize: 20),),

                      Text("${widget.documentSnapshot['guests']} guest",style: const TextStyle(fontSize: 16),)
                    ],
                  ),

                  GestureDetector(
                      onTap: (){

                      },
                      child: const Text("Edit",style: TextStyle(fontSize: 18,decoration: TextDecoration.underline),))

                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Choose how to pay", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                ],
              ),

              const SizedBox(
                height: 20,
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile(
                    title: Text('Pay €${widget.documentSnapshot['price']} now'),
                    value: 'now',
                    groupValue: _groupValue,
                    onChanged: (value) {
                      setState(() {
                        _groupValue = value!;
                      });
                    },
                  ),
                  // RadioListTile(
                  //   title: const Text('Pay part now, part later'),
                  //   subtitle: const Text(
                  //       '£202.23 due today, £202.22 on Jul 31, 2024. No extra fees. More info'),
                  //   value: 'part',
                  //   groupValue: _groupValue,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _groupValue = value!;
                  //     });
                  //   },
                  // ),
                  // RadioListTile(
                  //   title: const Text('Pay in 3 payments with Klarna'),
                  //   subtitle: const Text(
                  //       '3 payments of £134.81 each (0% APR)!. More info'),
                  //   value: 'klarna',
                  //   groupValue: _groupValue,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _groupValue = value!;
                  //     });
                  //   },
                  // ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Price details", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      Text("€${_amount.toStringAsFixed(2)} * $_nights nights", style: const TextStyle(fontSize: 16),)
                    ],
                  ),

                  Column(
                    children: [
                      Text("€${_result.toStringAsFixed(2)}")
                    ],
                  )

                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      Text("Cleaning fee", style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  Column(
                    children: [
                      Text("€6.74")
                    ],
                  )

                ],
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      Text("Putko service fee", style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  Column(
                    children: [
                      Text("€55.19")
                    ],
                  )

                ],
              ),

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //
              //     Column(
              //       children: [
              //         Text("Taxes", style: TextStyle(fontSize: 16),),
              //       ],
              //     ),
              //
              //     Column(
              //       children: [
              //         Text("€47.87")
              //       ],
              //     ),
              //
              //   ],
              // ),

              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    children: [
                      Text("Total", style: TextStyle(fontSize: 16),),
                    ],
                  ),

                  Column(
                    children: [
                      Text("€${_total.toStringAsFixed(2)}")
                    ],
                  )

                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Pay with", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text("Payment method"),
                        ],
                      ),

                      Column(
                        children: [

                          // Image.asset("images/stripe.png",width: 40,),

                          TextButton(
                          onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckoutView(
                          sandboxMode: true,
                          clientId: "AYPYPs4Y1t-fcH1-prbDyfACPdGILvlJWO8xP4zmQJ6xuNanIw9xZBfFxABD4wyXtYVPzxktNgHejiuu",
                          secretKey: "EJG0r5aA3HCvsGCBV3X63aWi19BGSTOFOLWjey-39u5i7M2H2idyewbq4dvdyG1wKpVtenp_lAnepXCg",
                          transactions: const [
                          {
                          "amount": {
                          "total": '100',
                          "currency": "USD",
                          "details": {
                          "subtotal": '100',
                          "shipping": '0',
                          "shipping_discount": 0
                          }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                          "items": [
                          {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '10',
                          "currency": "USD"
                          },
                          {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '12',
                          "currency": "USD"
                          }
                          ],

                          // Optional
                          //   "shipping_address": {
                          //     "recipient_name": "Tharwat samy",
                          //     "line1": "tharwat",
                          //     "line2": "",
                          //     "city": "tharwat",
                          //     "country_code": "EG",
                          //     "postal_code": "25025",
                          //     "phone": "+00000000",
                          //     "state": "ALex"
                          //  },
                          }
                          }
                          ],
                          note: "Contact us for any questions on your order.",
                          onSuccess: (Map params) async {
                          log("onSuccess: $params");
                          Navigator.pop(context);
                          },
                          onError: (error) {
                          log("onError: $error");
                          Navigator.pop(context);
                          },
                          onCancel: () {
                          print('cancelled:');
                          Navigator.pop(context);
                          },
                          ),
                          ));
                          },
                          child: const Text('Pay with paypal'),
                          ),
                          SizedBox(
                            width: 180,
                            child: GooglePayButton(
                              paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
                              paymentItems: [
                                PaymentItem(
                                  label: 'Total Amount',
                                  amount: _total.toString(),
                                  status: PaymentItemStatus.final_price,
                                ),
                              ],
                              type: GooglePayButtonType.pay,
                              margin: const EdgeInsets.only(top: 15.0),
                              onPaymentResult: (result) {
                                print("Payment Result = $result");
                              },
                            ),
                          ),

                          ApplePayButton(
                            paymentConfiguration:
                            PaymentConfiguration.fromJsonString(
                                defaultApplePay),
                            paymentItems: [
                              PaymentItem(
                                label: 'Booking Amount',
                                amount: _total.toString(),
                                status: PaymentItemStatus.final_price,
                              ),
                            ],
                            style: ApplePayButtonStyle.black,
                            width: double.infinity,
                            // height: 50,
                            type: ApplePayButtonType.buy,
                            margin: const EdgeInsets.only(top: 15.0),
                            onPaymentResult: (result) {
                              print("Payment Result = $result");
                            },
                            loadingIndicator: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),





                        ],
                      ),
                    ],
                  ),



                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          textStyle: const TextStyle(fontSize: 18),
                          side: const BorderSide(width: 1, color: Colors.black), // Add this line
                        ),
                        child: const Text('Add', style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  )
                ],
              ),



              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Required for your trip", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Message the Host",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "Share why you're travelling, who's coming with you, and what you love about the space.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>   ChatPage(ownerId: widget.documentSnapshot['ownerId'], )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            textStyle: const TextStyle(fontSize: 18),
                            side: const BorderSide(width: 1, color: Colors.black),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Photo",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "Hosts want to know who's staying at their place.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            textStyle: const TextStyle(fontSize: 18),
                            side: const BorderSide(width: 1, color: Colors.black),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              // const Row(
              //   children: [
              //     Text("Cancellation policy", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              //
              // const Column(
              //   children: [
              //
              //     Text("Free cancellation for 48 hours. Cancel before Aug 24 for a partial refund.",style: TextStyle(fontSize: 16),)
              //
              //   ],
              // ),
              //
              // const SizedBox(
              //   height: 20,
              // ),
              //
              // const Divider(
              //   thickness: 6,
              //   color: Color(0xffebebeb),
              //   height: 20,
              // ),
              const SizedBox(
                height: 5,
              ),

              const Row(
                children: [
                  Text("Ground rules", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Add this line
                  children: [
                    Text("we ask every guest to remember a few simple things about what makes a great guest.",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(" · Follow the house rules",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(" · Treat your Host's home like your own",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),


              const SizedBox(
                height: 20,
              ),

              const Divider(
                thickness:6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),


              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_month)
                    ],
                  ),
                  Expanded( // Wrap the Column with Expanded
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text("Your reservation won't be confirmed until the Host accepts your request (within 24 hours). You won't be charged until then.",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              const Divider(
                thickness: 6,
                color: Color(0xffebebeb),
                height: 20,
              ),
              const SizedBox(
                height: 5,
              ),

              const Text("By selecting the button below, I agree to the following: The Host's House Rules, Ground rules for guests, Putko's Rebooking and Refund Policy, That Putko can charge my payment method if I'm responsible for damage To pay the total amount shown if the Host accepts my booking request Payment Terms between you and Putko Payments.",
                style: TextStyle(fontSize: 12),
              ),

              const SizedBox(
                height: 20,
              ),

              CommonButton(
                buttonText: "Request to book",
                onTap: () {
                  // You can show a dialog or navigate to a new screen here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Select a payment method:'),
                            const SizedBox(height: 10),
                            GooglePayButton(
                              paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
                              paymentItems: [
                                PaymentItem(
                                  label: 'Total Amount',
                                  amount: _total.toString(),
                                  status: PaymentItemStatus.final_price,
                                ),
                              ],
                              type: GooglePayButtonType.pay,
                              margin: const EdgeInsets.only(top: 15.0),
                              onPaymentResult: (result) {
                                print("Payment Result = $result");
                              },
                            ),
                            const SizedBox(height: 10),
                            ApplePayButton(
                              paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
                              paymentItems: [
                                PaymentItem(
                                  label: 'Booking Amount',
                                  amount: _total.toString(),
                                  status: PaymentItemStatus.final_price,
                                ),
                              ],
                              style: ApplePayButtonStyle.black,
                              width: double.infinity,
                              type: ApplePayButtonType.buy,
                              margin: const EdgeInsets.only(top: 15.0),
                              onPaymentResult: (result) {
                                print("Payment Result = $result");
                              },
                              loadingIndicator: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => PaypalCheckoutView(
                                    sandboxMode: true,
                                    clientId: "AYPYPs4Y1t-fcH1-prbDyfACPdGILvlJWO8xP4zmQJ6xuNanIw9xZBfFxABD4wyXtYVPzxktNgHejiuu",
                                    secretKey: "EJG0r5aA3HCvsGCBV3X63aWi19BGSTOFOLWjey-39u5i7M2H2idyewbq4dvdyG1wKpVtenp_lAnepXCg",
                                    transactions: const [
                                      {
                                        "amount": {
                                          "total": '100',
                                          "currency": "EUR",
                                          "details": {
                                            "subtotal": '100',
                                            "shipping": '0',
                                            "shipping_discount": 0
                                          }
                                        },
                                        "description": "The payment transaction description.",
                                        // "payment_options": {
                                        //   "allowed_payment_method":
                                        //       "INSTANT_FUNDING_SOURCE"
                                        // },
                                        "item_list": {
                                          "items": [
                                            {
                                              "name": "Apple",
                                              "quantity": 4,
                                              "price": '10',
                                              "currency": "USD"
                                            },
                                            {
                                              "name": "Pineapple",
                                              "quantity": 5,
                                              "price": '12',
                                              "currency": "USD"
                                            }
                                          ],

                                          // Optional
                                          //   "shipping_address": {
                                          //     "recipient_name": "Tharwat samy",
                                          //     "line1": "tharwat",
                                          //     "line2": "",
                                          //     "city": "tharwat",
                                          //     "country_code": "EG",
                                          //     "postal_code": "25025",
                                          //     "phone": "+00000000",
                                          //     "state": "ALex"
                                          //  },
                                        }
                                      }
                                    ],
                                    note: "Contact us for any questions on your order.",
                                    onSuccess: (Map params) async {
                                      log("onSuccess: $params");
                                      Navigator.pop(context);
                                    },
                                    onError: (error) {
                                      log("onError: $error");
                                      Navigator.pop(context);
                                    },
                                    onCancel: () {
                                      print('cancelled:');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ));
                              },
                              child: const Text('Pay with paypal'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

