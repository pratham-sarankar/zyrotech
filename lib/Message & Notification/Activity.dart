
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowwn/config/activity_model.dart';
import 'package:crowwn/config/common.dart';

import '../Dark mode.dart';
import 'Notification_detail.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              AppConstants.Height(20),
              ListView.builder(
                itemCount: model.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Activity_Model data = model[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notification_detail(image: data.image, name: data.name,),));
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
                            leading: Image.asset(data.image,scale: 3,),
                            title: Text(data.name,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold")),
                            subtitle: Text(data.subtitle,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff64748B),
                                    fontFamily: "Manrope-Regular")),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(data.time,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff64748B),
                                        fontFamily: "Manrope-Regular")),
                                AppConstants.Height(5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },),

            ],
          ),
        ),
      ),
    );
  }
}
