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
  String? Id;
  String? name;
  Attandance_model({this.attandance, this.Id, this.name});

  Attandance_model.fromattandanceinfo(Map<String, dynamic> json)
      : attandance = json["attandance"],
        Id = json["Id"],
        name = json["name"];
}
