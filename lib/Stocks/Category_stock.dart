// ignore_for_file: file_names

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List data5 = [
    {
      "image": "assets/images/Technology.png",
      "name": "Technology",
    },
    {
      "image": "assets/images/Finance.png",
      "name": "Finance",
    },
    {
      "image": "assets/images/Utilities.png",
      "name": "Utilities",
    },
    {
      "image": "assets/images/Business.png",
      "name": "Business",
    },
    {
      "image": "assets/images/Energy.png",
      "name": "Energy",
    },
    {
      "image": "assets/images/HealthCare.png",
      "name": "HealthCare",
    },
    {
      "image": "assets/images/Real Estate.png",
      "name": "RealEstate",
    },
    {
      "image": "assets/images/Consumer.png",
      "name": "Consumer",
    },
    {
      "image": "assets/images/Communication.png",
      "name": "Communication",
    },
    {
      "image": "assets/images/Finance.png",
      "name": "Finance",
    },
    {
      "image": "assets/images/Technology.png",
      "name": "Technology",
    },
    {
      "image": "assets/images/Industry.png",
      "name": "Industry",
    },
    {
      "image": "assets/images/Materials.png",
      "name": "Materials",
    },
    {
      "image": "assets/images/Utilities.png",
      "name": "Utilities",
    },
    {
      "image": "assets/images/Information.png",
      "name": "Information",
    },
  ];
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: notifier.textColor,
          ),
        ),
        title: Text(
          "Market Sectors",
          style: TextStyle(
            color: notifier.textColor,
            fontSize: 16,
            fontFamily: "Manrope-Bold",
          ),
        ),
        backgroundColor: notifier.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(20),
              Text(
                "All Market Sectors",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data5.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        height: height / 6.5,
                        width: width / 3.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,
                        ),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              alignment: Alignment.center,
                              height: height / 13,
                              width: width / 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: notifier.iconButton),
                              child: Image.asset(data5[index]['image'],
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text(
                              data5[index]['name'],
                              style: TextStyle(
                                  color: notifier.textColor,
                                  fontSize: 12,
                                  fontFamily: "Manrope-SemiBold"),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: notifier.textField,
                        ),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Finance",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Technology",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Utilities",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),
              Text(
                "All Market Sectors",
                style: TextStyle(
                    color: notifier.textColor,
                    fontSize: 16,
                    fontFamily: "Manrope-Bold"),
              ),
              AppConstants.Height(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Business",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Energy",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("HealthCare",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Real Estate",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Consumer",style: TextStyle(color:notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Communication",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Finance",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Technology",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Industry",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Materials",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Utilities",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/6.5,
                        width: width/3.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.textField,),
                        child: Column(
                          children: [
                            AppConstants.Height(15),
                            Container(
                              height: height/14,
                              width: width/8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Colors.white),
                              child: Image.asset("",
                                  scale: 2.5),
                            ),
                            AppConstants.Height(7),
                            Text("Information",style: TextStyle(color: notifier.textColor,fontSize: 12,fontFamily: "Manrope-SemiBold"),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppConstants.Height(20),*/
            ],
          ),
        ),
      ),
    );
  }
}
