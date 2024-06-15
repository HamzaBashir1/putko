import 'package:flutter/material.dart';
import 'package:putko/profile/components/add_gift_card.dart';


class CreditsCoupons extends StatefulWidget {
  const CreditsCoupons({super.key});

  @override
  State<CreditsCoupons> createState() => _CreditsCouponsState();
}

class _CreditsCouponsState extends State<CreditsCoupons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Divider(
            thickness: 1,
            height: 20,
              color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10,right: 20,left: 20),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  "Credits and  coupons",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text(
                  "Gift credit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Add this line
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const AddGiftCard(),
                        ),
                      );
                    },
                    child: const Text("Add gift card"),
                  ),
                ],
              ),
            ),
            
            Divider(
              height: 20,
              color: Colors.grey,
              thickness: 1,
            ),

            Row(
              children: [
                Text(
                  "Coupons",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                )
              ],
            ),
            
            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("Your coupons")
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text("0")
                    ],
                  )
                ],
              ),
            ),


            Container(
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Add this line
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => const AddGiftCard(),
                        ),
                      );
                    },
                    child: const Text("Add coupon"),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
