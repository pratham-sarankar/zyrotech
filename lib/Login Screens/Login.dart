// ignore_for_file: file_names
import 'package:crowwn/Login%20Screens/Country%20residence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dark mode.dart';
import '../config/common.dart';
import 'Face id.dart';
import 'Forget pass.dart';
import 'Sign up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = false;
  bool _obsecuretext = true;
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifire>(context, listen: true);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: notifier.background,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                height: 279,
                width: 450,
                 color: const Color(0xff0F172A),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10),

                          child:
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close,color:notifier.textColor,size: 25,)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset("assets/images/Crowwn.png",color: notifier.isDark ? Colors.white : null,height: height/10),
                    const Spacer(),
                    const Text('Welcome Back!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "Manrope-Bold")),
                    const Text('Sign in to your account',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontFamily: "Manrope-Medium")),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )),
            AppConstants.Height(10),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Container(
                    height: height/13,
                    decoration: BoxDecoration(color: notifier.textField,borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      style: TextStyle(color: notifier.textColor),
                      decoration: InputDecoration(hintText: "Email",border: const OutlineInputBorder(borderSide: BorderSide.none),hintStyle: TextStyle(color: notifier.textFieldHintText)),
                    ),
                  ),
                  AppConstants.Height(20),
                  Container(
                    height: height/13,
                    decoration: BoxDecoration(color: notifier.textField,borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      style: TextStyle(color: notifier.textColor),
                      obscureText: _obsecuretext,
                      decoration: InputDecoration(hintText: "Password",border: const OutlineInputBorder(borderSide: BorderSide.none),hintStyle: TextStyle(color: notifier.textFieldHintText),suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecuretext =! _obsecuretext;
                            });
                          },
                          icon: _obsecuretext?const Icon(Icons.remove_red_eye_outlined) : const Icon(Icons.visibility_off_outlined)
                      ),),
                    ),
                  ),
                  // AppConstants.Height(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          // checkColor: Colors.blue,
                           side: const BorderSide(color: Color(0xff334155)),
                          activeColor: const Color(0xff6B39F4),
                          checkColor: const Color(0xffFFFFFF),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                         Text("Remember me",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Manrope-Medium",
                                color: notifier.textColor)),
                        Expanded(child: AppConstants.Width(60)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Forget(),));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6B39F4),
                                fontFamily: "Manrope-Bold"),
                          ),
                        )
                      ],
                    ),
                  ),
                  // AppConstants.Height(5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CountrySelection(),
                          ));
                    },
                    child: Container(
                      height: height/12,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0xff6B39F4),),
                      child: const Center(child: Text("Sign In",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 15,fontFamily: "Manrope-Bold"),)),
                    ),
                  ),
                  AppConstants.Height(10),
                  const Text(
                    "--------------- Or sign in with ---------------",
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff64748B),
                        fontFamily: "Manrope-Medium"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            side: MaterialStatePropertyAll(BorderSide(color: notifier.getContainerBorder))
                          ),
                          onPressed: () {},
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage("assets/images/google.png"),
                                height: 19,
                                width: 16,
                              ),
                              Text(
                                " Google",
                                style: TextStyle(
                                    color: notifier.isDark?Colors.white:Colors.black,
                                    fontFamily: "Manrop-SemiBold",
                                    fontSize: 16),
                              )
                            ],
                          )),
                    ),
                  ),
                  AppConstants.Height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontFamily: "Manrope-Medium", color: Color(0xff64748B)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Sign(),));
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6B39F4),
                                fontFamily: "Manrope-Bold"),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            AppConstants.Height(20),

          ],
        ),
      ),
    );
  }
}
