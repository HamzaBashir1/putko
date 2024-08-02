import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:putko/listing_screen/component/property_title.dart';

class Photos extends StatefulWidget {
  final String postingId;
  const Photos({super.key, required this.postingId});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  List<XFile>? _selectedImages;
  List<String> _imageUrls = [];

  Future<void> _getImages() async {
    final ImagePicker _picker = ImagePicker();
    _selectedImages = await _picker.pickMultiImage();
    setState(() {});
  }

  Future<void> _uploadImages() async {
    if (_selectedImages == null) return;

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final String postingId = widget.postingId;
    List<String> _imageUrls = [];

    for (int i = 0; i < _selectedImages!.length; i++) {
      final XFile image = _selectedImages![i];
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('postings')
          .child(postingId)
          .child('photo${i + 1}.jpg');

      await storageRef.putFile(File(image.path));
      final String downloadUrl = await storageRef.getDownloadURL();
      _imageUrls.add(downloadUrl);
    }

    await _firestore.collection('postings').doc(postingId).set({
      'photos': _imageUrls,
    }, SetOptions(merge: true));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => YourPhotos(postingId: widget.postingId, imageUrls: _imageUrls)),
    );
  }

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
                onPressed: _selectedImages!= null
                    ? _uploadImages
                    : null,
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
            const Text("Add some photos of your cabin", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            const Text("You'll need 5 photos to get started. you can add more or make changes later.",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _getImages,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)), // Add this line to make the border rounded
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Add photos',style: TextStyle(fontSize: 18),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: _getImages,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)), // Add this line to make the border rounded
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10,left: 10),
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Take new photos',style: TextStyle(fontSize: 18),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YourPhotos extends StatefulWidget {
  final String postingId;
  final List<String> imageUrls;

  const YourPhotos({super.key, required this.postingId, required this.imageUrls});

  @override
  State<YourPhotos> createState() => _YourPhotosState();
}

class _YourPhotosState extends State<YourPhotos> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyTitle(postingId: widget.postingId)),
                  );
                },
                child: const Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Text("Your Photos",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  widget.imageUrls.length > 15 ? 15 : widget.imageUrls.length,
                      (index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white,
                      child: SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.network(widget.imageUrls[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}