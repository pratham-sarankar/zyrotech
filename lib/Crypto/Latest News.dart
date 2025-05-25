// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/Latest_News_model.dart';

import '../Dark mode.dart';
import '../Gold/Detail_gold.dart';
import '../config/common.dart';

class latest_news extends StatefulWidget {
  const latest_news({super.key});

  @override
  State<latest_news> createState() => _latest_newsState();
}

class _latest_newsState extends State<latest_news> {
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
        title: const Text("Latest News",
            style: TextStyle(
                color: Color(0xff6B39F4),
                fontSize: 17,
                fontFamily: "Manrope-Bold")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
             const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsDetail.length,
                itemBuilder: (context, index) {
                  NewsModel data = newsDetail[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const Detail_gold()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        margin: EdgeInsets.zero,
                        shape:  Border(
                          bottom:
                              BorderSide(color: notifier.getContainerBorder, width: 1),
                        ),
                        child: ListTile(
                          // contentPadding: EdgeInsets.zero,
                          leading: Image.asset(data.image),
                          title: Row(
                            children: [
                              Text(
                                data.name,
                                style:  TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                data.desc,
                                style: const TextStyle(
                                    color: Color(0xff64748B),
                                    fontSize: 13,
                                    fontFamily: "Manrope-Medium"),
                              ),
                              AppConstants.Width(
                                  MediaQuery.of(context).size.width / 60),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: notifier.getContainerBorder),
                              ),
                              AppConstants.Width(
                                  MediaQuery.of(context).size.width / 60),
                              Text(
                                data.time,
                                style: const TextStyle(
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Medium",
                                    fontSize: 13),
                              ),
                             const  Spacer(),
                               Icon(Icons.more_horiz,color: notifier.textColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
