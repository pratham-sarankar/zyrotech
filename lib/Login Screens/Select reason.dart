// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import '../config/common.dart';
import 'Create pin.dart';

class Reason extends StatefulWidget {
  const Reason({super.key});

  @override
  State<Reason> createState() => _ReasonState();
}

class _ReasonState extends State<Reason> {
  int selectIndex = 0;

  bool Select1 = false;
  bool Select2 = false;
  bool Select3 = false;
  bool Select4 = false;
  bool Select5 = false;
  bool Select6 = false;
  bool Select7 = false;
  bool Select8 = false;
  bool Select9 = false;
  bool Select10 = false;
  bool Select11 = false;
  bool Select12 = false;
  bool Select13 = false;

  List select = [];
  List name = [
    "Transfers",
    "Scheduling Payments",
    "Get salary early",
    "Budgeting",
    "Cashback",
    "View account in one\n place",
    "Track expenses",
    "Save for goals",
    "Manage subscriptions"
  ];

  List select1 = [
    "Invest in gold",
    "Invest in cryptocurrency",
    "Invest in stocks",
    "Trading",
    "NFTs",
    "Real estate",
    "Mutual funds",
    "Bonds"
  ];

  List select2 = [
    "Hotel booking",
    "Foreign exchanges",
    "Travel insurance",
    "International transfers",
    "Currency conversion"
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
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: notifier.textColor,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.Height(10),
              indicator(value: 0.6),
              AppConstants.Height(20),
              Text(
                "What do you want to use Financial for?",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Manrope-Bold",
                    color: notifier.textColor),
              ),
              AppConstants.Height(10),
              const Text(
                "We need to know this for regulatory reasons.And also, we need curious!",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff64748B),
                    fontFamily: "Manrope-Regular"),
              ),
              AppConstants.Height(30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: notifier.textField.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Banking",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    AppConstants.Height(8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        name.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              switch (index) {
                                case 0:
                                  Select1 = !Select1;
                                  break;
                                case 1:
                                  Select2 = !Select2;
                                  break;
                                case 2:
                                  Select3 = !Select3;
                                  break;
                                case 3:
                                  Select4 = !Select4;
                                  break;
                                case 4:
                                  Select5 = !Select5;
                                  break;
                                case 5:
                                  Select6 = !Select6;
                                  break;
                                case 6:
                                  Select7 = !Select7;
                                  break;
                                case 7:
                                  Select8 = !Select8;
                                  break;
                                case 8:
                                  Select9 = !Select9;
                                  break;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _getSelectionColor(index),
                              border: Border.all(
                                color: _getSelectionColor(index) == notifier.textField
                                    ? Colors.transparent
                                    : const Color(0xff6B39F4),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              name[index],
                              style: TextStyle(
                                fontFamily: "Manrope-SemiBold",
                                fontSize: 13,
                                color: _getTextColor(index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: notifier.textField.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Investments",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    AppConstants.Height(8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        select1.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              switch (index) {
                                case 0:
                                  Select10 = !Select10;
                                  break;
                                case 1:
                                  Select11 = !Select11;
                                  break;
                                case 2:
                                  Select12 = !Select12;
                                  break;
                                case 3:
                                  Select13 = !Select13;
                                  break;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _getInvestmentColor(index),
                              border: Border.all(
                                color: _getInvestmentColor(index) == notifier.textField
                                    ? Colors.transparent
                                    : const Color(0xff6B39F4),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              select1[index],
                              style: TextStyle(
                                fontFamily: "Manrope-SemiBold",
                                fontSize: 13,
                                color: _getInvestmentTextColor(index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.Height(12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: notifier.textField.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Global Spending",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Manrope-Bold",
                        color: notifier.textColor,
                      ),
                    ),
                    AppConstants.Height(8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        select2.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              switch (index) {
                                case 0:
                                  Select12 = !Select12;
                                  break;
                                case 1:
                                  Select13 = !Select13;
                                  break;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _getGlobalColor(index),
                              border: Border.all(
                                color: _getGlobalColor(index) == notifier.textField
                                    ? Colors.transparent
                                    : const Color(0xff6B39F4),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              select2[index],
                              style: TextStyle(
                                fontFamily: "Manrope-SemiBold",
                                fontSize: 13,
                                color: _getGlobalTextColor(index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15,0,15,20),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              backgroundColor: const Color(0xff6B39F4),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Pin(),
                ),
              );
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Manrope-SemiBold",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator({required double value}) {
    return LinearProgressIndicator(
      value: value,
      color: const Color(0xff6B39F4),
      backgroundColor: notifier.linerIndicator,
    );
  }

  Color _getSelectionColor(int index) {
    switch (index) {
      case 0:
        return Select1 ? const Color(0xffF8F5FF) : notifier.textField;
      case 1:
        return Select2 ? const Color(0xffF8F5FF) : notifier.textField;
      case 2:
        return Select3 ? const Color(0xffF8F5FF) : notifier.textField;
      case 3:
        return Select4 ? const Color(0xffF8F5FF) : notifier.textField;
      case 4:
        return Select5 ? const Color(0xffF8F5FF) : notifier.textField;
      case 5:
        return Select6 ? const Color(0xffF8F5FF) : notifier.textField;
      case 6:
        return Select7 ? const Color(0xffF8F5FF) : notifier.textField;
      case 7:
        return Select8 ? const Color(0xffF8F5FF) : notifier.textField;
      case 8:
        return Select9 ? const Color(0xffF8F5FF) : notifier.textField;
      default:
        return notifier.textField;
    }
  }

  Color _getTextColor(int index) {
    switch (index) {
      case 0:
        return Select1 ? const Color(0xff6B39F4) : Colors.grey;
      case 1:
        return Select2 ? const Color(0xff6B39F4) : Colors.grey;
      case 2:
        return Select3 ? const Color(0xff6B39F4) : Colors.grey;
      case 3:
        return Select4 ? const Color(0xff6B39F4) : Colors.grey;
      case 4:
        return Select5 ? const Color(0xff6B39F4) : Colors.grey;
      case 5:
        return Select6 ? const Color(0xff6B39F4) : Colors.grey;
      case 6:
        return Select7 ? const Color(0xff6B39F4) : Colors.grey;
      case 7:
        return Select8 ? const Color(0xff6B39F4) : Colors.grey;
      case 8:
        return Select9 ? const Color(0xff6B39F4) : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color _getInvestmentColor(int index) {
    switch (index) {
      case 0:
        return Select10 ? const Color(0xffF8F5FF) : notifier.textField;
      case 1:
        return Select11 ? const Color(0xffF8F5FF) : notifier.textField;
      case 2:
        return Select12 ? const Color(0xffF8F5FF) : notifier.textField;
      case 3:
        return Select13 ? const Color(0xffF8F5FF) : notifier.textField;
      default:
        return notifier.textField;
    }
  }

  Color _getInvestmentTextColor(int index) {
    switch (index) {
      case 0:
        return Select10 ? const Color(0xff6B39F4) : Colors.grey;
      case 1:
        return Select11 ? const Color(0xff6B39F4) : Colors.grey;
      case 2:
        return Select12 ? const Color(0xff6B39F4) : Colors.grey;
      case 3:
        return Select13 ? const Color(0xff6B39F4) : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color _getGlobalColor(int index) {
    switch (index) {
      case 0:
        return Select12 ? const Color(0xffF8F5FF) : notifier.textField;
      case 1:
        return Select13 ? const Color(0xffF8F5FF) : notifier.textField;
      default:
        return notifier.textField;
    }
  }

  Color _getGlobalTextColor(int index) {
    switch (index) {
      case 0:
        return Select12 ? const Color(0xff6B39F4) : Colors.grey;
      case 1:
        return Select13 ? const Color(0xff6B39F4) : Colors.grey;
      default:
        return Colors.grey;
    }
  }
}


// GridView.builder(
//   itemCount: 6,
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2, mainAxisExtent: 100),
//   shrinkWrap: true,
//   itemBuilder: (context, index) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: GestureDetector(
//         onTap: () {
//           if (select.contains(index)) {
//             setState(() {
//               select.remove(index);
//             });
//           } else {
//             setState(() {
//               select.add(index);
//             });
//           }
//           select.contains(index);
//         },
//         child: Container(
//           height: 30,
//           width: 70,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: select.contains(index)
//                   ? Color(0xffF8F5FF)
//                   : Color(0xffF8F9FD)),
//           child: Center(
//               child: Text(
//             name[index],
//             style: TextStyle(
//                 color: select.contains(index)
//                     ? Color(0xff6B39F4)
//                     : Color(0xff94A3B8),
//                 fontSize: 14,
//                 fontFamily: "Manrope-SemiBold"),
//           )),
//         ),
//       ),
//     );
//   },
// ),
// Text(
//   "Investments",
//   style: TextStyle(
//       fontSize: 18,
//       fontFamily: "Manrope-SemiBold",
//       color: Color(0xff0F172A)),
// ),
// GridView.builder(
//   itemCount: 5,
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2, mainAxisExtent: 100),
//   shrinkWrap: true,
//   itemBuilder: (context, index) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: GestureDetector(
//         onTap: () {
//           if (select1.contains(index)) {
//             setState(() {
//               select1.remove(index);
//             });
//           } else {
//             setState(() {
//               select1.add(index);
//             });
//           }
//           select1.contains(index);
//         },
//         child: Container(
//           height: 30,
//           width: 70,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: select1.contains(index)
//                   ? Color(0xffF8F5FF)
//                   : Color(0xffF8F9FD)),
//           child: Center(
//               child: Text(
//             name1[index],
//             style: TextStyle(
//                 color: select1.contains(index)
//                     ? Color(0xff6B39F4)
//                     : Color(0xff94A3B8),
//                 fontSize: 14,
//                 fontFamily: "Manrope-SemiBold"),
//           )),
//         ),
//       ),
//     );
//   },
// ),
// Text(
//   "Global Spending",
//   style: TextStyle(
//       fontSize: 18,
//       fontFamily: "Manrope-SemiBold",
//       color: Color(0xff0F172A)),
// ),
// GridView.builder(
//   itemCount: 2,
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2, mainAxisExtent: 100),
//   shrinkWrap: true,
//   itemBuilder: (context, index) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: GestureDetector(
//         onTap: () {
//           if (select2.contains(index)) {
//             setState(() {
//               select2.remove(index);
//             });
//           } else {
//             setState(() {
//               select2.add(index);
//             });
//           }
//           select2.contains(index);
//         },
//         child: Container(
//           height: 30,
//           width: 70,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: select2.contains(index)
//                   ? Color(0xffF8F5FF)
//                   : Color(0xffF8F9FD)),
//           child: Center(
//               child: Text(
//             name2[index],
//             style: TextStyle(
//                 color: select2.contains(index)
//                     ? Color(0xff6B39F4)
//                     : Color(0xff94A3B8),
//                 fontSize: 14,
//                 fontFamily: "Manrope-SemiBold"),
//           )),
//         ),
//       ),
//     );
//   },
// ),