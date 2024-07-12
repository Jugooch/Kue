import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kue/models/models.dart';


class UserDao {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Method to get the user card data from the user model
  UserCardModel getUserCard(UserModel user) {
    return UserCardModel.fromUserModel(user);
  }

  // Example method to get user data from a data source (e.g., Firebase)
  Future<List<UserCardModel>> getUserCardsFromDataSource() async {
    // This is a placeholder for fetching data from your data source
    // Replace this with your actual data fetching logic
    List<UserModel> users = await fetchUsersFromFirebase();

    // Convert each UserModel to UserCardModel
    return users.map((user) => UserCardModel.fromUserModel(user)).toList();
  }

  Future<List<UserModel>> fetchUsersFromFirebase() async {
    // Placeholder for fetching data from Firebase
    // Implement your Firebase fetching logic here
    return [];
  }

  ///////////////////////////////////////////////////////////////////////////////////
  //Methods for Signing up, out, and in
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signUp(String email, String password, UserModel userModel) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Sign in the user
      User? user = await signInWithEmailAndPassword(email, password);
      if (user == null) {
        print("Error signing in after registration");
        return;
      }

      // Upload images
      List<String> downloadUrls = await _uploadImages(userModel.images, email);

      // Add user data to Firestore using the UID as the document ID
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': userModel.firstName,
        'lastName': userModel.lastName,
        'age': userModel.age,
        'email': userModel.email,
        'password': userModel.password,
        'interests': userModel.interests,
        'images': downloadUrls,
        'gender': userModel.gender,
        'sexualOrientation': userModel.sexualOrientation,
        'preference': userModel.preference,
      });

      print('User registered and data added to Firestore');
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }

  Future<List<String>> _uploadImages(List<String> imagePaths, String email) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    List<String> downloadUrls = [];

    for (String imagePath in imagePaths) {
      File file = File(imagePath);
      Reference ref = storage.ref().child('user_images/$email/${file.uri.pathSegments.last}');
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }

    return downloadUrls;
  }
  ///////////////////////////////////////////////////////////////////////////////////
}
