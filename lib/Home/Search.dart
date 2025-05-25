// ignore_for_file: file_names, camel_case_types

import 'package:crowwn/config/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/See_all_assets_model.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: notifier.background,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,color: notifier.textColor,
          ),
        ),
        title: Text("Search",style: TextStyle(fontFamily: "Manrope-Bold",color: notifier.textColor,fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(10),
              Container(
                height: height/15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier.onboardBackgroundColor,
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(color: notifier.textColor),
                    decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset("assets/images/Search.png",
                              scale: 3, color: notifier.textFieldHintText,),
                        ),
                        hintText: "Search asset...",
                        hintStyle:
                        TextStyle(color: notifier.textFieldHintText, fontSize: 14),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        // contentPadding: const EdgeInsets.only(top: 20)
                    ),
                  ),
                ),
              ),
              AppConstants.Height(10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: assetDetail.length,
                  itemBuilder: (context, index) {
                    AssetModel data = assetDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: notifier.getContainerBorder)),
                        child: ListTile(
                          // contentPadding: EdgeInsets.zero,
                          leading: Image.asset(data.image,scale: 3),
                          title: Row(
                            children: [
                              Text(data.name,
                                  style:  TextStyle(
                                      fontSize: 15,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold")),
                              const Spacer(),
                              Text(data.money,
                                  style:  TextStyle(
                                      fontSize: 16,
                                      color: notifier.textColor,
                                      fontFamily: "Manrope-Bold")),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(data.desc,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff64748B),
                                      fontFamily: "Manrope-Regular")),
                              const Spacer(),
                              Image.asset(data.icon,scale: 3),
                              AppConstants.Width(4),
                              Text(data.percentage,style: const TextStyle(color: Color(0xff1DCE5C),fontFamily: "Manrope-Bold"),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
