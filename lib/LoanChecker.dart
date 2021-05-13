import 'dart:convert';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'MyProfile.dart';
import 'package:http/http.dart' as http;
import 'const.dart';

class LoanChecker extends StatefulWidget {
  @override
  _LoanCheckerState createState() => _LoanCheckerState();
}

class _LoanCheckerState extends State<LoanChecker> {
  var uriResponse1;
  var intaccbal;
  var intinr;
  var intempdur;
  var intage;
  var intappstatus;
  var intccwus;
  var intaocc;
  var intdep;
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    String userId = (FirebaseAuth.instance.currentUser).uid;

    return FutureBuilder(
      future: _firestore.collection('users').doc(userId).get(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var userdata = snapshot.data.data();
        String loanStatus = userdata['Loan Status'];
        String accbal = userdata['Account Balance'];
        intaccbal = int.tryParse(accbal);
        if (intaccbal > 0 && intaccbal < 3) {
          intaccbal = 3;
        }
        if (intaccbal == 0) {
          intaccbal = 0;
        }
        if (intaccbal > 2000) {
          intaccbal = 4;
        }
        String inc = userdata['Applicants income'];

        var intinc = int.parse(inc);
        String age = userdata['Age'];
        intage = int.parse(age);
        //'Apartment Status':{'Free apartment':1,'Rented Flat':2,'Own an apartment':3}}
        String appstatus = userdata['Apartment Status'];

        if (appstatus == 'Free apartment') {
          intappstatus = 1;
        }
        if (appstatus == 'Rented Flat') {
          intappstatus = 2;
        }
        if (appstatus == 'Own an apartment') {
          intappstatus = 3;
        }

        var intapp = int.parse("1");
        String selfemp = userdata['Are they self employed'];
        String coinc = userdata['Co-applicants income'];
        String empdur = userdata['Currently employed from how long'];
        intempdur = int.parse(empdur);
        if (intempdur <= 1) {
          intempdur = 2;
        }
        if (intempdur > 1 && intempdur < 4) {
          intempdur = 3;
        }
        if (intempdur > 4 && intempdur < 7) {
          intempdur = 4;
        }
        if (intempdur >= 7) {
          intempdur = 5;
        }
        if (intempdur == 0) {
          intempdur = 1;
        }

        String edulevel = userdata['Education Level'];

        String gender = userdata['Gender'];
        String marry = userdata['Marriage Status'];
        String dependants = userdata['Number of Dependant'];
        intdep = int.parse(dependants);
        if (intdep >= 0 && intdep <= 2) {
          intdep = 2;
        }
        if (intdep > 3) {
          intdep = 1;
        }
        String ccwus = userdata['Number of credit cards at this bank'];
        intccwus = int.parse(ccwus);
        if (intccwus == 2 || intccwus == 3) {
          intccwus = 2;
        }
        if (intccwus == 4 || intccwus == 5) {
          intccwus = 3;
        }
        if (intccwus >= 6) {
          intccwus = 4;
        }
        String ccwothers = userdata['Number of credit cards with other banks'];
        var intccwothers = int.parse(ccwothers);
        //'Occupation':{'Unemployed':1,'Unskilled Employee':2,'Skilled Employee':3,'Self Employed':4
        String occupation = userdata['Occupation'];

        if (occupation == 'Unemployed') {
          intaocc = 1;
        }
        if (occupation == 'Unskilled Employee') {
          intaocc = 2;
        }
        if (occupation == 'Skilled Employee') {
          intaocc = 3;
        }
        if (occupation == 'Self Employed') {
          intaocc = 4;
        }

        String proparea = userdata['Property Area'];
        var intcproparea = int.parse(proparea);
        String inr = userdata['Savings in INR'];
        intinr = int.parse(inr);
        if (intinr >= 100 && intinr < 500) {
          intinr = 3;
        }
        if (intinr < 100) {
          intinr = 2;
        }
        if (intinr >= 500 && intinr < 1000) {
          intinr = 4;
        }
        if (intinr >= 1000) {
          intinr = 5;
        }
        if (intinr == 0) {
          intinr = 1;
        }
        String pfp = userdata['Pfp'];
        String loanStatusvar = loanStatus;
        int i = userdata['Has applied'];

        var presubmit;
        if (i == 1) {
          presubmit = Column(
            children: [
              Container(
                child: Details(
                  name: 'Loan Status: ' +
                      uriResponse1 +
                      '                                     ' +
                      loanStatusvar,
                  size: 22.5,
                  align: Alignment.topLeft,
                ),
              ),
              IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh Loan Status',
                  onPressed: () {
                    setState(() {
                      loanStatusvar = loanStatus;
                    });
                  }),
            ],
          );
        }
        if (i != 1) {
          presubmit = Column(
            children: [
              Image.asset(
                'assets/images/check.png',
                width: 250,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 00, right: 40, left: 40),
                // margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: lcloanAmtController,
                  decoration:
                      InputDecoration(labelText: "Enter the Loan Amount"),
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 00, right: 20, left: 20),
                // margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: lcloanDurationController,
                  decoration: InputDecoration(
                      labelText: "Enter the Loan Duration in days"),
                ),
              ),
              Container(
                width: 150,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                child: RaisedButton(
                  onPressed: () async {
                    User user = _auth.currentUser;
                    // String userId = (FirebaseAuth.instance.currentUser).uid;
                    await _firestore.collection("users").doc(user.uid).update({
                      'Loan Amount': lcloanAmtController.text,
                      'Loan Duration': lcloanDurationController.text,
                      'Loan Status': 'Waiting for approval',
                      'Has applied': 1,
                    });
                    setState(() {
                      // Navigator.push(
                      // context, MaterialPageRoute(builder: (_) => Loader()));
                      // Navigator.pop(context);
                      // i++;
                      i = 1;
                      loanStatusvar = loanStatus;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    // width: size.width * 0.5,
                    decoration: boxDesign(),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Scaffold(
          body: Startbar(
              appbartext: 'Loan Eligibility Checker',
              child: Container(
                margin: EdgeInsets.only(top: 100),
                // width: 250,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      presubmit,
                    ],
                  ),
                ),
              )),
          bottomNavigationBar: BottomNavigation(),
        );
      },
    );
  }

