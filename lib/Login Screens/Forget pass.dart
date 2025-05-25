// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Dark mode.dart';
import 'Password update.dart';
import '../config/common.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  ColorNotifire notifier = ColorNotifire();
  bool _obsecuretext2 = true;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            AppConstants.Height(50),
            Row(
              children: [
                Text(
                  "Create New Password",
                  style: TextStyle(fontSize: 27, fontFamily: "Manrope -SemiBold",color: notifier.textColor),
                ),
              ],
            ),
            AppConstants.Height(20),
            const Row(
              children: [
                Text(
                  "Your new password must different from \n previous password.",
                  style: TextStyle(fontSize: 16, color: Color(0xff64748B),fontFamily: "Manrope-Medium"),
                ),
              ],
            ),
            AppConstants.Height(20),
            Container(
              height: height/13,
              decoration: BoxDecoration(color: notifier.textField,borderRadius: BorderRadius.circular(15)),
              child: TextField(
                style: TextStyle(color: notifier.textColor),
                decoration: InputDecoration(hintText: "New Password",border: const OutlineInputBorder(borderSide: BorderSide.none),hintStyle: TextStyle(color: notifier.textFieldHintText)),
              ),
            ),
            AppConstants.Height(10),
            const Text("Your password is not strong enough. Your password is at least 8 characters.",style: TextStyle(fontSize: 14,color: Color(0xffE82C81)),),
            AppConstants.Height(20),
            Container(
              height: height/13,
              decoration: BoxDecoration(color: notifier.textField,borderRadius: BorderRadius.circular(15)),
              child: TextField(
                style: TextStyle(color: notifier.textColor),
                obscureText: _obsecuretext2,
                decoration: InputDecoration(hintText: "Password",border: const OutlineInputBorder(borderSide: BorderSide.none),hintStyle: TextStyle(color: notifier.textFieldHintText),suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecuretext2 =! _obsecuretext2;
                      });
                    },
                    icon: _obsecuretext2?const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
                ),),
              ),
            ),
            AppConstants.Height(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Password(),
                    ));
              },
              child: Container(
                height: height/12,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
                child: const Center(child: Text("Reset Password",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 15,fontFamily: "Manrope-Bold"),)),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
