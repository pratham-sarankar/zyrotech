// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'Login.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      appBar: AppBar(
        backgroundColor: notifier.background,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close,color:notifier.textColor,size: 25,)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          children: [
            AppConstants.Height(90),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/password update.png"),
                  ),
                ),
              ),
            ),
            Text(
              "Password Updated!",
              style: TextStyle(fontSize: 24, fontFamily: "Manrope-Bold",color: notifier.textColor),
            ),
            AppConstants.Height(10),
            const Text(
              "Your password has been set up\n successfully.",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Manrope-SemiBold",color: Color(0xff64748B)
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  height: height/12,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
                  child: const Center(child: Text("Back to sign in",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 15,fontFamily: "Manrope-Bold"),)),
                ),
              ),
            ),
            AppConstants.Height(20),
          ],
        ),
      ),
    );
  }




}