  /*Future apicallcredit() async {
    var client = http.Client();
    try {
      uriResponse1 =
          await client.post(Uri.parse('http://127.0.0.1:2363/credit'),
              // ignore: equal_elements_in_set
              //data=toJson(1, 24, 2, 1987, 1, 3, 21, 3, 1, 1, 2, 2);

              body: json.encode({1, 24, 2, 1987, 1, 3, 21, 3, 1, 1, 2, 2}));
    } finally {
      client.close();
    }
  }*/
  Future apicallcredit() async {
    String url = 'http://127.0.0.1:8000/credit';
    Map data = {
      'Account Balance': intaccbal,
      'Duration of Credit (month)': 0,
      'Payment Status of Previous Credit': 0,
      'Credit Amount': 1049,
      'Value Savings/Stocks': intinr,
      'Length of current employment': intempdur,
      'Age (years)': intage,
      'Concurrent Credits': 3,
      'Type of apartment': intappstatus,
      'No of Credits at this Bank': intccwus,
      'Occupation': intaocc,
      'No of dependents': intdep
    };

    print(await apiRequest(url, data));
  }

  Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }
  /*Future apicallcredit() async {
    Map data = {
  'Account Balance': intaccbal,
        'Duration of Credit (month)': 0,
        'Payment Status of Previous Credit': 0,
        'Credit Amount': 1049,
        'Value Savings/Stocks': intinr,
        'Length of current employment': intempdur,
        'Age (years)': intage,
        'Concurrent Credits': 3,
        'Type of apartment': intappstatus,
        'No of Credits at this Bank': intccwus,
        'Occupation': intaocc,
        'No of dependents': intdep
};

String body = json.encode(data);

http.Response response = await http.post( 
  url:'http://127.0.0.1:8000/credit',
  headers: {"Content-Type": "application/json"},
  body: body,
);
  
  }  */
}
