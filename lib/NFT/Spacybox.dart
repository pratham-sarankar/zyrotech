// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'Created.dart';
import 'Owned.dart';

class Spacy extends StatefulWidget {
  const Spacy({super.key});

  @override
  State<Spacy> createState() => _SpacyState();
}

class _SpacyState extends State<Spacy> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }
  ColorNotifire notifier = ColorNotifire();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: const Color(0xff6B39F4),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
              "assets/images/arrow-narrow-left (1).png",
              scale: 3,
              color: Colors.white),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 192,
                              width: 415,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/Background (2).png"),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 120,
                                bottom: -50,
                                child:Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white,width: 4),
                                    image: const DecorationImage(image: AssetImage("assets/images/Genesis_artiku.png"),scale: 3,fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              /*Image.asset("assets/images/Spacy1.png",
                                    width: 106, height: 106)*/),
                          ],
                        ),
                        AppConstants.Height(65),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Spacybox",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold")),
                            AppConstants.Width(3),
                            Image.asset(
                              "assets/images/verification.png",
                              width: 12,
                              height: 12,
                            ),
                          ],
                        ),
                        AppConstants.Height(10),
                        Container(
                          height: 24,
                          width: 112,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: notifier.getContainerBorder,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "0xa05859...098",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: notifier.textFieldHintText,
                                      fontFamily: "Manrope-Bold"),
                                ),
                              ),
                              AppConstants.Width(4),
                              Icon(Icons.copy_outlined,
                                  size: 10, color: notifier.textFieldHintText),
                            ],
                          ),
                        ),
                        AppConstants.Height(20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "45.5K",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              const Text("Followers",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 12)),
                            ],
                          ),
                          Container(
                            color: notifier.divider,
                            height: 30,
                            width: 1.5,
                          ),
                          // VerticalDivider(
                          //   thickness: 3,
                          //   color: Colors.black,
                          // ),
                          // Spacer(),
                          Column(
                            children: [
                              Text(
                                "900",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              const Text("Following",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 12)),
                            ],
                          ),
                          Container(
                            color: notifier.divider,
                            height: 30,
                            width: 1.5,
                          ),
                          // Spacer(),
                          Column(
                            children: [
                              Text(
                                "12.5K",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifier.textColor,
                                    fontFamily: "Manrope-Bold"),
                              ),
                              const Text("Created",
                                  style: TextStyle(
                                      color: Color(0xff64748B), fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppConstants.Height(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Container(
                            height: height/14,
                            width: width/1.4,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add,color: Colors.white,size: 20,),
                                AppConstants.Width(7),
                                const Text("Follow",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                          // Spacer(),
                          AppConstants.Width(10),
                          Container(
                            width: width/8,
                            height: height/14,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.withOpacity(0.2)),
                          child: const Icon(Icons.more_horiz,color: Color(0xff94A3B8)),)
                        ],
                      ),
                    ),
                    AppConstants.Height(20),
                    Container(
                      height: height/14,
                      width: width/1.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: notifier.background),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: TabBar(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          tabs: [
                            Tab(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Owned",
                                  style: TextStyle(
                                      color: notifier.textColor, fontSize: 13,fontFamily: "Manrope-Bold"),
                                ),
                                AppConstants.Width(5),
                                Container(
                                  height: 20,
                                  width: 30,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.getContainerBorder),
                                 child: Center(child: Text("27K",style: TextStyle(fontSize: 10,color: notifier.textColor))),
                                )
                              ],
                            )),
                            Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Created",
                                      style: TextStyle(
                                          color: notifier.textColor, fontSize: 13,fontFamily: "Manrope-Bold"),
                                    ),
                                    AppConstants.Width(5),
                                    Container(
                                      height: 20,
                                      width: 30,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifier.getContainerBorder),
                                      child: Center(child: Text("12K",style: TextStyle(fontSize: 10,color: notifier.textColor))),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(controller: _tabController, children: const [
            Owned(),
            Created(),
          ])),
    );
  }
}
