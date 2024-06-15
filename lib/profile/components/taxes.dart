

import 'package:flutter/material.dart';

class Taxes extends StatefulWidget {
  const Taxes({super.key});

  @override
  State<Taxes> createState() => _TaxesState();
}

class _TaxesState extends State<Taxes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Taxes',style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Taxpayers'),
              Tab(text: 'Tax Documents'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaxpayersTab(),
            TaxDocumentsTab(),
          ],
        ),
      ),
    );
  }
}


class TaxpayersTab extends StatelessWidget {
  const TaxpayersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Taxpayer information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tax info is required for most countries/regions.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // TODO: Handle adding tax info
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                child: Text('Add tax info'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Value Added Tax (VAT)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'If you are VAT-registered, please add your VAT ID.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // TODO: Handle adding VAT ID
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                child: const Text('Add VAT ID Number'),
              ),
            ],
          ),
    );
  }
}

class TaxDocumentsTab extends StatefulWidget {
  const TaxDocumentsTab({super.key});

  @override
  State<TaxDocumentsTab> createState() => _TaxDocumentsTabState();
}

class _TaxDocumentsTabState extends State<TaxDocumentsTab> {

  // final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tax documents required for filing taxes are available to review and download here.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'You can also file taxes using detailed earnings info, available in the earnings summary.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              _buildYearSection(2023, 'No tax document issued'),
              const SizedBox(height: 16),
              _buildYearSection(2022, 'No tax document issued'),
              const SizedBox(height: 16),
              _buildYearSection(2021, 'No tax document issued'),
              const SizedBox(height: 16),
              _buildYearSection(2020, 'No tax document issued'),
              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.only(top: 30,bottom: 70),
                child: Text("For Tax documents issued prior to 2020, contact us.",style: TextStyle(fontSize: 16),),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Need help?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              const Text("Get answers to questions about taxes in our Help Center.", style: TextStyle(fontSize: 16),),


              const SizedBox(
                height: 40,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildYearSection(int year, String message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        year.toString(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      const Divider(),
    ],
  );
}