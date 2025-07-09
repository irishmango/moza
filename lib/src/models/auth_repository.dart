import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String pw);
  Future<void> registerUser(String email, String password, String firstName, String lastName);
  Future<void> signOut();
  Future<void> sendVerificationEmail();
  Stream<User?> authStateChanges();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signInWithGoogle();
}