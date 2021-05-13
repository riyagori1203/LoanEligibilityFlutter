import 'package:LoanEligibilityChecker/AuthenticationService.dart';
import 'package:LoanEligibilityChecker/MyProfile.dart';
import 'package:LoanEligibilityChecker/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
        // initialData: LoginPage(),
        create: (context) => context.read<AuthenticationService>().authStateChange,
      ),
      ],
      
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key,}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null){
      print(firebaseUser);
      return MyProfile();
      
    } else{
    print(firebaseUser);
    return LoginPage();
    }
  }
}
