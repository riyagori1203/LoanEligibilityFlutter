import 'package:flutter/material.dart';

const appBarandButtonColor = Color(0xFF1831D5);
const bgImg = AssetImage("asset/images/appBg2.png");
const loanImage = 'asset/images/appimageLoan.jpeg';
const profileImage = AssetImage('asset/images/Meet_Temp_pfp.png');
const shadowColor = Color(0xFF0000FF);
const textColor = Color(0xFFE6E6FF);
const loginpageTextColor = Color(0xFF2661FA);
// const IconData arrow_forward = IconData(0xe5af, fontFamily: 'MaterialIcons', matchTextDirection: true);
const darkblue = Color(0xFF180e58);

//signin
TextEditingController emailController = TextEditingController();
TextEditingController dobController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String dob;
String dt, mnth, yr;
String dobText = 'Click here to select DOB';


final TextEditingController spnameController = TextEditingController();
final TextEditingController spageController = TextEditingController();
final TextEditingController spgenderController = TextEditingController();
final TextEditingController spmarryController = TextEditingController();
final TextEditingController spdependantsController = TextEditingController();
final TextEditingController speducationController = TextEditingController();
final TextEditingController spselfemployController = TextEditingController();
final TextEditingController spyourincomeController = TextEditingController();
final TextEditingController spcoincomeController = TextEditingController();
final TextEditingController sppropertyareaController = TextEditingController();
final TextEditingController spaccbalController = TextEditingController();
final TextEditingController spsavingsController = TextEditingController();
final TextEditingController spemploydurationController = TextEditingController();
final TextEditingController spccwusController = TextEditingController(); //ccwus = credit cards with us
final TextEditingController spccwothersController = TextEditingController(); // see upar and samaj jao khudse
final TextEditingController spaptstatusController = TextEditingController();
final TextEditingController spoccupationController = TextEditingController();
final TextEditingController spemailController = TextEditingController();
final TextEditingController sppasswordController = TextEditingController();
final TextEditingController lcloanAmtController = TextEditingController();
final TextEditingController lcloanDurationController = TextEditingController();