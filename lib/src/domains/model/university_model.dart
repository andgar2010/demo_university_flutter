import 'dart:convert';

class UniversityModel {
  UniversityModel({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
  });

  String alphaTwoCode;
  List<String> domains;
  String country;
  String? stateProvince;
  List<String> webPages;
  String name;

  UniversityModel copyWith({
    String? alphaTwoCode,
    List<String>? domains,
    String? country,
    String? stateProvince,
    List<String>? webPages,
    String? name,
  }) {
    final UniversityModel university = UniversityModel(
      alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
      domains: domains ?? this.domains,
      country: country ?? this.country,
      stateProvince: stateProvince ?? this.stateProvince,
      webPages: webPages ?? this.webPages,
      name: name ?? this.name,
    );
    return university;
  }

  factory UniversityModel.fromJson(String str) =>
      UniversityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UniversityModel.fromMap(Map<String, dynamic> json) {
    final UniversityModel university = UniversityModel(
      alphaTwoCode: json["alpha_two_code"],
      domains: List<String>.from(json["domains"].map((x) => x)),
      country: json["country"],
      stateProvince: json["state-province"],
      webPages: List<String>.from(json["web_pages"].map((x) => x)),
      name: json["name"],
    );
    return university;
  }

  Map<String, dynamic> toMap() {
    final Map<String, Object> map = {
      "alpha_two_code": alphaTwoCode,
      "domains": List<dynamic>.from(domains.map((x) => x)),
      "country": country,
      "state-province": stateProvince ?? '',
      "web_pages": List<dynamic>.from(webPages.map((x) => x)),
      "name": name,
    };
    return map;
  }
}
