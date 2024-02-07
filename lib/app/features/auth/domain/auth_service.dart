import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserModel> signUp({
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

      return user;
    } on FirebaseAuthException catch (e) {
      rethrow;
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

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // ignore: unused_local_variable
      final creds = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = await getUserData();
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserModel> getUserData() async {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser != null) {
      try {
        final userDoc =
            await _firestore.collection('users').doc(firebaseUser.uid).get();

        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data()!);
        }
      } catch (e) {
        throw Exception('Error fetching user data');
      }
    }
    throw Exception('Error fetching user data');
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> completeProfile(String userId, UserModel user) async {
    await _firestore.collection('users').doc(userId).set(user.toMap());
  }
}
