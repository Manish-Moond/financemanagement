import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:financemanagement/core/errors/failure.dart';
import 'package:financemanagement/src/data/models/user_model.dart';
import 'package:financemanagement/src/domain/entities/transaction_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseDataSource {
  final SharedPreferences prefs;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseDataSource({
    required this.prefs,
  });

  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final user =
            UserModel(uuid: firebaseUser.uid, email: firebaseUser.email!);

        // Storing data to local
        await prefs.setBool("isLoggedInFin", true);
        final userJson = jsonEncode(user.toJson());
        await prefs.setString('suer', userJson);
        return Right(user);
      } else {
        return Left(Failure("Invalid email and password"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithEmailAndPasswordFailure(e.code));
    }
  }

  Future<Either<Failure, UserModel>> signup(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User firebaseUser = userCredential.user!;
      final UserModel user =
          UserModel(email: firebaseUser.email!, uuid: firebaseUser.uid);

      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      usersCollection.doc(firebaseUser.uid).set({
        'userId': firebaseUser.uid,
      }).then((value) {
        print('User ID stored successfully!');
      }).catchError((error) {
        print('Failed to store user ID: $error');
      });

      // storing user to local
      await prefs.setBool("isLoggedInFin", true);
      final userJson = jsonEncode(user.toJson());
      await prefs.setString('user', userJson);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(SignUpWithEmailAndPasswordFailure.fromCode(e.code));
    }
  }

  Future<Either<Failure, String>> addTransaction(
      TransactionEntity transaction) async {
    try {
      CollectionReference users = firestore.collection('transactions');
      // await users.add();
      return const Right("Success");
    } catch (e) {
      return Left(FireStoreFailure(e.toString()));
    }
  }
}
