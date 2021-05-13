import 'package:LoanEligibilityChecker/LoginPage.dart';
import 'package:LoanEligibilityChecker/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ContactUs.dart';
import 'LoanChecker.dart';
import 'MyProfile.dart';
import 'const.dart';
import 'background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AuthenticationService.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

class DrawerLoan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 40.0),
              height: 100.0,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('MENU', textAlign: TextAlign.center),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: loginpageTextColor,
                ),
              ),
            ),
            Listcontain(
                pagename: 'My Profile',
                tapdeets: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyProfile()));
                }),
            Spacing(),
            Listcontain(
                pagename: 'Loan Eligibility Checker',
                tapdeets: () {
                  // Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoanChecker()));
                }),
            Spacing(),
            Listcontain(
                pagename: 'Contact Us',
                tapdeets: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ContactUs()));
                }),
            Spacing(),
            Listcontain(
                pagename: 'Sign Out',
                tapdeets: () {
                  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                  _signOut() async {
                    await _firebaseAuth.signOut();
                    Navigator.popUntil(context, ModalRoute.withName(AuthenticationWrapper().toString()));
                    

                    // await _googleSignIn.signOut();
                  }

                  _signOut();
                  // Navigator.of(context)
                  //     .popUntil(ModalRoute.withName("/LoginPage"));
                  // runApp(MyApp());

                  // Navigator.of(context, rootNavigator: true).pop();
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => LoginPage()));
                }),
          ],
        ),
      ),
    );
  }
}

BoxDecoration boxDesign() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(80),
      gradient: LinearGradient(colors: [
        Color.fromRGBO(13, 148, 251, 1),
        Color.fromRGBO(13, 148, 251, .6),
      ]));
}

class Spacing extends StatelessWidget {
  const Spacing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.0,
    );
  }
}

class Listcontain extends StatelessWidget {
  const Listcontain({Key key, @required this.pagename, @required this.tapdeets})
      : super(key: key);
  final String pagename;
  final Function tapdeets;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      // width: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Color(0xFFFFFFFF),
      ),
      child: ListTile(
        title: Text(pagename),
        onTap: tapdeets,
      ),
    );
  }
}

class Startbar extends StatelessWidget {
  const Startbar({
    Key key,
    @required this.child,
    @required this.appbartext,
  }) : super(key: key);
  final String appbartext;
  // final Widget content;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              iconTheme: IconThemeData(color: loginpageTextColor),
              title: new Text(
                appbartext,
                style: TextStyle(color: darkblue),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                // Set the transparency here
                canvasColor: Colors
                    .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
              ),
              child: DrawerLoan(),
            ),
            body: Background(child: child),
          )
        ],
      ),
    );
  }
}

// -------------------------------------------------------------------------
//
//
//

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyProfile()),
            );
          },
          child: Icon(
            Icons.account_circle,
            color: loginpageTextColor,
            size: 35,
          ),
        ),
        TextButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoanChecker()),
              );
            },
            child: Image.asset(
              "assets/icons/loan.png",
              width: 33,
              color: loginpageTextColor,
            )),
        TextButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUs()),
            );
          },
          child: Icon(
            Icons.add_ic_call_rounded,
            color: loginpageTextColor,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details(
      {Key key, @required this.name, @required this.size, @required this.align})
      : super(key: key);
  final String name;
  final double size;
  final align;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey[850]),
        ),
      ),
      alignment: align,
      margin: EdgeInsets.only(right: 40, top: 30, left: 40),
      child: Text(
        name,
        style: GoogleFonts.robotoSlab(
          color: darkblue,
          fontSize: size,
        ),
        // TextStyle(
        //   color: Colors.black,
        // ),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    this.hint,
    @required this.controllerVar,
    @required this.label,
    @required this.bl,
    Key key,
  }) : super(key: key);
  final String label;
  final bool bl;
  final String hint;
  final TextEditingController controllerVar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: controllerVar,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
            ),
            obscureText: bl,
          ),
        ),
      ],
    );
  }
}
