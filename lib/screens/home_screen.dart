import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:putko/listing_view/ad_view_screen.dart';
import 'package:putko/screens/booking_details_screen.dart';
// import 'package:putko/screens/booking_details_screen.dart';
// import '../model/property.dart';
import '../shared/theme/colors.dart';
import '../widget/property_type_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 160,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: appWhite,
            boxShadow: [
              BoxShadow(
                  color: appBlack.withOpacity(0.1),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 1.0)
              )
            ],
          ),
          child: Stack(
            children: [

              const Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: PropertyTypeList(),
              ),

              Positioned(
                  top: 70.0,
                  right: 8.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  )
              ),

              Positioned(
                left: 16.0,
                right: 60.0,
                top: 60.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookingDetailsScreen()),
                    );
                  },
                  child: Hero(
                    tag: 'search',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: appWhite,
                        border: Border.all(
                          color: appGrey,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: appGrey.withOpacity(0.5),
                            blurRadius: 8.0,
                            spreadRadius: 8.0,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 6.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Where to?',
                                style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Anywhere • Any week • Add guest',
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder(
          valueListenable: PropertyTypeList.selectedType,
          builder: (context, value, child) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("postings")
                  .where("propertyType", isEqualTo: value)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((snap) {
                    return PropertyCard(snap: snap);
                  }).toList(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


class PropertyCard extends StatefulWidget {

  final QueryDocumentSnapshot snap;

  const PropertyCard({super.key, required this.snap});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  final controller = PageController();
  var currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdViewScreen(
                  id: widget.snap.id,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: size.width,
                height: size.width - 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: (widget.snap['photos'] as List<dynamic>).map<Widget>((imageUrl) {
                    return Image.network(imageUrl, fit: BoxFit.cover);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.snap['country'] + widget.snap['town'],
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.snap['description'],
              ),
              const SizedBox(height: 8.0),
              // Text(
              //   widget.snap['amenities'].join(', '),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}