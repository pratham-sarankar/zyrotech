// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/Wallet/Transferbalance_confirmation.dart';
import 'package:crowwn/config/Contact_list.dart';

import '../Dark mode.dart';
import '../config/common.dart';

class Transfer_contact extends StatefulWidget {
  const Transfer_contact({super.key});

  @override
  State<Transfer_contact> createState() => _Transfer_contactState();
}

class _Transfer_contactState extends State<Transfer_contact> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,color: notifier.textColor,
          ),
        ),
        title: Center(
            child: Text("Address Book",
                style: TextStyle(fontSize: 16, color: notifier.textColor))),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.add_circle_outline,color: Color(0xff6B39F4),size: 20),
          )
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(30),
              Container(
                height: height/15,
                width: width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier.onboardBackgroundColor, /*border: Border.all(color: Color(0xff6B39F4))*/
                ),
                child: Center(
                  child: TextField(
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image(
                            image: const AssetImage("assets/images/Search.png"),
                            height: 20,
                            width: 20,
                            color: notifier.textFieldHintText,
                          ),
                        ),
                        hintText: "Search...",
                        hintStyle: TextStyle(
                            color: notifier.textFieldHintText,
                            fontFamily: "Manrope-Regular",
                            fontSize: 16)),
                  ),
                ),
              ),
              AppConstants.Height(20),
              const Text("Favorites",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Bold"),),
              AppConstants.Height(10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contactDetail.length,
                  itemBuilder: (context, index) {
                    ContactModel data = contactDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Transfer_confirmation(image_: data.image,name_: data.name),));
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          margin: EdgeInsets.zero,
                          shape: Border(
                              bottom: BorderSide(
                                  color: notifier.getContainerBorder, width: 1)),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                                backgroundImage: AssetImage(data.image),radius: 20,),
                            title: Text(data.name,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold",),),
                            subtitle: Text(data.desc,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular",),),
                          ),
                        ),
                      ),
                    );
                  }),
              AppConstants.Height(20),
              const Text("All Contacts",style: TextStyle(color: Color(0xff64748B),fontSize: 14,fontFamily: "Manrope-Bold"),),
              AppConstants.Height(10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contactDetail_.length,
                  itemBuilder: (context, index) {
                    ContactModel_ data = contactDetail_[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        margin: EdgeInsets.zero,
                        shape: Border(
                            bottom: BorderSide(
                                color: notifier.getContainerBorder, width: 1)),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                          radius: 20,backgroundImage: AssetImage(data.image_),
                              ),
                          title: Text(data.name_,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold",),),
                          subtitle: Text(data.desc_,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff64748B),
                                  fontFamily: "Manrope-Regular",),),
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
