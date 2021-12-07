import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailerapp/BackButton/back_button.dart';
import 'package:retailerapp/Components/components.dart';
import 'package:retailerapp/Input/login_input.dart';
import 'package:retailerapp/LogInAndRegistrationPage/customer_registration.dart';
import 'package:retailerapp/LogInAndRegistrationPage/retailer_registration.dart';
import 'package:retailerapp/LogInAndRegistrationPage/whole_sale_registration.dart';
import 'package:retailerapp/NoGPS/not_gps_page.dart';
import 'package:retailerapp/WebClippler/clipper.dart';

class LogIN extends StatefulWidget {
  const LogIN({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  final formKey = GlobalKey<FormState>();
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text("Log In"),
        centerTitle: true,
        leading: BackButtons(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: lightWhite,
              width: width,
              height: height * 1.3,
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: darkBlue,
              width: width,
              height: (height) - 30,
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: height / 35,
              ),
              Image.asset(
                "assets/man.png",
                height: 100,
                width: 200,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 25,
                    ),
                    LogInInput(
                      inputType: TextInputType.phone,
                      prefix: Icons.account_circle,
                      hint: "Phone Number",
                      suffix: false,
                      nextOrDone: true,
                      obscured: false,
                    ),
                    LogInInput(
                      inputType: TextInputType.text,
                      prefix: Icons.lock_outline,
                      hint: "Password",
                      suffix: true,
                      nextOrDone: false,
                      obscured: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 38.0),
                          child: Transform.scale(
                            scale: 1.0,
                            child: Checkbox(
                              value: isCheck,
                              onChanged: (status) {
                                setState(() {
                                  isCheck = status!;
                                });
                              },
                              activeColor: darkBlue,
                              checkColor: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: EdgeInsets.only(
                              top: 10, left: 110, right: 110, bottom: 10),
                          textStyle: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Log In Successful')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GpsOff()));
                        }
                      },
                      child: const Text('Log In'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              " Create One.",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        widget.text == "Customer"
                                            ? CustomerRegistration()
                                            : widget.text == "Retailer"
                                                ? RetailerRegistration()
                                                : WholeSaleRegistration()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
