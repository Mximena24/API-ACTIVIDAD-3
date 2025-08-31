import 'package:flutter/material.dart';
import '../models/person.dart';
import '../services/api_service.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personajes de Star Wars")),
      body: FutureBuilder<List<Person>>(
        future: apiService.fetchPeople(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay personajes"));
          } else {
            final people = snapshot.data!;
            return ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];
                return Card(
                  child: ListTile(
                    title: Text(person.name),
                    subtitle: Text(
                        "Altura: ${person.height} | Peso: ${person.mass}"),
                    trailing: Text(person.gender),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
