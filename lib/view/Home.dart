// ignore_for_file: unused_local_variable

import 'package:analog_clock/analog_clock.dart';
import 'package:attendance_app/repository/functions.dart';
import 'package:attendance_app/repository/showDilog.dart';
import 'package:attendance_app/services/color_theme.dart';
import 'package:attendance_app/services/text_theme.dart';
import 'package:attendance_app/utils/navigate.dart';
import 'package:attendance_app/utils/space.dart';
import 'package:attendance_app/view/Addinfo.dart';
import 'package:attendance_app/view/Nextpage.dart';
import 'package:attendance_app/widget/btn_widget/txtbtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cont = 1;

  @override
  // List<String> attandance = ["Present", "Absent"];
  void initState() {
    data();
    super.initState();
  }

  data() async {
    final db = Provider.of<FirebaseDataHandler>(context, listen: false);
    final provider = db.getFirebaseData();
    db.getattandanceFirebaseData();
  }

  Widget build(BuildContext context) {
    var providers = Provider.of<FirebaseDataHandler>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.black,
        title: Text.rich(TextSpan(
            style: MyStyle.fs20SemiBold.copyWith(letterSpacing: 2),
            children: [
              TextSpan(text: "Att", style: TextStyle(color: Colors.blueAccent)),
              TextSpan(text: "end", style: TextStyle(color: Colors.redAccent)),
              TextSpan(text: "ance", style: TextStyle(color: Colors.yellow))
            ])),
        // Text(
        //   "Attendance",
        //   style: MyStyle.fs20SemiBold.copyWith(letterSpacing: 2),
        // ),
        actions: [
          IconButton(
              onPressed: () {
                Navigate.push(context, Addinfo());
              },
              icon: Icon(
                CupertinoIcons.add,
                color: Clr.orang,
                size: 30,
              ))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Clr.black,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(20.r))),
      //     onPressed: () {
      //       Navigate.push(context, Nextpage());
      //     },
      //     child: Icon(
      //       CupertinoIcons.arrow_right,
      //       size: 35,
      //     )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ...List.generate(
                providers.getstudentinfoList.length,
                (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.network(
                            "https://img.freepik.com/free-vector/boy-cartoon-head-wearing-glasses-isolated_1308-157061.jpg?w=360&t=st=1714456642~exp=1714457242~hmac=c9c539a647366ec27b675acfa39d74dd8a7f055365a599d5f3855e672e6f6837",
                            fit: BoxFit.cover,
                            // height: Space.getHeight(context) * 0.5,
                            width: Space.getWidth(context) * 0.14,
                          ),
                        ),
                        tileColor: Color.fromARGB(106, 174, 140, 202),
                        minVerticalPadding: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                            side: BorderSide(color: Clr.black)),
                        title: Text(
                          providers.getstudentinfoList[index].name
                              .toString()
                              .replaceRange(
                                  0,
                                  1,
                                  providers.getstudentinfoList[index].name
                                      .toString()[0]
                                      .toUpperCase()),
                          style: MyStyle.fs16Bold.copyWith(letterSpacing: 0.8),
                        ),
                        trailing: Txtbtn(
                          navigator: () {
                            Navigate.push(
                                context,
                                Nextpage(
                                    student:
                                        providers.getstudentinfoList[index]));
                          },
                          text: "View Detail",
                          width: 100,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => ComanDilog(
                                  model: providers.getstudentinfoList[index]));
                        },
                      ),
                    )
                    // Divider(
                    //   color: Colors.blueAccent,
                    //   thickness: 1,
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
