import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


class ShowAmenities extends StatefulWidget {
  const ShowAmenities({super.key});

  @override
  State<ShowAmenities> createState() => _ShowAmenitiesState();
}

class _ShowAmenitiesState extends State<ShowAmenities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [

              Row(
                children: [

                  Text("What this place offers", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),

                ],
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Scenic views",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pool)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Lake View",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Bathroom",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.bathtub)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Bathtub",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.dry)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Hair dryer",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.water_drop_outlined)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Hot Water",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Bedroom and laundry",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      Icons.brush,
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Essential',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Towels, bed sheets, soap, and toilet paper',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      FontAwesome.cotton_bureau_brand,
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bed linens',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cotton linens',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.roller_shades)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Room-darkening shades",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.dry_cleaning)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Drying rack for clothing",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.bed)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Mosquito net",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.storage)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Clothing storage",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),


              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Entertainment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.tv)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("TV",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.bluetooth)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Bluetooth sound system",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Family",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.ac_unit)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Central air conditioning",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.fireplace)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Indoor fireplace: wood-burning",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.thermostat_auto)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Central heating",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),


              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Family",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.border_all_rounded)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Board games",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Home safety",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.camera_alt_outlined)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Exterior security cameras on \nproperty",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.smoke_free)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Smoke alarm",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.warning)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Carbon monoxide alarm",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.fire_extinguisher)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Fire extinguisher",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Internet and office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.wifi)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Wifi",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.desk)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Dedicated workspace",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Kitchen and dining",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                      FontAwesome.kitchen_set_solid,
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kitchen',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'space where guests can cook their own meals',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.storage)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Refrigerator",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.microwave)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Microwave",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                        Icons.cookie
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cooking basics',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Pots and pans, oil, salt and pepper',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                        Icons.cookie
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dishes and silverware',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Bowls, chopsticks, plates, cups, etc.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.store_mall_directory_outlined)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Mini fridge",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.coffee)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Hot water Kettle",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.wine_bar)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Wine glasses",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.coffee_maker)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Coffee",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Location feature",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                        Icons.door_front_door_outlined
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Private entrance',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seperate street or building entrance',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Outdoor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.balcony_sharp)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Private patio or balcony",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40, // adjust the width to fit your icon
                    child: Icon(
                        Icons.door_front_door_outlined
                    ),
                  ),
                  // SizedBox(width: 2), // add some space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Private backyard - Not fully fenced',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'An open space on the property usually covered in grass',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.table_restaurant_rounded)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Outdoor furniture",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.table_restaurant_rounded)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Outdoor dining area",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.outdoor_grill_outlined)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("BBQ grill",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.sunny)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Sun loungers",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Parking and facilities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.drive_eta)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Free driveaway parking on premises",style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.hot_tub)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Private hot tub - available all year, \nopen 24 hours",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.stairs)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Single level home",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.pets)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Pets allowed",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),



              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),


              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.smoking_rooms)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Smoking allowed",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_month)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Long term stay allowed",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.key)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Self Check-in",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.lock)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Smart lock",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [

                    Text("Not Included",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.wash)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Washer",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.dry_cleaning)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Dryer",style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),

              SizedBox(
                height: 40,
              ),


            ],
          ),
        ),
      ),
    );
  }
}