import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailerapp/LogInAndRegistrationPage/log_in_and_registration.dart';
import 'package:retailerapp/WebClippler/main_page_paint.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00222e),
        body: CustomPaint(
          painter: MainPagePaint(),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50.0),
                      child: Image.asset("assets/logo.png",
                          width: 100, height: 100)),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 50),
                    child: Text(
                      "CHOOSE YOUR ACCOUNT CATEGORY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  LonInAnDRegistration(
                    text: "CUSTOMER\nLOGIN",
                    color: Colors.white,
                    left: 50,
                    right: 50,
                    personCategory: 'Customer',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LonInAnDRegistration(
                    text: "RETAILER\nPARTNER LOGIN",
                    color: Colors.orange,
                    left: 30,
                    right: 30,
                    personCategory: "Retailer",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LonInAnDRegistration(
                    text: "WHOLESALER\nLOGIN",
                    color: Colors.lightBlue,
                    left: 42,
                    right: 42,
                    personCategory: 'Wholesale',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Colors.lightBlue
//Colors.orange
//Colors.white
class LonInAnDRegistration extends StatelessWidget {
  const LonInAnDRegistration(
      {Key? key,
      required this.text,
      required this.color,
      required this.left,
      required this.right,
      required this.personCategory})
      : super(key: key);
  final String text;
  final Color color;
  final double left;
  final double right;
  final String personCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.only(top: 5, right: right, left: left, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: color)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LonInAnDRegistrationPage(
                        text: personCategory,
                      )));
        });
  }
}
