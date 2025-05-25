// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import '../config/See_all_assets_model.dart';
import '../config/common.dart';
import 'My wallet.dart';

class Transaction_all extends StatefulWidget {
  const Transaction_all({super.key});

  @override
  State<Transaction_all> createState() => _Transaction_allState();
}

class _Transaction_allState extends State<Transaction_all> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
          Image.asset("assets/images/arrow-narrow-left (1).png", scale: 3),
        ),
        title: const Text("See All Transactions",style: TextStyle(color: Color(0xff6B39F4),fontSize: 17,fontFamily: "Manrope-Bold")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppConstants.Height(10),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: assetDetail_.length,
                  itemBuilder: (context, index) {
                   AssetModel_ data = assetDetail_[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Wallet(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: const Color(0xffE2E8F0))),
                          child: ListTile(
                            // contentPadding: EdgeInsets.zero,
                            leading: Image.asset(data.image),
                            title: Row(
                              children: [
                                Text(data.name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff0F172A),
                                        fontFamily: "Manrope-Bold")),
                                const Spacer(),
                                Text(data.money,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff0F172A),
                                        fontFamily: "Manrope-Bold")),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(data.desc,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff64748B),
                                        fontFamily: "Manrope-Regular"),),
                                const Spacer(),
                                Text(data.percentage,style: const TextStyle(color: Color(0xff64748B),fontFamily: "Manrope-Regular"),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
