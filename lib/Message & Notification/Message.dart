// ignore_for_file: file_names
import 'package:crowwn/Message%20&%20Notification/Message_ofline.dart';
import 'package:crowwn/config/common.dart';
import 'package:crowwn/config/message_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Message_online.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  int selectedFilter = 0;

  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: notifier.background,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: notifier.textColor,
          ),
        ),
        title: Center(
          child: Text(
            "Message",
            style: TextStyle(
              fontSize: 16,
              color: notifier.textColor,
            ),
          ),
        ),
        actions: [
          Image.asset(
            "assets/images/Filter_.png",
            height: 25,
            width: 25,
            color: const Color(0xff94A3B8),
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: notifier.background,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(30),
              Container(
                height: 56,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifier
                      .textField, /*border: Border.all(color: Color(0xff6B39F4))*/
                ),
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
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Image.asset(
                    "assets/images/Pinned.png",
                    scale: 3,
                  ),
                  AppConstants.Width(10),
                  const Text(
                    "Pinned message",
                    style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        color: Color(0xff64748B),
                        fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messageDetail.length,
                itemBuilder: (context, index) {
                  MessageModel data = messageDetail[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Message_on(
                              image: data.image,
                              name: data.name,
                            ),
                          ),
                        );
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
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(data.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(data.name,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold")),
                          subtitle: Text(data.desc,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff64748B),
                                  fontFamily: "Manrope-Regular")),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(data.status,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff64748B),
                                      fontFamily: "Manrope-Regular")),
                              AppConstants.Height(5),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff6B39F4)),
                                child: Center(
                                  child: Text(
                                    data.message,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: "Manrope-Bold"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              AppConstants.Height(20),
              Row(
                children: [
                  Image.asset(
                    "assets/images/message.png",
                    scale: 3,
                  ),
                  AppConstants.Width(10),
                  const Text(
                    "All Message",
                    style: TextStyle(
                        fontFamily: "Manrope-Bold",
                        color: Color(0xff64748B),
                        fontSize: 15),
                  )
                ],
              ),
              AppConstants.Height(20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messageDetail_.length,
                itemBuilder: (context, index) {
                  MessageModel_1 data = messageDetail_[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Message_of(
                              image_: data.image_, name_: data.name_),
                        ));
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
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(data.image_),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          /*Image.asset(data.image_),*/
                          title: Text(data.name_,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifier.textColor,
                                  fontFamily: "Manrope-Bold")),
                          subtitle: Text(data.desc_,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff64748B),
                                  fontFamily: "Manrope-Regular")),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(data.status_,
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
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            isScrollControlled: true,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    height: 370,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      color: notifier.background,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                  fontFamily: "Manrope-Bold",
                                  fontSize: 16,
                                  color: notifier.textColor,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Color(0xff94A3B8),
                                  ))
                            ],
                          ),
                          AppConstants.Height(10),
                          Divider(
                            color: notifier.getContainerBorder,
                            thickness: 1,
                          ),
                          AppConstants.Height(10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilter = 0;
                              });
                            },
                            child: Container(
                              height: 59,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: selectedFilter == 0
                                        ? const Color(0xff6B39F4)
                                        : notifier.getContainerBorder,
                                  )),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "All Message",
                                      style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 16,
                                          fontFamily: "Manrope-Regular"),
                                    ),
                                  ),
                                  const Spacer(),
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 0,
                                    groupValue: selectedFilter,
                                    onChanged: (index) {
                                      setState(
                                        () {
                                          selectedFilter = 0;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppConstants.Height(10),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  selectedFilter = 1;
                                },
                              );
                            },
                            child: Container(
                              height: 59,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: selectedFilter == 1
                                        ? const Color(0xff6B39F4)
                                        : notifier.getContainerBorder,
                                  )),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Unread Message",
                                      style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 16,
                                          fontFamily: "Manrope-Regular"),
                                    ),
                                  ),
                                  const Spacer(),
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: const Color(0xff0056D2),
                                    value: 1,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 1;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppConstants.Height(10),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  selectedFilter = 2;
                                },
                              );
                            },
                            child: Container(
                              height: 59,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: selectedFilter == 2
                                        ? const Color(0xff6B39F4)
                                        : notifier.getContainerBorder,
                                  )),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Unanswered",
                                      style: TextStyle(
                                          color: notifier.textColor,
                                          fontSize: 16,
                                          fontFamily: "Manrope-Regular"),
                                    ),
                                  ),
                                  const Spacer(),
                                  Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color(0xff6B39F4)),
                                    // activeColor: Color(0xff0056D2),
                                    value: 2,
                                    groupValue: selectedFilter,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFilter = 2;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppConstants.Height(10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff6B39F4)),
                              child: const Center(
                                  child: Text("Done",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF),
                                          fontFamily: "Manrope-Bold"))),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: const Color(0xff6B39F4),
        child: const Icon(Icons.add),
      ),
    );
  }
}
