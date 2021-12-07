import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailerapp/BackButton/back_button.dart';
import 'package:retailerapp/Components/components.dart';
import 'package:retailerapp/Stores/store_list.dart';

class GpsOff extends StatelessWidget {
  const GpsOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: offWhite,
                child: Opacity(
                  opacity: 0.4,
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50.0),
                            child: BackButtons(color: Colors.black),
                          )),
                      SizedBox(
                        width: width / 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Text(
                          "CHOICE YOUR\nRETAILER STORE.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: offWhite,
                padding: EdgeInsets.only(top: 20, bottom: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: .5,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              width: width - (width / 5),
                              decoration: BoxDecoration(
                                  color: darkBlue,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Transform.rotate(
                                    angle: 89.4,
                                    child: Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Search Shop Name / Retailer Owner Name",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.dehaze,
                            color: darkBlue,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset("assets/NoGps.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StoreList()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        "Confirm Location",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
