import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'LoanChecker.dart';
class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

const mobile = 'tel: +91 8369423234';
const email =
    'mailto:meetgandhi412@gmail.com?subject=Loan Eligibility Calculator=New%20plugin';
const sms = 'sms:8369423234';
const whatsapp = 'https://wa.link/f32ofr';

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Startbar(
        appbartext: 'Contact Us',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.lightBlueAccent.shade700),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(
                    'CALL US',
                    style: GoogleFonts.robotoSlab(
                      color: Color(0xFF000099),
                      fontSize: 25,
                    ),
                    // TextStyle(
                    //   color: Colors.black,
                    // ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: _launchCall,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: boxDesign(),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "CLICK ME",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.lightBlueAccent.shade700),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(
                    'MAIL US',
                    style: GoogleFonts.robotoSlab(
                      color: Color(0xFF000099),
                      fontSize: 25,
                    ),
                    // TextStyle(
                    //   color: Colors.black,
                    // ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: _launchEmail,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: boxDesign(),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "CLICK ME",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.lightBlueAccent.shade700),
                    ),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(
                    'TEXT US',
                    style: GoogleFonts.robotoSlab(
                      color: Color(0xFF000099),
                      fontSize: 25,
                    ),
                    // TextStyle(
                    //   color: Colors.black,
                    // ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: _launchSms,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: boxDesign(),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "CLICK ME",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: Colors.lightBlueAccent.shade700),
                ),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 2,
              ),
              child: Text(
                'CHAT WITH US',
                style: GoogleFonts.robotoSlab(
                  color: Color(0xFF000099),
                  fontSize: 25,
                ),
                // TextStyle(
                //   color: Colors.black,
                // ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RaisedButton(
                onPressed: _launchWhatsapp,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: boxDesign(),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "CLICK ME",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  void _launchCall() async => await canLaunch(mobile)
      ? await launch(mobile)
      : throw 'Could not launch $mobile';
  void _launchSms() async =>
      await canLaunch(sms) ? await launch(sms) : throw 'Could not launch $sms';
  void _launchEmail() async => await canLaunch(email)
      ? await launch(email)
      : throw 'Could not launch $email';
  void _launchWhatsapp() async => await canLaunch(whatsapp)
      ? await launch(whatsapp)
      : throw 'Could not launch $whatsapp';
}
