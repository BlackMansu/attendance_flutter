// ignore_for_file: unused_local_variable, unused_field

import 'package:attendance_app/repository/functions.dart';
import 'package:attendance_app/services/color_theme.dart';
import 'package:attendance_app/services/text_theme.dart';
import 'package:attendance_app/utils/navigate.dart';
import 'package:attendance_app/utils/space.dart';
import 'package:attendance_app/view/Home.dart';
import 'package:attendance_app/widget/btn_widget/txtbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Addinfo extends StatefulWidget {
  Addinfo({super.key});

  @override
  State<Addinfo> createState() => _AddinfoState();
}

class _AddinfoState extends State<Addinfo> {
  // final _imgurl = TextEditingController();
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FirebaseDataHandler>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.black,
        title: Text.rich(TextSpan(children: [
          TextSpan(text: "Add ", style: MyStyle.fs20Regular),
          TextSpan(
            text: "Info",
            style: MyStyle.fs20SemiBold,
          )
        ])),
      ),
      backgroundColor: Clr.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // TextField(
              //   controller: _imgurl,
              //   decoration: InputDecoration(
              //     filled: true,
              //     enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Clr.white),
              //         borderRadius: BorderRadius.circular(20.r)),
              //     label: Text("Image Url"),
              //     fillColor: Clr.white,
              //   ),
              // ),
              // Space.addheight(20),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Clr.white),
                      borderRadius: BorderRadius.circular(20.r)),
                  label: Text("Name"),
                  fillColor: Clr.white,
                ),
              ),
              Space.addheight(20),
              Txtbtn(
                radiuss: 20,
                width: 200,
                navigator: () {
                  // // saveForm();
                  // Map<String, dynamic> data = {
                  //   "name": _name.text,
                  // };
                  // FirebaseDataAdd().setDataFirebase(data, context);
                  provider.setDataFirebase(_name.text);

                  Navigate.pushandremoveuntil(context, Home());
                },
                text: "Add",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
