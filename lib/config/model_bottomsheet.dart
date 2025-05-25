import 'package:flutter/material.dart';


class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  bool isSwipeUp =false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(26, 41, 128, 100),
            Color.fromRGBO(42, 178, 252, 100),
          ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Align(alignment: Alignment.topCenter,
        child: (isSwipeUp)
            ? const Icon(
          Icons.expand_more_outlined,
          size: 30,
          color: Colors.white,
        )
            : const Icon(
          Icons.expand_less_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
