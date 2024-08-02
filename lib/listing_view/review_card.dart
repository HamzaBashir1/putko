import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final int rating;
  final String date;
  final String review;
  final String author;
  final int? yearsOnAirbnb;

  const ReviewCard({
    super.key,
    required this.rating,
    required this.date,
    required this.review,
    required this.author,
    required this.yearsOnAirbnb,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20), // add margin left and right
            width: 300,
            padding: const EdgeInsets.all(20), // add padding top, right, bottom, left
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  review,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: Center(
                        child: Text(
                          author.isNotEmpty? author[0].toUpperCase() : '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (yearsOnAirbnb!= null)
                          Text(
                            '$yearsOnAirbnb years on Airbnb',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // add space between card and button
          ElevatedButton(
            onPressed: () {}, // add your onPressed function here
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xFFfaf7f0),
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0), // add padding left and right
              child: Text(
                'Show all 63 reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}