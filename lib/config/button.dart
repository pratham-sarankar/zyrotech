// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  String text;
  Color color;
  Color textcolor;
  double fontsize;

  void Function() tap;

  CommonButton(
      {Key? key,
      required this.tap,
      required this.color,
      required this.text,
      required this.textcolor,
      required this.fontsize,
      })
      : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tap,
      child: Container(
          height: 56,
          width: 327,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(widget.text,
                  style: TextStyle(
                    color: widget.textcolor,fontSize: widget.fontsize
                  )))),
    );
  }
}

Widget button({required String text}) {
  return Container(
    height: 50,
    // width: 330,
    decoration: BoxDecoration(
        color: Colors.deepPurple, borderRadius: BorderRadius.circular(15)),
    child: ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 300),
              borderRadius: BorderRadius.circular(15))),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17)),
    ),
  );
}


Widget button1({required String text,required onPressed}){
  return  Container(
    height: 50,
    width: 330,
    decoration: BoxDecoration(
        color: const Color(0xff6B39F4),
        borderRadius: BorderRadius.circular(15)
    ),
    child: ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 300),
              borderRadius: BorderRadius.circular(15)
          )
      ),
      child:  Text(text,style: const TextStyle(color: Colors.white,fontSize: 19)),
    ),
  );
}