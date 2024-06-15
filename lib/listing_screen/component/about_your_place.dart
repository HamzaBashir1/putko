import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:putko/listing_screen/component/property_types.dart';
import 'package:video_player/video_player.dart';

class AboutYourPlace extends StatefulWidget {
  const AboutYourPlace({super.key});

  @override
  State<AboutYourPlace> createState() => _AboutYourPlaceState();
}

class _AboutYourPlaceState extends State<AboutYourPlace> {
  late FlickManager flickManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
        )));
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
          decoration: BoxDecoration(
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
                child: Text('Back', style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4FBE9F), // Add background color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PropertyTypes()),
                  );
                },
                child: Text('Next', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right:20),
        child: Column(
          children: [


            // Padding(
            //   padding: const EdgeInsets.only(top: 80,bottom: 40),
            //   child: Center(
            //     child: AspectRatio(
            //       aspectRatio: 16 / 10,
            //         child: FlickVideoPlayer(flickManager: flickManager)
            //     ),
            //   ),
            // ),
            
            Spacer(),


            const Row(
              children: [
                Text("Step 1",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),),
              ],
            ),

            const Row(
              children: [
                Text("Tell us about \nyour place", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              ],
            ),

            const Text("In this step, we'll ask you which type of property you have and if guests will book the entire place or just a room. Then let us know the location and how many guests can stay.",
            style: TextStyle(fontSize: 16),)

          ],
        ),
      ),
    );
  }
}
