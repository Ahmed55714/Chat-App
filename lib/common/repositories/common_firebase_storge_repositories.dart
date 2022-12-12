// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final CommonFirebasesStoragePerositoryProvider =
    Provider((ref) => CommonFirebasesStoragePerository(
          firebaseStorage: FirebaseStorage.instance,
        ));

class CommonFirebasesStoragePerository {
  final FirebaseStorage firebaseStorage;

  CommonFirebasesStoragePerository({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
