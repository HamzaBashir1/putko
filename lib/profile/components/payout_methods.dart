import 'package:flutter/material.dart';
import 'package:putko/profile/components/set_up_payouts.dart';

class PayoutMethods extends StatefulWidget {
  const PayoutMethods({super.key});

  @override
  State<PayoutMethods> createState() => _PayoutMethodsState();
}

class _PayoutMethodsState extends State<PayoutMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 20,left: 20,top: 10),
        child: Column(
          children: [

            const Row(
              children: [
                Text(
                  "How you'll get paid",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            const Text(
              "Add at least one payout method so we know where to send your money.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 20),
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
                          pageBuilder: (context, animation, secondaryAnimation) => const SetUpPayouts(),
                        ),
                      );
                    },
                    child: const Text("Set up payouts"),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 16,top: 15),
                    child: Text("Need help?", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    ),
                  ),

                  ListTile(
                    title: const Text('When you\'ll get your payout'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to the payout information page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PayoutInfoPage(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    title: const Text('How payouts work'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to the payout process page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PayoutProcessPage(),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    title: const Text('Go to your transaction history'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to the transaction history page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionHistoryPage(),
                        ),
                      );
                    },
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

class PayoutInfoPage extends StatelessWidget {
  const PayoutInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payout Information'),
      ),
      body: const Center(
        child: Text('Payout information will be displayed here.'),
      ),
    );
  }
}

class PayoutProcessPage extends StatelessWidget {
  const PayoutProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payout Process'),
      ),
      body: const Center(
        child: Text('Payout process details will be displayed here.'),
      ),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: const Center(
        child: Text('Transaction history will be displayed here.'),
      ),
    );
  }
}