import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            children: [
        
              const Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    Text("Still have questions?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                  ],
                ),
              ),
        
              Column(
                children: [
                  FaqItem(
                    question: 'What are the requirements to become an Putko host?',
                    answer:
                    'To become an Putko host, you need to create a listing for your property, provide essential amenities, maintain cleanliness, adhere to safety standards, and follow local regulations.',
                  ),
                  FaqItem(
                    question: "How does Putko handle payments for hosts?",
                    answer: "Putko handles payments securely through its platform. Guests pay when they book, and hosts receive their payment after guests check-in, minus Putko's service fees.",
                  ),
                  FaqItem(
                    question: "Can I rent out my property on Putko if I'm a tenant?",
                    answer: "In most places, you can rent out your property on Putko even if you're a tenant. However, it's crucial to check your lease agreement and local laws before becoming a host.",
                  ),
                  FaqItem(
                    question: 'What should I do if I encounter issues with a guest?',
                    answer: "If you encounter issues with a guest, communicate with them first to resolve the problem. If the issue persists, you can contact Putko's customer support for assistance.",
                  ),
                  FaqItem(
                    question: 'How does Putko handle security and trust between hosts and guests?',
                    answer: "Putko promotes trust between hosts and guests through features like verified profiles, reviews, and secure payment systems. Hosts can also set house rules and communicate expectations to ensure a secure environment.",
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}


class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  FaqItem({super.key, required this.question, required this.answer});

  @override
  _FaqItemState createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        title: Text(widget.question),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}