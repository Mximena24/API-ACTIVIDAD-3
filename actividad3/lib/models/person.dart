class Person {
  final String name;
  final String height;
  final String mass;
  final String gender;

  Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.gender,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json["name"] ?? "",
      height: json["height"] ?? "",
      mass: json["mass"] ?? "",
      gender: json["gender"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "height": height,
      "mass": mass,
      "gender": gender,
    };
  }
}
