import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moza/src/models/auth_repository.dart';


class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<void> registerUser(String email, String password, String firstName, String lastName) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseAuth.instance.currentUser?.reload(); 
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

      await userDoc.set({
        'uid': user.uid,
        'displayName': '$firstName $lastName',
        'firstName': firstName,
        'lastName': lastName,
        'email': user.email,
        'photoURL': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user != null && !user.emailVerified) {
      await FirebaseAuth.instance.signOut(); 
      throw FirebaseAuthException(
        code: 'email-not-verified',
        message: 'Please verify your email before logging in.',
      );
    }
  }

  Future<void> addUserToFirestore() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();

    if (!docSnapshot.exists) {
      final displayName = user.displayName ?? '';
      final nameParts = displayName.split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : '';
      final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      await userDoc.set({
        'uid': user.uid,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName,
        'email': user.email,
        'photoURL': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }
  
  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
  
  @override
  Future<void> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize();

    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;

    if (user != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        await userDoc.set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
          'photoURL': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }
  
  @override
Future<void> sendVerificationEmail() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
  }
}
}