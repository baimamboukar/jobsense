import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signUp({
    required String email,
    required String password,
    required UserModel user,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user document in Firestore
      await _createUserDocument(user);

      return null; // Success, return null for no error
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  Future<void> _createUserDocument(UserModel user) async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(user.toMap());
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success, return null for no error
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserModel?> getUserData() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser != null) {
      try {
        final userDoc =
            await _firestore.collection('users').doc(firebaseUser.uid).get();

        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data()!);
        }
      } catch (e) {
        print('Error fetching user data: $e');
      }
    }

    return null;
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> completeProfile(String userId, UserModel user) async {
    await _firestore.collection('users').doc(userId).set(user.toMap());
  }
}
