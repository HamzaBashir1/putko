import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/get_started_ui.dart';
import 'package:putko/widget/host_home_screen.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  bool _isGridView = false; // Add this variable
  List<String> _imageUrls = []; // Add this list to store image URLs
  List<String> _titles = []; // Add this list to store titles


  @override
  void initState() {
    super.initState();
    _getImageUrls(); // Call this function to retrieve image URLs
  }

  Future<void> _getImageUrls() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final QuerySnapshot snapshot = await _firestore.collection('postings').get();
    for (var doc in snapshot.docs) {
      if (doc.get('photos') != null && doc.get('photos').isNotEmpty) {
        _imageUrls.add(doc.get('photos')[0]); // Retrieve only the first image URL
        _titles.add(doc.get('title')); // Retrieve the title
        break; // Stop iterating over the documents
      }
    }
    setState(() {}); // Update the UI
  }

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
      // bottomNavigationBar: const HostHomeScreen(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const Text("Your listings", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const SizedBox(height: 40,),
            Expanded(
              child: _imageUrls.isEmpty
                  ? Center(child: CircularProgressIndicator()) // Show a loading indicator
                  : _isGridView
                  ? GridView.builder( // Show grid view
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // One item per row
                ),
                itemCount: 1, // Number of items
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
                            child: Image.network(_imageUrls[0], fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              _titles[index], // Display the title
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                itemCount: 1, // Number of items
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.network(_imageUrls[0], width: 100, height: 100,),
                          Text(
                            _titles[index], // Display the title
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