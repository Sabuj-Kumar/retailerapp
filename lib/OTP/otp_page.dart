import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:retailerapp/Components/components.dart';
import 'package:retailerapp/LogInAndRegistrationPage/log_in.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String verification = "";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: offWhite,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Code Verification",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dehaze,
              textDirection: TextDirection.rtl,
            ),
          ),
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Align(
              child: Image.asset(
                "assets/OTP.png",
                height: 200,
                width: 200,
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "OTP has been send please enter it bellow",
              style: TextStyle(
                  color: darkBlue, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),
            OtpTextField(
              numberOfFields: 5,
              enabledBorderColor: darkBlue,
              focusedBorderColor: Colors.deepOrange,
              showFieldAsBox: false,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                setState(() {
                  verification = verificationCode;
                });

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text("Verification Code is $verificationCode"),
                      );
                    });
              },
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  primary: Colors.deepOrange,
                ),
                onPressed: () {
                  if (verification.isNotEmpty && verification.length == 5) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogIN(
                                  text: widget.text,
                                )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid OTP"),
                    ));
                  }
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ))
          ],
        )),
      ),
    );
  }
}
