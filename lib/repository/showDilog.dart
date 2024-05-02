import 'package:analog_clock/analog_clock.dart';
import 'package:attendance_app/repository/functions.dart';
import 'package:attendance_app/repository/model.dart';
import 'package:attendance_app/utils/navigate.dart';
import 'package:attendance_app/utils/space.dart';
import 'package:attendance_app/widget/btn_widget/txtbtn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

List<String> attandance = ["Absent", "Present"];

class ComanDilog extends StatelessWidget {
  Studentinfo_model model;
  ComanDilog({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var providers = Provider.of<FirebaseDataHandler>(context);
    return Dialog(
      backgroundColor: Colors.lime.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnalogClock(
              height: 0.2.sh,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  color: Colors.transparent,
                  shape: BoxShape.circle),
              width: 160.0,
              isLive: true,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              showSecondHand: false,
              numberColor: Colors.black87,
              showNumbers: true,
              showAllNumbers: false,
              textScaleFactor: 1.4,
              showTicks: false,
              showDigitalClock: true,
              datetime: DateTime.now(),
            ),
            Space.addheight(10),
            Row(
              children: [
                ...List.generate(
                  attandance.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Txtbtn(
                          navigator: () {
                            providers.setattandanceDataFirebase(
                                attandance[index],
                                model.studentid.toString(),
                                model.name.toString());

                            Navigate.back(context);
                          },
                          text: attandance[index]),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
