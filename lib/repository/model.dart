import 'dart:convert';

class Studentinfo_model {
  String? studentid;
  String? name;
  Studentinfo_model({this.studentid, this.name});

  Studentinfo_model.fromstudentinfo(Map<String, dynamic> json, this.studentid)
      : name = json["name"];
}

class Attandance_model {
  String? attandance;
  String? studentid;
  String? name;
  Attandance_model({this.attandance, this.studentid, this.name});

  Attandance_model.fromattandanceinfo(Map<String, dynamic> json)
      : attandance = json["attandance"],
        studentid = json["studentid"],
        name = json["name"];
}
