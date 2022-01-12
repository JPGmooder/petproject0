import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petproject0/constants/strings.dart';

class CheckEmailProvider {
  static Future<void> checkContaints(String email) async =>
      FirebaseFirestore.instance.collection(firestoreUserCollection).where((user) => print(user));
}
