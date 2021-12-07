import 'package:flutter/material.dart';
import 'package:retailerapp/Components/components.dart';
import 'package:retailerapp/LogInAndRegistrationPage/customer_registration.dart';
import 'package:retailerapp/LogInAndRegistrationPage/retailer_registration.dart';
import 'package:retailerapp/LogInAndRegistrationPage/log_in.dart';
import 'package:retailerapp/LogInAndRegistrationPage/whole_sale_registration.dart';
import 'package:retailerapp/MainPage/main_page.dart';

class LonInAnDRegistrationPage extends StatefulWidget {
  const LonInAnDRegistrationPage({Key? key, required this.text})
      : super(key: key);
  final String text;
  @override
  _LonInAnDRegistrationPage createState() => _LonInAnDRegistrationPage();
}

class _LonInAnDRegistrationPage extends State<LonInAnDRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkBlue,
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkBlue)),
                    child: Text(
                      "Back",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Image.asset("assets/logo.png",
                        width: 100, height: 100)),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      "Dhaka Choice",
                      style: TextStyle(
                          letterSpacing: 2.0,
                          wordSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 1),
                  child: Center(
                    child: Opacity(
                      opacity: 0.8,
                      child: Text(
                        "Just Order and Relax",
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 55, bottom: 10, right: 55),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 2, color: Colors.orange)),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogIN(
                                    text: widget.text,
                                  )));
                    }),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 45, bottom: 10, right: 45),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => widget.text == "Customer"
                                  ? CustomerRegistration()
                                  : widget.text == "Retailer"
                                      ? RetailerRegistration()
                                      : WholeSaleRegistration()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
