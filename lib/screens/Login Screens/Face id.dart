// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Dark mode.dart';
// import '../config/common.dart';
// import 'Finger print.dart';

// class Face extends StatefulWidget {
//   const Face({super.key});

//   @override
//   State<Face> createState() => _FaceState();
// }

// class _FaceState extends State<Face> {
//   // late AnimationController controller;
//   // @override
//   // void initState() {
//   //   controller = AnimationController(
//   //     vsync: this,
//   //     duration: const Duration(seconds: 2),
//   //   )..addListener(() {
//   //     setState(() {});
//   //   });
//   //    controller.repeat();
//   //   super.initState();
//   // }
//   // void dispose() {
//   //   controller.dispose();
//   //   super.dispose();
//   // }
//   ColorNotifire notifier = ColorNotifire();

//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifire>(context, listen: true);
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: notifier.background,
//       appBar: AppBar(
//         backgroundColor: notifier.background,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.close,
//             color: notifier.textColor,
//             size: 25,
//           ),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
//         child: Column(
//           children: [
//             AppConstants.Height(10),
//             indicator(value: 0.1),
//             AppConstants.Height(70),
//             Center(
//               child: Container(
//                 height: height/3.6,
//                 // width: 200,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/face id.png"),
//                   ),
//                 ),
//               ),
//             ),

//             AppConstants.Height(20),
//             Text(
//               "Enable Face ID",
//               style: TextStyle(fontSize: 24, fontFamily: "Manrope-Bold",color: notifier.textColor),
//             ),
//             AppConstants.Height(10),
//             const Text(
//               "This help us check that you’re really \n you. Identity verification is one of the \n   ways we keep secure.",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Color(0xff64748B),
//                 fontFamily: "Manrope-Regular",
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Finger(),
//                     ));
//               },
//               child: Container(
//                 height: height / 12,
//                 // width: double.infinity,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
//                 child: const Center(
//                   child: Text(
//                     "Enable Face ID",
//                     style: TextStyle(color: Color(0xffFFFFFF), fontSize: 17,fontFamily: "Manrope-Bold"),
//                   ),
//                 ),
//               ),
//             ),
//             AppConstants.Height(20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Finger(),
//                     ));
//               },
//               child: Container(
//                 height: height / 12,
//                 // width: double.infinity,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue.withValues(alpha:0.1),),
//                 child: const Center(
//                   child: Text(
//                     "Skip for Now",
//                     style: TextStyle(
//                         color: Color(0xff6B39F4),
//                         fontSize: 17,
//                         fontFamily: "Manrope-Bold"),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   Widget indicator({required double value}){
//     return  LinearProgressIndicator(
//       value: value,
//       color: const Color(0xff6B39F4),
//       backgroundColor: notifier.linerIndicator,
//     );
//   }
// }
