import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:http/http.dart' as http;

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String userId = (FirebaseAuth.instance.currentUser).uid;

    return FutureBuilder(
      future: _firestore.collection('users').doc(userId).get(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var userdata = snapshot.data.data();
        String name = userdata['Name'];
        String emailid = userdata['Email Id'];
        String accbal = userdata['Account Balance'];
        String inc = userdata['Applicants income'];
        String age = userdata['Age'];
        String appstatus = userdata['Apartment Status'];
        String selfemp = userdata['Are they self employed'];
        String coinc = userdata['Co-applicants income'];
        String empdur = userdata['Currently employed from how long'];
        String edulevel = userdata['Education Level'];
        String gender = userdata['Gender'];
        String marry = userdata['Marriage Status'];
        String dependants = userdata['Number of Dependant'];
        String ccwus = userdata['Number of credit cards at this bank'];
        String ccwothers = userdata['Number of credit cards with other banks'];
        String occupation = userdata['Occupation'];
        String proparea = userdata['Property Area'];
        String inr = userdata['Savings in INR'];
        String pfp = userdata['Pfp'];
        // bool isEmpty;
        if (!snapshot.hasData || snapshot.data.data().isEmpty) {
          return Center(child: CircularProgressIndicator());
        } //CIRCULAR INDICATOR
        else {
          return Scaffold(
            body: Startbar(
              appbartext: 'My Profile',
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.0),
                      width: 150,
                      height: 150,
                      // child:
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            pfp,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Details(
                      name: 'Name: ' + name,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Email Id: ' + emailid,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Account Balance: ' + accbal,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Income: ' + inc,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Age: ' + age,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Apartment Status: ' + appstatus,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Self Employed: ' + selfemp,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Co-Applicant\s Income: ' + coinc,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Employment duration: ' + empdur,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Education Level: ' + edulevel,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Gender: ' + gender,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Marriage Status: ' + marry,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Number of Dependants: ' + dependants,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Number of credit cards at this bank: ' + ccwus,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Number of credit cards with other banks: ' +
                          ccwothers,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Occupation: ' + occupation,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Property Area: ' + proparea,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                    Details(
                      name: 'Savings in INR: ' + inr,
                      size: 22.5,
                      align: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        }
      },
    );
  }
}
