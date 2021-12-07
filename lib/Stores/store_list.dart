import 'package:flutter/material.dart';
import 'package:retailerapp/BackButton/back_button.dart';
import 'package:retailerapp/Components/components.dart';

class StoreList extends StatefulWidget {
  const StoreList({Key? key}) : super(key: key);

  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
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
            SizedBox(
              height: 5,
            ),
            Container(
              color: offWhite,
              padding: EdgeInsets.only(top: 20, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
