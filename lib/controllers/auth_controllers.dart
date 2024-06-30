import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthControllers extends GetxController {
  Future<UserCredential?> loginMethod({
    required email,
    required password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (exp) {
      VxToast.show(Get.context!, msg: exp.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signUpMethod({
    required email,
    required password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (exp) {
      VxToast.show(Get.context!, msg: exp.toString());
    }

    return userCredential;
  }

  storeUserData({
    required uid,
    required email,
    required displayName,
    required phoneNumber,
    required photoURL,
  }) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser?.uid);
    store.set({
      'uid': uid,
      'email': email,
      'name': displayName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoURL,
      'createdAt': Timestamp.now(),
    });
  }

  signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (exp) {
      VxToast.show(Get.context!, msg: exp.toString());
    }
  }
}
