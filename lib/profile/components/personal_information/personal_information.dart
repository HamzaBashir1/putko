import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  //preferred first name shred preference
  final _preferredFirstNameController = TextEditingController();
  String _preferredFirstName = '';

  Future<void> _savePreferredFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('preferred_first_name', _preferredFirstName);
  }

  Future<void> _loadPreferredFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('preferred_first_name');
    setState(() {
      _preferredFirstName = name?? ''; // Set the default value to an empty string if no name is found
    });
  }

  //legal name share preference
  String _legalFirstName = 'Hamza';
  String _legalLastName = 'Bashir';
  final _legalFirstNameController = TextEditingController();
  final _legalLastNameController = TextEditingController();

  Future<void> _saveLegalName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('legal_first_name', _legalFirstName);
    prefs.setString('legal_last_name', _legalLastName);
  }

  Future<void> _loadLegalName() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('legal_first_name');
    final lastName = prefs.getString('legal_last_name');
    setState(() {
      _legalFirstName = firstName?? ''; // Set the default value to an empty string if no name is found
      _legalLastName = lastName?? ''; // Set the default value to an empty string if no name is found
    });
  }

  //number shared preference
  String _phoneNumber = '';


  _loadPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phoneNumber = prefs.getString('phoneNumber')?? '';
    });
  }

  _savePhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', phoneNumber);
  }

  //address
  String _street = '';
  String _city = '';
  String _state = '';
  String _zipCode = '';
  String _address = '';

  _loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _street = prefs.getString('street') ?? '';
      _city = prefs.getString('city') ?? '';
      _state = prefs.getString('state') ?? '';
      _zipCode = prefs.getString('zipCode') ?? '';
      _address = '$_street, $_city, $_state, $_zipCode';
    });
  }

  _saveAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('street', _street);
    prefs.setString('city', _city);
    prefs.setString('state', _state);
    prefs.setString('zipCode', _zipCode);
  }

  //emergency number
  String _emergencyContact = 'Not Provided';
  final _nameController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  _loadEmergencyContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emergencyContact = prefs.getString('emergencyContact')?? 'Not Provided';
    });
  }

  _saveEmergencyContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('emergencyContact', 'Name: ${_nameController.text}, Relationship: ${_relationshipController.text}, Email: ${_emailController.text}, Phone: ${_phoneController.text}');
  }


  @override
  void initState() {
    super.initState();

    _loadLegalName();
    _loadPreferredFirstName();
    _loadPhoneNumber();
    _loadAddress();
    _loadEmergencyContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              const Row(
                children: [
                  Text("Personal info",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                ],
              ),
          
              const SizedBox(
                height: 40,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  children: [
                    Text("Legal Name", style: TextStyle(fontSize: 18),),
                    Text("$_legalFirstName $_legalLastName")
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _legalFirstNameController.text = _legalFirstName;
                    _legalLastNameController.text = _legalLastName;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Legal name'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Your calendar may be blocked for up to an hour while we verify your new legal name.'),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _legalFirstNameController,
                                decoration: const InputDecoration(
                                  labelText: 'First name on ID',
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _legalLastNameController,
                                decoration: const InputDecoration(
                                  labelText: 'Last name on ID',
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_legalFirstNameController.text.isNotEmpty && _legalLastNameController.text.isNotEmpty) {
                                  // Handle save and continue action
                                  setState(() {
                                    _legalFirstName = _legalFirstNameController.text;
                                    _legalLastName = _legalLastNameController.text;
                                  });
                                  await _saveLegalName(); // Save the name locally
                                  Navigator.of(context).pop();
                                } else {
                                  // Show a message to the user to enter a name
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please enter a legal name'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Save and continue'),
                            ),
                          ],
                        );
                      },
                    );
                  },
              child: const Column(
                children: [
                  Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline),),
                ],
              ),
            )
          ],
        ),
              const SizedBox(
                height: 20,
              ),
          
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Preferred first name", style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        Text(_preferredFirstName?? '') // Show the saved name
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _preferredFirstNameController.text = _preferredFirstName?? ''; // Set the saved name to the text field
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Preferred first name'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    "The first name or business name that you'd like to go by on Putko."),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _preferredFirstNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Preferred first name(optional)',
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        if (_preferredFirstNameController.text.isNotEmpty) {
                                          // Handle save and continue action
                                          final name = _preferredFirstNameController.text;
                                          // Save the name and close the dialog
                                          setState(() {
                                            _preferredFirstName = name;
                                          });
                                          await _savePreferredFirstName(); // Save the name locally
                                          Navigator.of(context).pop();
                                        } else {
                                          // Show a message to the user to enter a name
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Please enter a preferred first name'),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Column(
                      children: [
                        Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline),),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
          
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Phone number",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                      Text(
                        _phoneNumber,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Edit Phone Number',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                ),
                                content: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    _savePhoneNumber(value);
                                    setState(() {
                                      _phoneNumber = value;
                                    });
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.05,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.05,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
          
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                        Text(
                          "Hamzabashir02001@gmail.com",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
          
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address", style: TextStyle(fontSize: 18),),
                        Text(_address, overflow: TextOverflow.ellipsis,),

                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edit Address'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'Street',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _street = value;
                                      });
                                    },
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'City',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _city = value;
                                      });
                                    },
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'State',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _state = value;
                                      });
                                    },
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'Zip Code',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _zipCode = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _saveAddress();
                                    setState(() {
                                      _address = '$_street, $_city, $_state, $_zipCode';
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Column(
                        children: [
                          Text("Edit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.underline),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
          
              const Divider(
                thickness: 1,
                height: 20,
                color: Colors.grey,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Emergency contact", style: TextStyle(fontSize: 18),),
                        Text(_emergencyContact, overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Edit Emergency Contact'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _nameController,
                                          decoration: const InputDecoration(
                                            labelText: 'Name',
                                          ),
                                        ),
                                        TextField(
                                          controller: _relationshipController,
                                          decoration: const InputDecoration(
                                            labelText: 'Relationship',
                                          ),
                                        ),
                                        TextField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            labelText: 'Email',
                                          ),
                                        ),
                                        TextField(
                                          controller: _phoneController,
                                          decoration: const InputDecoration(
                                            labelText: 'Phone',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _saveEmergencyContact();
                                        setState(() {
                                          _emergencyContact = 'Name: ${_nameController.text}, Relationship: ${_relationshipController.text}, Email: ${_emailController.text}, Phone: ${_phoneController.text}';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text("Edit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, decoration: TextDecoration.underline),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),
          

          
            ],
          ),
        ),
      ),
    );
  }
}


