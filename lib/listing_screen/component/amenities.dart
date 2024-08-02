import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:putko/listing_screen/component/photos.dart';

class Amenities extends StatefulWidget {
  final String postingId;
  const Amenities({super.key, required this.postingId});

  @override
  State<Amenities> createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {
  bool _isSelectedWifi = false;
  bool _isSelectedTv = false;
  bool _isSelectedKitchen = false;
  bool _isSelectedWasher = false;
  bool _isSelectedFreeParking = false;
  bool _isSelectedPaidParking = false;
  bool _isSelectedAirConditioner = false;
  bool _isSelectedDedicatedWorkspace = false;
  bool _isSelectedPet = false;
  bool _isSelectedDryer = false;
  bool _isSelectedSmokeAllow = false;
  bool _isSelectedPrivateEntrance =false;

  bool _isSelectedPool = false;
  bool _isSelectedHotTub = false;
  bool _isSelectedPatio = false;
  bool _isSelectedBBQgrill = false;
  bool _isSelectedOutdoorDiningArea = false;
  bool _isSelectedFirepit = false;
  bool _isSelectedIndoorFireplace = false;
  bool _isSelectedPiano = false;
  bool _isSelectedExerciseEquipment = false;
  bool _isSelectedLakeAccess = false;
  bool _isSelectedBeachAccess = false;
  bool _isSelectedOutdoorShower = false;

  bool _isSelectedSmokeAlarm = false;
  bool _isSelectedFirstAidKit = false;
  bool _isSelectedFireExtinguisher = false;
  bool _isSelectedCarbonManoxideAlarm = false;

  Future<void> _addAmenitiesToFirestore() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final postingRef = _firestore.collection('postings').doc(widget.postingId);

    // Add the amenities to Firestore
    await postingRef.set({
      'amenities': {
        'guestFavorites': {
          'wifi': _isSelectedWifi,
          'tv': _isSelectedTv,
          'kitchen': _isSelectedKitchen,
          'washer': _isSelectedWasher,
          'freeParking': _isSelectedFreeParking,
          'paidParking': _isSelectedPaidParking,
          'airConditioner': _isSelectedAirConditioner,
          'dedicatedWorkspace': _isSelectedDedicatedWorkspace,
          'pet': _isSelectedPet,
          'dryer': _isSelectedDryer,
          'smokeallow': _isSelectedSmokeAllow,
          'privateentrance': _isSelectedPrivateEntrance,
        },
        'standoutAmenities': {
          'pool': _isSelectedPool,
          'hotTub': _isSelectedHotTub,
          'patio': _isSelectedPatio,
          'bbqGrill': _isSelectedBBQgrill,
          'outdoorDiningArea': _isSelectedOutdoorDiningArea,
          'firepit': _isSelectedFirepit,
          'indoorFireplace': _isSelectedIndoorFireplace,
          'piano': _isSelectedPiano,
          'exerciseEquipment': _isSelectedExerciseEquipment,
          'lakeAccess': _isSelectedLakeAccess,
          'beachAccess': _isSelectedBeachAccess,
          'outdoorShower': _isSelectedOutdoorShower,
        },
        'safetyItems': {
          'SmokeAlarm': _isSelectedSmokeAlarm,
          'firstAidKit': _isSelectedFirstAidKit,
          'fireExtinguisher': _isSelectedFireExtinguisher,
          'carbonMonoxideAlarm': _isSelectedCarbonManoxideAlarm,
        },
      },
    }, SetOptions(merge: true));
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
                  onPressed: ()
                  {
                    _addAmenitiesToFirestore();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Photos(postingId: widget.postingId)),
                    );
                  },
                  // onPressed: _selectedPlaceType!= null
                  //     ? () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => BasicYourPlace()),
                  //   );
                  // }
                  //     : null,
                  child: const Text('Next', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
          child: Column(
            children: [
        
              const Text("Tell guests what your place has to offer", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        
              const Text("You can add more amenities after you publish your listing.",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                ),
              ),
        
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text("What about these guest favourites?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
        
        
        
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedWifi =!_isSelectedWifi;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedWifi? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wifi),
                              SizedBox(height: 16),
                              Text('Wifi'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedTv =!_isSelectedTv;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedTv? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.tv),
                              SizedBox(height: 16),
                              Text('TV'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedKitchen =!_isSelectedKitchen;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedKitchen? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.kitchen),
                              SizedBox(height: 16),
                              Text('Kitchen'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedWasher =!_isSelectedWasher;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedWasher? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wash),
                              SizedBox(height: 16),
                              Text('Washer'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedSmokeAllow =!_isSelectedSmokeAllow;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedSmokeAllow? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.smoke_free_outlined),
                              SizedBox(height: 16),
                              Text('Smoke'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPet =!_isSelectedPet;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPet? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pets),
                              SizedBox(height: 16),
                              Text('Pet'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPrivateEntrance =!_isSelectedPrivateEntrance;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPrivateEntrance? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.door_back_door_outlined),
                              SizedBox(height: 16),
                              Text('Private Entrance'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedDryer =!_isSelectedDryer;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedDryer? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wash),
                              SizedBox(height: 16),
                              Text('Dryer'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedFreeParking =!_isSelectedFreeParking;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedFreeParking? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.directions_car),
                              SizedBox(height: 16),
                              Text('Free Parking'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPaidParking =!_isSelectedPaidParking;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPaidParking? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.directions_car),
                              SizedBox(height: 16),
                              Text('Paid Parking'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedAirConditioner =!_isSelectedAirConditioner;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedAirConditioner? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.ac_unit),
                              SizedBox(height: 16),
                              Text('Air conditioning'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedDedicatedWorkspace =!_isSelectedDedicatedWorkspace;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedDedicatedWorkspace? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.table_restaurant_rounded),
                              SizedBox(height: 16),
                              Text('Dedicated workspace'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text("Do you have any standout amenities?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPool =!_isSelectedPool;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPool? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pool),
                              SizedBox(height: 16),
                              Text('Pool'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedHotTub =!_isSelectedHotTub;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedHotTub? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.hot_tub),
                              SizedBox(height: 16),
                              Text('Hot tub'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPatio =!_isSelectedPatio;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPatio? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.adinkra),
                              Icon(FontAwesome.window_restore_solid),
                              SizedBox(height: 16),
                              Text('Patio'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedBBQgrill =!_isSelectedBBQgrill;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedBBQgrill? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.outdoor_grill_outlined),
                              SizedBox(height: 16),
                              Text('BBQ grill'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedOutdoorDiningArea =!_isSelectedOutdoorDiningArea;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedOutdoorDiningArea? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.table_restaurant_rounded),
                              SizedBox(height: 16),
                              Text('Outdoor dinning area'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedFirepit =!_isSelectedFirepit;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedFirepit? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fireplace),
                              SizedBox(height: 16),
                              Text('Fire pit'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedIndoorFireplace =!_isSelectedIndoorFireplace;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedIndoorFireplace? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fireplace),
                              SizedBox(height: 16),
                              Text('Indoor Fireplace'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedPiano =!_isSelectedPiano;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedPiano? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.piano_outlined),
                              SizedBox(height: 16),
                              Text('Piano'),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedExerciseEquipment =!_isSelectedExerciseEquipment;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedExerciseEquipment? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fitness_center),
                              SizedBox(height: 16),
                              Text('Exercise equipment'),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedLakeAccess =!_isSelectedLakeAccess;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedLakeAccess? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesome.digital_ocean_brand),
                              SizedBox(height: 16),
                              Text('Lake access'),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedBeachAccess =!_isSelectedBeachAccess;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedBeachAccess? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.beach_access),
                              SizedBox(height: 16),
                              Text('Beach access'),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedOutdoorShower =!_isSelectedOutdoorShower;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedOutdoorShower? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shower),
                              SizedBox(height: 16),
                              Text('Outdoor Shower'),
                            ],
                          ),
                        ),
                      ),


                    ],
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text("Do you have any of these safety items?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedSmokeAlarm =!_isSelectedSmokeAlarm;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedSmokeAlarm? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.smoke_free),
                              SizedBox(height: 16),
                              Text('Smoke Alarm'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedFirstAidKit =!_isSelectedFirstAidKit;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedFirstAidKit? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medical_services_rounded),
                              SizedBox(height: 16),
                              Text('First aid Kit'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedFireExtinguisher =!_isSelectedFireExtinguisher;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedFireExtinguisher? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fire_extinguisher),
                              SizedBox(height: 16),
                              Text('Fire Extinguisher'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedCarbonManoxideAlarm =!_isSelectedCarbonManoxideAlarm;
                          });
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: _isSelectedCarbonManoxideAlarm? Color(0xFF4FBE9F) : Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.warning),
                              SizedBox(height: 16),
                              Text('Monoxide alarm'),
                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
