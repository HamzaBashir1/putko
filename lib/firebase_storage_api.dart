import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File image) async {
    final ref = _storage.ref('images/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = ref.putFile(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }
}