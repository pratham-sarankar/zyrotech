// // ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Dark mode.dart';
// import '../config/common.dart';
// import 'country.dart';

// class Finger extends StatefulWidget {
//   const Finger({super.key});

//   @override
//   State<Finger> createState() => _FingerState();
// }

// class _FingerState extends State<Finger> {
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
//         padding: const EdgeInsets.only( bottom: 20,left: 10,right: 10),
//         child: Column(
//           children: [
//             AppConstants.Height(10),
//             indicator(value: 0.3),
//             AppConstants.Height(70),
//             Center(
//               child: Container(
//                 height: height/3.6,
//                 // width: 200,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/finger print.png"),
//                   ),
//                 ),
//               ),
//             ),
//             AppConstants.Height(20),
//             Text(
//               "Enable Fingerprint",
//               style: TextStyle(fontSize: 24, fontFamily: "Manrope-Bold",color: notifier.textColor),
//             ),
//             AppConstants.Height(10),
//             const Text(
//               "Enable your fingerprint authentication \n as your security.",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Color(0xff64748B),
//                 fontFamily: "Manrope-Regular"
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Country(),));
//               },
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 12,
//                 width: double.infinity,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
//                 child: const Center(
//                   child: Text(
//                     "Enable Fingerprint",
//                     style: TextStyle(color: Color(0xffFFFFFF), fontSize: 17,fontFamily: "Manrope-Bold"),
//                   ),
//                 ),
//               ),
//             ),
//             AppConstants.Height(20),
//             GestureDetector(onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const Country(),));
//             },
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 12,
//                 width: double.infinity,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.blue.withOpacity(0.1),),
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
