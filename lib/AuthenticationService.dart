import 'package:LoanEligibilityChecker/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();
  _signOut() async {
    await FirebaseAuth.instance.signOut();
    
    return new LoginPage();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'SignedUp';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

//, String name, String gender, String married, String dependants, String education, String selfEmployed, String applicantIncome, String coapplicantIncome, String propertyArea, String accountBalance, String savings, String lenOfCurrentEmployment, String age, String noOfCreditCardsSameBank, String typeOfApt, String noOfCreditCardsOtherBanks, String occupation