import 'package:analog_clock/analog_clock.dart';
import 'package:attendance_app/repository/functions.dart';
import 'package:attendance_app/repository/model.dart';
import 'package:attendance_app/services/color_theme.dart';
import 'package:attendance_app/services/text_theme.dart';
import 'package:attendance_app/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Nextpage extends StatefulWidget {
  Studentinfo_model student;
  Nextpage({super.key, required this.student});

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  Widget build(BuildContext context) {
    var providers = Provider.of<FirebaseDataHandler>(context);
    print(widget.student.studentid);
    print(providers.getattandanceList.map((e) => e.studentid));
    List<Attandance_model> datamatch = providers.getattandanceList
        .where((element) => element.studentid == widget.student.studentid)
        .toList();
    print(datamatch.map((e) => e.attandance));
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text(widget.student.name.toString())),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              // AnalogClock(
              //   height: 0.2.sh,
              //   decoration: BoxDecoration(
              //       border: Border.all(width: 2.0, color: Colors.black),
              //       color: Colors.transparent,
              //       shape: BoxShape.circle),
              //   width: 160.0,
              //   isLive: true,
              //   hourHandColor: Colors.black,
              //   minuteHandColor: Colors.black,
              //   showSecondHand: false,
              //   numberColor: Colors.black87,
              //   showNumbers: true,
              //   showAllNumbers: false,
              //   textScaleFactor: 1.4,
              //   showTicks: false,
              //   showDigitalClock: true,
              //   datetime: DateTime.now(),
              // ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // ListTile(
                    //   title: Text(
                    //     DateTime.now().day.toString(),
                    //     style: TextStyle(color: Clr.white),
                    //   ),
                    //   subtitle: Column(
                    //     children: [
                    //       ...List.generate(
                    //           datamatch.length,
                    //           (index) =>
                    //               Text(datamatch[index].attandance.toString()))
                    //     ],
                    //   ),
                    // )
                    ...List.generate(
                        datamatch.length,
                        (index) => Text(
                              datamatch[index].attandance.toString(),
                              style: MyStyle.fs20Regular
                                  .copyWith(color: Clr.white),
                            ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
