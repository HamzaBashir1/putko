import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  String? _imageUrl;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadImageToFirebaseStorage(_image!);
      }
    });
  }

  Future<void> _uploadImageToFirebaseStorage(File image) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('users/${user.uid}/profile_image');
      await imageRef.putFile(image);
      final imageUrl = await imageRef.getDownloadURL();
      await _saveImageUrlToFirestore(imageUrl);
    }
  }

  Future<void> _saveImageUrlToFirestore(String imageUrl) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'image_url': imageUrl}, SetOptions(merge: true));
      setState(() {
        _imageUrl = imageUrl;
      });
    }
  }

  Future<void> _loadImageFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _imageUrl = docSnap['image_url'];
        });
      }
    }
  }

  //school info shared preference
  String _schoolName = '';
  final _schoolcontroller = TextEditingController();
  Future<void> _saveSchoolName(String schoolName) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'school_name': schoolName}, SetOptions(merge: true));
      setState(() {
        _schoolName = schoolName;
      });
    }
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
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'work': work}, SetOptions(merge: true));
    }
  }

  Future<void> _loadWork() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _work = docSnap['work'] ?? '';
        });
      }
    }
  }

  //address shared preference
  String _address = '';
  Future<void> _saveAddress(String address) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'address': address}, SetOptions(merge: true));
      setState(() {
        _address = address;
      });
    }
  }

  Future<void> _loadAddress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _address = docSnap['address'] ?? '';
        });
      }
    }
  }

  //useless skill shared preference
  String _uselessSkill = '';
  final _uselessSkillController = TextEditingController();

  Future<void> _saveUselessSkill(String uselessSkill) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'useless_skill': uselessSkill}, SetOptions(merge: true));
      setState(() {
        _uselessSkill = uselessSkill;
      });
      _uselessSkillController.text = uselessSkill;
    }
  }

  Future<void> _loadUselessSkill() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _uselessSkill = docSnap['useless_skill']?? '';
        });
        _uselessSkillController.text = _uselessSkill;
      }
    }
  }

  //biography title shared preference
  String _biographyTitle = '';
  final _biographyTitleController = TextEditingController();

  Future<void> _saveBiographyTitle(String biographyTitle) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'biography_title': biographyTitle}, SetOptions(merge: true));
      setState(() {
        _biographyTitle = biographyTitle;
      });
      _biographyTitleController.text = biographyTitle;
    }
  }

  Future<void> _loadBiographyTitle() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _biographyTitle = docSnap['biography_title']?? '';
        });
        _biographyTitleController.text = _biographyTitle;
      }
    }
  }

  //spend too much time shared preference
  String _spendTooMuchTime = '';
  final _spendTooMuchTimeController = TextEditingController();

  Future<void> _saveSpendTooMuchTime(String spendTooMuchTime) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'spend_too_much_time': spendTooMuchTime}, SetOptions(merge: true));
      setState(() {
        _spendTooMuchTime = spendTooMuchTime;
      });
      _spendTooMuchTimeController.text = spendTooMuchTime;
    }
  }

  Future<void> _loadSpendTooMuchTime() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _spendTooMuchTime = docSnap['spend_too_much_time']?? '';
        });
        _spendTooMuchTimeController.text = _spendTooMuchTime;
      }
    }
  }

  //pets shared preference
  String _pets = '';
  final _petsController = TextEditingController();

  Future<void> _savePets(String pets) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'pets': pets}, SetOptions(merge: true));
      setState(() {
        _pets = pets;
      });
      _petsController.text = pets;
    }
  }

  Future<void> _loadPets() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _pets = docSnap['pets']?? '';
        });
        _petsController.text = _pets;
      }
    }
  }

  //text shared preference
  String _text = '';
  final _textController = TextEditingController();

  Future<void> _saveText(String text) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.set({'about': text}, SetOptions(merge: true));
      setState(() {
        _text = text;
      });
      _textController.text = text;
    }
  }

  Future<void> _loadText() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user!= null) {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        setState(() {
          _text = docSnap['about']?? '';
        });
        _textController.text = _text;
      }
    }
  }


  @override
  void initState() {
    super.initState();
    _loadImageFromFirestore();
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
          onTap: () async{
            // Save all the data to shared preferences
            if (_image != null) {
              await _uploadImageToFirebaseStorage(_image!);
            }
            await _saveSchoolName(_schoolcontroller.text);
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
                      child: _image != null
                          ? Image.network(_imageUrl!)
                          : CircleAvatar(
                        radius: constraints.maxWidth * 0.2,
                        backgroundColor: Colors.black,
                        child: const Text(
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
                                decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.school)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.work)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Text(
                                  _work.isEmpty? "My work" : _work,
                                  style: const TextStyle(fontSize: 16),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.map)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _address.isEmpty? "Where live" : _address,
                                  style: const TextStyle(fontSize: 16),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.pin)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _uselessSkill.isEmpty? "My most useless skill" : _uselessSkill,
                                  style: const TextStyle(fontSize: 16),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.chrome_reader_mode_outlined)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _biographyTitle.isEmpty? "My biagraphy title would be" : _biographyTitle,
                                  style: const TextStyle(fontSize: 16),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.alarm)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _spendTooMuchTime.isEmpty? "I Spend too much time" : _spendTooMuchTime,
                                  style: const TextStyle(fontSize: 16),
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
                              decoration: const InputDecoration(
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
                          const Column(
                            children: [
                              Icon(Icons.pets)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children:[
                                Text(
                                  _pets.isEmpty? "Pets" : _pets,
                                  style: const TextStyle(fontSize: 16),
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
                          decoration: const InputDecoration(
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