import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailerapp/BackButton/back_button.dart';
import 'package:retailerapp/Components/components.dart';
import 'package:retailerapp/Input/registration_input.dart';
import 'package:retailerapp/OTP/otp_page.dart';
import 'package:retailerapp/WebClippler/clipper_up_to_down_shape.dart';

class WholeSaleRegistration extends StatefulWidget {
  const WholeSaleRegistration({Key? key}) : super(key: key);

  @override
  _WholeSaleRegistrationState createState() => _WholeSaleRegistrationState();
}

class _WholeSaleRegistrationState extends State<WholeSaleRegistration> {
  final formKey = GlobalKey<FormState>();
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: ClipUpToDown(),
              child: Container(
                color: lightGray,
                height: height - 30,
                width: width,
              ),
            ),
            ClipPath(
              clipper: ClipUpToDown(),
              child: Container(
                color: darkBlue,
                height: height + 20,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: BackButtons(
                          color: Colors.black,
                        )),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/man.png",
                      height: 100,
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "WholeSale Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.phone,
                            nextOrDone: true,
                            obscured: false,
                            hint: "Phone Number",
                            suffix: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.text,
                            nextOrDone: true,
                            obscured: false,
                            hint: "User Name",
                            suffix: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.text,
                            nextOrDone: true,
                            obscured: false,
                            hint: "Shop Name",
                            suffix: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.text,
                            nextOrDone: true,
                            obscured: true,
                            hint: "Password",
                            suffix: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.text,
                            nextOrDone: true,
                            obscured: true,
                            hint: "Confirm Password",
                            suffix: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationInput(
                            inputType: TextInputType.text,
                            nextOrDone: false,
                            obscured: false,
                            hint: "Address",
                            suffix: false,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 38.0),
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Checkbox(
                                    side: BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    value: isCheck,
                                    onChanged: (status) {
                                      setState(() {
                                        isCheck = status!;
                                      });
                                    },
                                    activeColor: Colors.blueGrey,
                                    checkColor: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                "Agree with terms and conditions.",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0),
                              )
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                side: BorderSide(
                                    color: Colors.orange,
                                    style: BorderStyle.solid),
                                primary: darkBlue,
                                padding: EdgeInsets.only(
                                    top: 10, left: 25, right: 25, bottom: 10),
                                textStyle: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Registration Successful')),
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPPage(
                                              text: "Wholesale",
                                            )));
                              }
                            },
                            child: const Text('Confirm'),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
