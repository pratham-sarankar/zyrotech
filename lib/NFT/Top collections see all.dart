// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/Top_collections_see_all.dart';
import '../config/common.dart';

class Top_collections_see extends StatefulWidget {
  const Top_collections_see({super.key});

  @override
  State<Top_collections_see> createState() => _Top_collections_seeState();
}

class _Top_collections_seeState extends State<Top_collections_see> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: notifier.textColor,)),
        title: const Text("Top Collections see all",style: TextStyle(fontSize: 17,fontFamily: "Manrope-Bold",color: Color(0xff6B39F4))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(

            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: collectionDetail.length,
                  itemBuilder: (context, index) {
                    CollectionsModel data = collectionDetail[index];
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
