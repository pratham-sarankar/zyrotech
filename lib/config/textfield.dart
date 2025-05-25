

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class CommonTextfield extends StatefulWidget {
  String text;
  Color textcolor;
  CommonTextfield(
      {Key? key,
        required this.text,
        required this.textcolor,
        })
      : super(key: key);

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10,bottom: 10,left: 10),
        label: Text(widget.text, style: TextStyle(color: widget.textcolor)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey)
        ,borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        )
      ),
    );
  }
}






// Widget fourcontainer(){
//   return Padding(
//     padding: const EdgeInsets.only(left: 10,right: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Multiple Select',style: TextStyle(color: Colors.black)),
//         const SizedBox(height: 10,),
//         Container(
//           height: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.withOpacity(0.4),width: 1),
//           ),
//           child:  Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Row(
//                     children: [],
//                   ),
//                   SizedBox(
//                     height: 100,
//                     width: 200,
//                     child: ListView.builder(scrollDirection: Axis.vertical,itemCount:selectText.length ,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             InkWell(
//                                 onTap:() {
//                                   if(selectIndex.contains(index)){
//                                     setState(() {
//                                       selectIndex.remove(index);
//                                     });
//                                   }else{
//                                     setState(() {
//                                       selectIndex.add(index);
//                                     });
//                                   }
//                                   selectIndex.contains(index);
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 5,bottom: 5),
//                                   child: Container(
//                                       height: 20,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                           color: selectIndex.contains(index) ? Colors.red:Colors.white,
//                                           borderRadius: const BorderRadius.all(Radius.circular(5))
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 10),
//                                         child: Text(selectText[index],style: TextStyle(color: selectIndex.contains(index) ? Colors.black:Colors.black),),
//                                       )),
//                                 )),
//                           ],
//                         );
//                       },),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }
//
//
//
//
//
