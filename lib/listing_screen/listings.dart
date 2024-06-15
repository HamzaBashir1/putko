import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/get_started_ui.dart';
import 'package:putko/widget/host_navbar.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool _isGridView = false; // Add this variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isGridView? Icons.list : Icons.grid_view, color: Colors.black),
            onPressed: () {
              setState(() {
                _isGridView =!_isGridView;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GetStartedUI()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const HostNavbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const Text("Your listings", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const SizedBox(height: 40,),
            Expanded(
              child: _isGridView
                  ? GridView.builder( // Show grid view
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // One item per row
                ),
                itemCount: 2, // Number of items
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 169, // Set a fixed height
                            width: double.infinity, // Set the width to match the parent
                            child: Image.asset('images/introduction.jpg', fit: BoxFit.cover),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amazing Opportunity',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Greater London, England',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : ListView.builder( // Show list view
                itemCount: 2, // Number of items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('images/introduction.jpg', width: 100, height: 100,),

                          const Text(
                            'Amazing Opportunity',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}