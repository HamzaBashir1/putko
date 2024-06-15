import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:putko/widget/common_button.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  //image shared preference
  File? _image;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveImageToSharedPreferences(_image!.path);
      }
    });
  }

  Future<void> _saveImageToSharedPreferences(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('image_path', imagePath);
  }

  Future<void> _loadImageFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('image_path');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  //school info shared preference
  final _schoolcontroller = TextEditingController();
  String _schoolName = '';
  Future<void> _saveSchoolName(String schoolName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('school_name', schoolName);
    setState(() {
      _schoolName = schoolName;
    });
  }

  Future<void> _loadSchoolName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _schoolName = prefs.getString('school_name') ?? '';
    });
  }

  //work shared preference
  String _work = '';
  Future<void> _saveWork(String work) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('work', work);
    setState(() {
      _work = work;
    });
  }

  Future<void> _loadWork() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _work = prefs.getString('work') ?? '';
    });
  }

  //address shared preference
  String _address = '';
  Future<void> _saveAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
    setState(() {
      _address = address;
    });
  }

  Future<void> _loadAddress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _address = prefs.getString('address') ?? '';
    });
  }

  //useless skill shared preference
  String _uselessSkill = '';
  final _uselessSkillController = TextEditingController();

  Future<void> _saveUselessSkill(String uselessSkill) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('useless_skill', uselessSkill);
    setState(() {
      _uselessSkill = uselessSkill;
    });
  }

  Future<void> _loadUselessSkill() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _uselessSkill = prefs.getString('useless_skill') ?? '';
    });
  }

  //biography title shared preference
  String _biographyTitle = '';
  final _biographyTitleController = TextEditingController();

  Future<void> _saveBiographyTitle(String biographyTitle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('biography_title', biographyTitle);
    setState(() {
      _biographyTitle = biographyTitle;
    });
  }

  Future<void> _loadBiographyTitle() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _biographyTitle = prefs.getString('biography_title') ?? '';
    });
  }

  //spend too much time shared preference
  String _spendTooMuchTime = '';
  final _spendTooMuchTimeController = TextEditingController();

  Future<void> _saveSpendTooMuchTime(String spendTooMuchTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('spend_too_much_time', spendTooMuchTime);
    setState(() {
      _spendTooMuchTime = spendTooMuchTime;
    });
  }

  Future<void> _loadSpendTooMuchTime() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _spendTooMuchTime = prefs.getString('spend_too_much_time')?? '';
    });
  }

  //pets shared preference
  String _pets = '';
  final _petsController = TextEditingController();

  Future<void> _savePets(String pets) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pets', pets);
    setState(() {
      _pets = pets;
    });
  }

  Future<void> _loadPets() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _pets = prefs.getString('pets')?? '';
    });
  }

  //text shared preference
  String _text = '';
  final _textController = TextEditingController();

  Future<void> _saveText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('text', text);
    setState(() {
      _text = text;
    });
  }

  Future<void> _loadText() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = prefs.getString('text')?? '';
    });
  }


  @override
  void initState() {
    super.initState();
    _loadImageFromSharedPreferences();
    _loadSchoolName();
    _loadWork();
    _loadAddress();
    _loadUselessSkill();
    _loadBiographyTitle();
    _loadSpendTooMuchTime();
    _loadPets();
    _loadText();
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
          child: CommonButton(
            onTap: () {
              // Save all the data to shared preferences
              _saveImageToSharedPreferences(_image!.path);
              _saveSchoolName(_schoolcontroller.text);
              _saveWork(_work);
              _saveAddress(_address);
            },
            buttonText: "Done",
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: _selectImage,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.3,
                        right: constraints.maxWidth * 0.3,
                      ),
                      child: CircleAvatar(
                        radius: constraints.maxWidth * 0.2,
                        backgroundColor: Colors.black,
                        child: _image!= null
                            ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxWidth * 0.4,
                        )
                            : const Text(
                          'H',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Your Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        "The information you share will be used across Putko to help other guests and Hosts, get to know you.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("School Information"),
                              content: TextField(
                                controller: _schoolcontroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter your school name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  child: const Text("save"),
                                  onPressed: () {
                                    _saveSchoolName(_schoolcontroller.text);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.school)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Text(
                                  _schoolName.isEmpty? "Where I went to school" : _schoolName,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final _workController = TextEditingController();
                          return AlertDialog(
                            title: const Text("What do you do for work?"),
                            content: TextField(
                              controller: _workController,
                              decoration: InputDecoration(
                                labelText: 'Enter your work',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _saveWork(_workController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.work)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Text(
                                  _work.isEmpty? "My work" : _work,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final _addressController = TextEditingController();
                          return AlertDialog(
                            title: const Text("Where you live"),
                            content: TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                labelText: 'Enter your address',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _saveAddress(_addressController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.map)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _address.isEmpty? "Where live" : _address,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("What's your most useless skill?"),
                            content: TextField(
                              controller: _uselessSkillController,
                              decoration: InputDecoration(
                                labelText: 'My most useless skill',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _saveUselessSkill(_uselessSkillController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.pin)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _uselessSkill.isEmpty? "My most useless skill" : _uselessSkill,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("What would your biagraphy title be?"),
                            content: TextField(
                              controller: _biographyTitleController,
                              decoration: InputDecoration(
                                labelText: 'My biography title would be',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _saveBiographyTitle(_biographyTitleController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.chrome_reader_mode_outlined)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _biographyTitle.isEmpty? "My biagraphy title would be" : _biographyTitle,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("what do you spend too much time doing?"),
                            content: TextField(
                              controller: _spendTooMuchTimeController,
                              decoration: InputDecoration(
                                labelText: 'I spend too much time.',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _saveSpendTooMuchTime(_spendTooMuchTimeController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.alarm)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _spendTooMuchTime.isEmpty? "I Spend too much time" : _spendTooMuchTime,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Do you have any pets? in your life?"),
                            content: TextField(
                              controller: _petsController,
                              decoration: InputDecoration(
                                labelText: 'Pets.',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("save"),
                                onPressed: () {
                                  _savePets(_petsController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.pets)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _pets.isEmpty? "Pets" : _pets,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  const Row(
                    children: [
                      Text(
                        "About you",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8, // set the width to 80% of the screen width
                        padding: const EdgeInsets.all(10), // add some padding
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2), // set the border to a 2px wide black line
                          borderRadius: const BorderRadius.all(Radius.circular(10)), // add some rounded corners
                        ),
                        child: TextField(
                          maxLines: 5,
                          controller: _textController,
                          decoration: InputDecoration(
                            border: InputBorder.none, // remove the default border
                            hintText: 'Enter your text here', // add a hint text
                          ),
                        ),
                      ),
                      const SizedBox(height: 20), // add some space between the text field and the divider
                      ElevatedButton(
                        child: const Text("save"),
                        onPressed: () {
                          _saveText(_textController.text);
                        },
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "What you're into",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 24,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}