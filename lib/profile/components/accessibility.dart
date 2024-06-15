import 'package:flutter/material.dart';

class Accessibility extends StatefulWidget {
  const Accessibility({super.key});

  @override
  State<Accessibility> createState() => _AccessibilityState();
}

class _AccessibilityState extends State<Accessibility> {
  bool _zoomControlsEnabled = true;
  bool _panControlsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [


            Row(
              children: [
                const Text(
                  "Accessibility",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Map zoom controls',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Zoom in and out with dedicated buttons',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Enabled'),
                  value: _zoomControlsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _zoomControlsEnabled = value;
                    });
                  },
                ),
                const SizedBox(height: 32),
                const Text(
                  'Map pan controls',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pan around the map with directional buttons',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Enabled'),
                  value: _panControlsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _panControlsEnabled = value;
                    });
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
