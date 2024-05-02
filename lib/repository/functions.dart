import 'package:attendance_app/repository/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseDataHandler extends ChangeNotifier {
  // Firebase FireStore
  final _firestore = FirebaseFirestore.instance;

  /////-----name-----////

  List<Studentinfo_model> _allstundentinfo = [];
  List<Studentinfo_model> get getstudentinfoList => _allstundentinfo;

  //  Set Data Firebase
  void setDataFirebase(String name) async {
    final json = {"name": name};
    await _firestore.collection("stundentinfo").add(json).then((value) {});
    notifyListeners();
  }

  //  Get Data Firebase
  void getFirebaseData() async {
    await _firestore.collection("stundentinfo").get().then((value) {
      final snapshot = value.docs
          .map((e) => Studentinfo_model.fromstudentinfo(e.data(), e.id))
          .toList();
      _allstundentinfo = snapshot;
    });
    notifyListeners();
  }

//   void attendanceData(Map<String, dynamic> attendance) async {
// // final json
//   }
  // void updateTaskToLocal(String ID, String updatedTask) {
  //   final taskIndex = _allAttandnace.indexWhere((element) => element.id == ID);
  //   _allAttandnace[taskIndex].name = updatedTask;

  //   notifyListeners();
  // }

  /////-----Attendance-----////
  List<Attandance_model> _allattandance = [];
  List<Attandance_model> get getattandanceList => _allattandance;

  //  Set Data Firebase
  void setattandanceDataFirebase(
      String attandance, String ID, String name) async {
    final json = {"attandance": attandance, "studentid": ID, "name": name};
    await _firestore.collection("attandance").add(json);
    notifyListeners();
  }

  //  Get Data Firebase
  void getattandanceFirebaseData() async {
    await _firestore.collection("attandance").get().then((value) {
      final snapshot = value.docs
          .map((e) => Attandance_model.fromattandanceinfo(e.data()))
          .toList();
      _allattandance = snapshot;
    });
    notifyListeners();
  }
}
