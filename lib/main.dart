import 'package:flutter/material.dart';
import 'package:retailerapp/Components/components.dart';

import 'MainPage/main_page.dart';
import 'OTP/otp_page.dart';

void main() {
  runApp(Retailer());
}

class Retailer extends StatelessWidget {
  const Retailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Retailer And Customer",
      theme: ThemeData(primaryColor: Color(0xFF00222e)),
      home: DhakaChoice(),
    );
  }
}

class DhakaChoice extends StatelessWidget {
  const DhakaChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: darkBlue,
          appBar: AppBar(
            backgroundColor: darkBlue,
            title: Text(
              "Dhaka Choice",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            centerTitle: true,
            leading: Text(""),
          ),
          body: MainPage()),
    );
  }
}
//MainPage()
