// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/See_all_assets_model.dart';
import '../config/common.dart';
import 'Detail_crypto.dart';

class see_all extends StatefulWidget {
  const see_all({super.key});

  @override
  State<see_all> createState() => _see_allState();
}

class _see_allState extends State<see_all> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Image.asset("assets/images/arrow-narrow-left (1).png", scale: 3,color: notifier.textColor),
        ),
        title: const Text("See All Assets",style: TextStyle(color: Color(0xff6B39F4),fontSize: 17,fontFamily: "Manrope-Bold")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: assetDetail.length,
                  itemBuilder: (context, index) {
                    AssetModel data = assetDetail[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Detail_crypto(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: notifier.getContainerBorder)),
                          child: ListTile(
                            // contentPadding: EdgeInsets.zero,
                            leading: Image.asset(data.image,scale: 3,),
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
