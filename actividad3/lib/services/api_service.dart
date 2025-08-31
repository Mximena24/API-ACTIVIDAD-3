import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class ApiService {
  static const String baseUrl = "https://swapi.tech/api";

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse("$baseUrl/people"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data["results"] as List;

      List<Person> people = [];

      for (var item in results) {
        final personResponse = await http.get(Uri.parse(item["url"]));
        final personData = json.decode(personResponse.body);
        final properties = personData["result"]["properties"];
        people.add(Person.fromJson(properties));
      }

      return people;
    } else {
      throw Exception("Error al cargar personajes");
    }
  }
}
