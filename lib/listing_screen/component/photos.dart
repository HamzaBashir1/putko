import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/property_title.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {

    String? _selectedPhotos;

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
                onPressed: _selectedPhotos!= null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourPhotos()),
                  );
                }
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourPhotos()),
                );
              },
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourPhotos()),
                );
              },
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
  const YourPhotos({super.key});

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
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyTitle()),
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
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [

            Text("Your Photos",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

            SizedBox(
              height: 20,
            ),

            GridView.count(
              crossAxisCount: 2, // number of columns
              childAspectRatio: 1, // width to height ratio
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.white,
                  child: SizedBox(
                    width: 200, // custom width
                    height: 100, // custom height
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Add more")
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
